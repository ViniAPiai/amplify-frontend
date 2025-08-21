
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:frontend/bloc/crm/crm_bloc.dart';
import 'package:frontend/bloc/crm/crm_event.dart';
import 'package:frontend/bloc/crm/crm_state.dart';
import 'package:frontend/bloc/crm/new_column/new_crm_column_bloc.dart';
import 'package:frontend/bloc/crm/new_column/new_crm_column_event.dart';
import 'package:frontend/bloc/locale/locale_bloc.dart';
import 'package:frontend/bloc/side_bar/side_bar_bloc.dart';
import 'package:frontend/bloc/side_bar/side_bar_event.dart';
import 'package:frontend/configs/app_colors.dart';
import 'package:frontend/extension/locale_extension.dart';
import 'package:frontend/l10n/app_localizations.dart';
import 'package:frontend/modals/new_crm_column.modal.dart';
import 'package:frontend/models/crm/card/card.model.dart';
import 'package:frontend/models/crm/card_type_enum.dart';
import 'package:frontend/models/simple/simple_response.dart';
import 'package:frontend/widgets/form/label.dart';
import 'package:frontend/widgets/kanban_board/kanban_board_two.dart';
import 'package:frontend/widgets/locale_changer/locale_changer.dart';
import 'package:frontend/widgets/side_bar/side_bar.dart';
import 'package:frontend/widgets/text/header_title.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:toastification/toastification.dart';

part 'crm.mobile.dart';

part 'crm.tablet.dart';

part 'crm.desktop.dart';

class Crm extends StatefulWidget {
  static const String routeName = 'crm';
  static const String route = '/$routeName';

  const Crm({super.key});

  @override
  createState() => _CrmScreen();
}

class _CrmScreen extends State<Crm> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => _CrmMobile(),
      tablet: (context) => _CrmTablet(),
      desktop: (context) => _CrmDesktop(),
    );
  }
}
