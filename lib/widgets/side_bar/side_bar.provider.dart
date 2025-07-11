part of 'side_bar.dart';

class SideBarProvider extends ChangeNotifier {

  final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  bool showBarrier = false;
  /// Modal for new appointment
  bool showNewAppointmentModal = false;
  DateTime? selectedDate;
  late String uuid = '';
  /// Modal for appointment details
  bool showAppointmentDetailsModal = false;
  AppointmentModel appointment = AppointmentModel.empty();
  double appointmentDetailsModalRightPosition = 16;
  /// Modal for clinical exam
  bool showClinicalExamModal = false;
  ClinicalExamModel clinicalExam = ClinicalExamModel.empty();

  void openOrCloseNewAppointmentModal({required BuildContext context, DateTime? date, String uuid = ''}) {
    showNewAppointmentModal = !showNewAppointmentModal;
    showBarrier = !showBarrier;
    selectedDate = date ?? DateTime.now();
    this.uuid = uuid;
    notifyListeners();
  }

  void openOrCloseAppointmentDetailsModal({required BuildContext context, required String uuid}) async {
    if(uuid.isNotEmpty) {
      (await ApiService.create(withAuth: true)).client.findAppointmentByUuid(uuid)
          .then((value) {
        appointment = value;
        showAppointmentDetailsModal = !showAppointmentDetailsModal;
        showBarrier = !showBarrier;
        notifyListeners();
      },);
    } else {
      showAppointmentDetailsModal = !showAppointmentDetailsModal;
      showBarrier = !showBarrier;
      notifyListeners();
    }
  }

  void openOrCloseClinicalExamModal() {
    showClinicalExamModal = !showClinicalExamModal;
    appointmentDetailsModalRightPosition = showClinicalExamModal ? - 350 : 16;
    notifyListeners();
  }

  void openEditAppointmentModal({required BuildContext context, required String uuid}) {
    showAppointmentDetailsModal = !showAppointmentDetailsModal;
    showBarrier = !showBarrier;
    this.uuid = uuid;
    notifyListeners();
    openOrCloseNewAppointmentModal(context: context, uuid: this.uuid);
  }

}
