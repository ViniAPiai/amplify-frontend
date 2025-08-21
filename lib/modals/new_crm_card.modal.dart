import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:frontend/bloc/crm/crm_bloc.dart';
import 'package:frontend/bloc/crm/crm_event.dart';
import 'package:frontend/bloc/crm/new_card/new_crm_card_bloc.dart';
import 'package:frontend/bloc/crm/new_card/new_crm_card_event.dart';
import 'package:frontend/bloc/crm/new_card/new_crm_card_state.dart';
import 'package:frontend/bloc/locale/locale_bloc.dart';
import 'package:frontend/bloc/side_bar/side_bar_bloc.dart';
import 'package:frontend/bloc/side_bar/side_bar_event.dart';
import 'package:frontend/configs/app_colors.dart';
import 'package:frontend/extension/locale_extension.dart';
import 'package:frontend/l10n/app_localizations.dart';
import 'package:frontend/models/crm/card_type_enum.dart';
import 'package:frontend/widgets/form/label.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:toastification/toastification.dart';

class NewCrmCardModal extends StatefulWidget {
  const NewCrmCardModal({super.key});

  @override
  State<NewCrmCardModal> createState() => _NewCrmCardModalState();
}

class _NewCrmCardModalState extends State<NewCrmCardModal> {
  final GlobalKey<FormState> _defaultFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _getInTouchFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _patientFormKey = GlobalKey<FormState>();

  /// Controllers for the form fields of the default card type
  final TextEditingController tecTitle = TextEditingController();
  final TextEditingController tecDescription = TextEditingController();
  final TextEditingController tecDueDate = TextEditingController();

  /// Controllers for the form fields of the get in touch card type
  final TextEditingController tecGetInTouchName = TextEditingController();
  final TextEditingController tecGetInTouchEmail = TextEditingController();
  final TextEditingController tecGetInTouchPhone = TextEditingController();
  final TextEditingController tecGetInTouchMessage = TextEditingController();

