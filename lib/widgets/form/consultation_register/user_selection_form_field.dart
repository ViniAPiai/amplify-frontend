import 'package:flutter/material.dart';
import 'package:flutter_easy_dropdown/flutter_easy_dropdown.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:frontend/models/user/user_model.dart';

import '../label.dart';

class UserSelectionFormField extends StatelessWidget {
  final List<UserModel> items;
  final UserModel? model;
  final String label;
  final bool enabled;
  final ValueChanged<UserModel> onChanged;

  const UserSelectionFormField({
    super.key,
    this.model,
    required this.enabled,
    required this.onChanged,
    required this.label, required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(spacing: 16, mainAxisAlignment: MainAxisAlignment.start, children: [
      Label(label: label),
      DropdownSearch<UserModel>(
          items: items,
          onChanged: (UserModel? model) => onChanged(model!),
          itemAsString: (item) => item.fullName,
          selectedItem: model,
          filterFn: (item, filter) {
            return item.fullName.toLowerCase().contains(filter.toLowerCase());
          },
          mode: Mode.MENU,
          isFilteredOnline: true,
          showSearchBox: true,
          showClearButton: true,
          dropdownSearchDecoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: Color(0xffabaaac), width: 2),
            ),
          ),
          popupBackgroundColor: Colors.white,
      ),
    ]);
  }
}
