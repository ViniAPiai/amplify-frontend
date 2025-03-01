
import 'package:frontend/models/medical_history/medical_history_model.dart';

class MedicalHistoryService {

  Future<MedicalHistoryModel> findByPatientUuid(String uuid) async{
    MedicalHistoryModel medicalHistory = MedicalHistoryModel.fromJson({
      "uuid": "39123u91239u913219",
      "hasDiabetes": false,
      "hasHypertension": false,
      "hasHeartProblems": false,
      "hasEpilepsy": false,
      "hasAsthma": false,
      "hasOsteoporosis": false,
      "allergies": null,
      "medications": null,
      "surgeries": null,
      "hasAnestheticAllergy": false,
      "hasBleedingIssues": false,
      "isPregnant": false,
      "pregnancyMonth": null
    });
    return medicalHistory;
  }

}