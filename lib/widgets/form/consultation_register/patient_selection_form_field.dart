import 'package:flutter/material.dart';
import 'package:flutter_easy_dropdown/flutter_easy_dropdown.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:frontend/models/user/user_model.dart';
import 'package:frontend/services/patient_service.dart';

import '../label.dart';

class PatientSelectionFormField extends StatelessWidget {
  final UserModel? model;
  final bool enabled;
  final ValueChanged<UserModel> onChanged;

  const PatientSelectionFormField({
    super.key,
    this.model,
    required this.enabled,
    required this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    AppLocalizations t = AppLocalizations.of(context)!;
    return Column(spacing: 16, mainAxisAlignment: MainAxisAlignment.start, children: [
      Label(label: t.patientList),
      DropdownSearch<UserModel>(
        onChanged: (UserModel? model) => onChanged(model!),
        itemAsString: (item) => item.fullName,
        filterFn: (item, filter) {
          return item.fullName.toLowerCase().contains(filter.toLowerCase());
        },
        mode: Mode.MENU,
        showSearchBox: true,
        showClearButton: true,
        dropdownSearchDecoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(color: Color(0xffabaaac), width: 2),
          ),
        ),
        popupBackgroundColor: Colors.white,
        onLoadMore: (text, offset) async {
          List<UserModel> patients = await PatientService.names(searchTerm: text, page: offset);
          if(patients.contains(model)) {
            return patients;
          }
          if(model == null) {
            return patients;
          }
          patients.insert(0, model!);
          return patients;
        },
      ),
    ]);
  }
}
