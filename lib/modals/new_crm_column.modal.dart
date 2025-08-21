import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:frontend/bloc/crm/new_column/new_crm_column_bloc.dart';
import 'package:frontend/bloc/crm/new_column/new_crm_column_event.dart';
import 'package:frontend/bloc/crm/new_column/new_crm_column_state.dart';
import 'package:frontend/configs/app_colors.dart';
import 'package:frontend/l10n/app_localizations.dart';
import 'package:frontend/widgets/form/label.dart';
import 'package:google_fonts/google_fonts.dart';

class NewCrmColumnModal extends StatefulWidget {
  const NewCrmColumnModal({super.key});

  @override
  State<NewCrmColumnModal> createState() => _NewCrmColumnModalState();
}

class _NewCrmColumnModalState extends State<NewCrmColumnModal> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController tecName = TextEditingController();

  @override
  void initState() {
    super.initState();
    tecName.addListener(() => context.read<NewCrmColumnBloc>().add(NewCrmColumnUpdateFields(name: tecName.text)));
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations t = AppLocalizations.of(context)!;
    return AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        alignment: Alignment.centerRight,
        content: BlocListener<NewCrmColumnBloc, NewCrmColumnState>(
          listener: (context, state) {},
          child: BlocBuilder<NewCrmColumnBloc, NewCrmColumnState>(builder: (context, state) {
            return Container(
                width: 700,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6)),
                child: Form(
                  key: _formKey,
                  child: Column(
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
                      Label(label: t.crmName),
                      TextFormField(
                          controller: tecName,
                          decoration: InputDecoration(border: OutlineInputBorder()),
                          validator: RequiredValidator(errorText: '${t.crmName}${t.isMandatory}').call),
                      Label(label: t.crmWhichSideOfColumn(state.refColumnName)),
                      DropdownButtonFormField<NewCrmColumnDirection>(
                        items: NewCrmColumnDirection.values.map((e) => DropdownMenuItem(value: e, child: Text(e.getValue(context)))).toList(),
                        onChanged: (value) => context.read<NewCrmColumnBloc>().add(NewCrmColumnUpdateFields(direction: value)),
                        value: state.direction,
                        decoration: InputDecoration(border: OutlineInputBorder()),
                      )
                    ],
                  ),
                ));
          }),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(t.cancel),
          ),
        ]);
  }
}
