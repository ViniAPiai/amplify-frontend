import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/configs/app_colors.dart';
import 'package:frontend/configs/sign_in_required_redirect_query.dart';
import 'package:frontend/enums/tooth_code.dart';
import 'package:frontend/extension/locale_extension.dart';
import 'package:frontend/models/appointment_type/appointment_type.model.dart';
import 'package:frontend/models/consultation/appointment_model.dart';
import 'package:frontend/models/dentist_free_time/time_range.dart';
import 'package:frontend/models/procedure_type/procedure_type.model.dart';
import 'package:frontend/models/user/user_model.dart';
import 'package:frontend/screens/agenda/agenda.dart';
import 'package:frontend/services/appointment_service.dart';
import 'package:frontend/services/appointment_type_service.dart';
import 'package:frontend/services/dentist_service.dart';
import 'package:frontend/services/nurse_service.dart';
import 'package:frontend/services/patient_service.dart';
import 'package:frontend/services/procedure_type_service.dart';
import 'package:frontend/widgets/buttons/add_date_button.dart';
import 'package:frontend/widgets/buttons/filter_button.dart';
import 'package:frontend/widgets/buttons/remove_button.dart';
import 'package:frontend/widgets/form/consultation_register/date_picker_button.dart';
import 'package:frontend/widgets/form/consultation_register/patient_selection_form_field.dart';
import 'package:frontend/widgets/form/consultation_register/time_picker_button.dart';
import 'package:frontend/widgets/form/label.dart';
import 'package:frontend/widgets/side_bar/side_bar.dart';
import 'package:frontend/widgets/text/header_title.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:katana_router/katana_router.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:searchable_listview/searchable_listview.dart';
import 'package:toastification/toastification.dart';

part 'new_appointment.page.dart';
part 'new_appointment.provider.dart';
part 'new_appointment.mobile.dart';
part 'new_appointment.tablet.dart';
part 'new_appointment.desktop.dart';

@PagePath("/new_appointment",/* redirect: [SignInRequiredRedirectQuery()]*/)
class NewAppointmentPage extends StatefulWidget {

  const NewAppointmentPage({super.key});

  @pageRouteQuery
  static const query = _$NewAppointmentPageQuery();

  @override
  State<NewAppointmentPage> createState() => _NewAppointmentPageState();
}

class _NewAppointmentPageState extends State<NewAppointmentPage> {

  @override
  void initState() {
    super.initState();
    Provider.of<NewAppointmentProvider>(context, listen: false).load();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => _NewAppointmentMobile(),
      tablet: (context) => _NewAppointmentTablet(),
      desktop: (context) => _NewAppointmentDesktop(),
    );
  }
}