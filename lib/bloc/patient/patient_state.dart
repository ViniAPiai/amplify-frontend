import 'package:equatable/equatable.dart';
import 'package:frontend/models/page_response_model.dart';
import 'package:frontend/models/patient/patient_model.dart';

class PatientState extends Equatable {
  final String searchTerm;
  final bool isLoading;
  final PageResponseModel<PatientModel> patients;
  final int selectedPage;

  const PatientState({
    required this.patients,
    this.searchTerm = '',
    this.isLoading = true,
    this.selectedPage = 1,
  });

  PatientState copyWith({
    String? searchTerm,
    bool? isLoading,
    PageResponseModel<PatientModel>? patients,
    int? selectedPage,
  }) {
    return PatientState(
      searchTerm: searchTerm ?? this.searchTerm,
      isLoading: isLoading ?? this.isLoading,
      patients: patients ?? this.patients,
      selectedPage: selectedPage ?? this.selectedPage,
    );
  }

  @override
  List<Object?> get props => [searchTerm, isLoading, patients, selectedPage];
}