  @override
  void initState() {
    super.initState();
    tecTitle.addListener(() => context.read<NewCrmCardBloc>().add(NewCrmCardUpdateFields(title: tecTitle.text)));
    tecDescription.addListener(() => context.read<NewCrmCardBloc>().add(NewCrmCardUpdateFields(defaultDescription: tecDescription.text)));
    tecDueDate.addListener(() => context.read<NewCrmCardBloc>().add(NewCrmCardUpdateFields(defaultDueDate: DateTime.parse(tecDueDate.text))));
    tecGetInTouchName.addListener(() => context.read<NewCrmCardBloc>().add(NewCrmCardUpdateFields(getInTouchName: tecGetInTouchName.text)));
    tecGetInTouchEmail.addListener(() => context.read<NewCrmCardBloc>().add(NewCrmCardUpdateFields(getInTouchEmail: tecGetInTouchEmail.text)));
    tecGetInTouchPhone.addListener(() => context.read<NewCrmCardBloc>().add(NewCrmCardUpdateFields(getInTouchPhone: tecGetInTouchPhone.text)));
    tecGetInTouchMessage.addListener(() => context.read<NewCrmCardBloc>().add(NewCrmCardUpdateFields(getInTouchMessage: tecGetInTouchMessage.text)));
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations t = AppLocalizations.of(context)!;
    return BlocListener<NewCrmCardBloc, NewCrmCardState>(
      listener: (context, state) {
        if (state.isSuccess) {
          context.read<SideBarBloc>().add(ToggleNewCardModal(columnUuid: ''));
          toastification.show(
              title: Text(
                state.message.message!,
                style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              type: ToastificationType.success,
              style: ToastificationStyle.minimal);
          context.read<CrmBloc>().add(CrmLoadBoard());
        }
      },
      child: BlocBuilder<NewCrmCardBloc, NewCrmCardState>(builder: (context, state) {
        return Container(
          height: context.height,
          width: 700,
          padding: EdgeInsets.all(32),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6)),
          child: state.isLoading
              ? Center(child: CircularProgressIndicator(color: AppColors.primary))
              : Column(
            spacing: 16,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    t.crmColumnAddNewCard,
                    style: GoogleFonts.montserrat(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  IconButton(onPressed: () => Navigator.of(context).pop(), icon: Icon(Icons.close, color: AppColors.black)),
                ],
              ),
              Divider(),
              Label(label: t.crmColumn),
              TextFormField(
                controller: TextEditingController(text: state.column.name),
                readOnly: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              Label(label: t.crmCardType),
              DropdownButtonFormField(
                  value: state.cardType,
                  onChanged: (value) => context.read<NewCrmCardBloc>().add(NewCrmCardUpdateFields(cardType: value)),
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  items: CardTypeEnum.values.map((e) => DropdownMenuItem(value: e, child: Text(e.getName(context)))).toList()),
              Divider(),
              SingleChildScrollView(
                child: state.cardType == CardTypeEnum.defaultType ? _defaultCardForm() : _getInTouchForm(),
              ).expanded(),
              TextButton(
                  onPressed: () {
                    switch(state.cardType) {
                      case CardTypeEnum.defaultType:
                        if (_defaultFormKey.currentState!.validate()) {
                          context.read<NewCrmCardBloc>().add(NewCrmCardInsert());
                        }
                        break;
                      case CardTypeEnum.getInTouchType:
                        if (_getInTouchFormKey.currentState!.validate()) {
                          context.read<NewCrmCardBloc>().add(NewCrmCardInsert());
                        }
                        break;
                      case CardTypeEnum.patientType:
                    }
                  },
                  child: Text(state.isEditing ? t.update : t.register,
                      style: GoogleFonts.montserrat(color: AppColors.primary, fontWeight: FontWeight.w500, fontSize: 18)))
                  .alignAtCenterRight()
            ],
          ),
        );
      }),
    );
  }

  Form _defaultCardForm() {
    AppLocalizations t = AppLocalizations.of(context)!;
    LocaleBloc localeBloc = context.read<LocaleBloc>();
    DateFormat dateFormat = DateFormat.yMd(context.getLocaleString(localeBloc.state.locale));
    return Form(
      key: _defaultFormKey,
      child: BlocBuilder<NewCrmCardBloc, NewCrmCardState>(
          builder: (context, state) {
            return Column(
              spacing: 16,
              children: [
                Label(label: t.crmTitle),
                TextFormField(
                  controller: tecTitle,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  validator: RequiredValidator(errorText: "${t.crmTitle} ${t.isMandatory}").call,
                ),
                Label(label: t.crmDescription),
                TextFormField(
                  controller: tecDescription,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  maxLines: 15,
                  validator: RequiredValidator(errorText: "${t.crmDescription} ${t.isMandatory}").call,
                ),
                Label(label: t.crmDueDate),
                TextFormField(
                  controller: TextEditingController(text: dateFormat.format(state.defaultDueDate)),
                  readOnly: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                          onPressed: () {
                            showDatePicker(
                                context: context,
                                barrierDismissible: false,
                                locale: localeBloc.state.locale,
                                initialDatePickerMode: DatePickerMode.day,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2100))
                                .then((value) {
                              if (value != null) {
                                context.read<NewCrmCardBloc>().add(NewCrmCardUpdateFields(defaultDueDate: value));
                              }
                            });
                          },
                          icon: Icon(Icons.calendar_month))),
                  validator: RequiredValidator(errorText: "${t.crmDueDate} ${t.isMandatory}").call,
                )
              ],
            );
          }
      ),
    );
  }

  Form _getInTouchForm() {
    AppLocalizations t = AppLocalizations.of(context)!;
    return Form(
        key: _getInTouchFormKey,
        child: BlocBuilder<NewCrmCardBloc, NewCrmCardState>(
            builder: (context, state) {
              return Column(
                spacing: 16,
                children: [
                  Label(label: t.crmTitle),
                  TextFormField(
                    controller: tecTitle,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    validator: RequiredValidator(errorText: "${t.crmTitle} ${t.isMandatory}").call,
                  ),
                  Label(label: t.crmName),
                  TextFormField(
                    controller: tecGetInTouchName,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    validator: RequiredValidator(errorText: "${t.crmName} ${t.isMandatory}").call,
                  ),
                  Label(label: t.crmEmail),
                  TextFormField(
                    controller: tecGetInTouchEmail,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    validator: MultiValidator([
                      RequiredValidator(errorText: "${t.crmEmail} ${t.isMandatory}"),
                      EmailValidator(errorText: "${t.crmEmail} ${t.validMustBeInformed}")
                    ]).call,
                  ),
                  Label(label: t.crmPhone),
                  TextFormField(
                    controller: tecGetInTouchPhone,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    validator: RequiredValidator(errorText: "${t.crmPhone} ${t.isMandatory}").call
                  ),
                  Label(label: t.crmMessage),
                  TextFormField(
                    controller: tecGetInTouchMessage,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    maxLines: 15,
                    validator: RequiredValidator(errorText: "${t.crmMessage} ${t.isMandatory}").call,
                  ),
                ],
              );
            }
        ));
  }
}
