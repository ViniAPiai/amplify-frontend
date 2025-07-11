
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:frontend/models/agenda_request.model.dart';
import 'package:frontend/models/appointment/clinical_exam/clinical_exam.model.dart';
import 'package:frontend/models/appointment_type/appointment_type.model.dart';
import 'package:frontend/models/auth/auth_request_model.dart';
import 'package:frontend/models/auth/auth_response_model.dart';
import 'package:frontend/models/clinic/clinic_country.dart';
import 'package:frontend/models/appointment/appointment_model.dart';
import 'package:frontend/models/dentist_free_time/dentist_free_time_response.dart';
import 'package:frontend/models/dentist_free_time_request.dart';
import 'package:frontend/models/language/language.model.dart';
import 'package:frontend/models/page_request_model.dart';
import 'package:frontend/models/page_response_model.dart';
import 'package:frontend/models/patient/patient_model.dart';
import 'package:frontend/models/procedure_type/procedure_type.model.dart';
import 'package:frontend/models/user/user_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {

    factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

    /// Access endpoints

    @POST("/auth/sign_in")
    Future<AuthResponseModel> signIn(@Body() AuthRequestModel model);

    /// User endpoints
    @GET("/users/me")
    Future<UserModel> me();

    @PUT("/users/language/{code}")
    Future<UserModel> updateLanguage(@Path("code") String code);

    /// Appointment endpoints

    @POST("/erp/appointment/clinic")
    Future<AppointmentModel> insertAppointment(@Body() Map<String, dynamic> data);

    @GET('/erp/appointment/type/all')
    Future<List<AppointmentTypeModel>> getAppointmentTypes();

    @POST('/erp/appointment/clinic/agenda')
    Future<List<AppointmentModel>> secretaryAgenda(@Body() AgendaRequestModel data);

    @GET('/erp/procedure/type/all')
    Future<List<ProcedureTypeModel>> getProcedureTypes();

    @GET('/erp/appointment/{uuid}')
    Future<AppointmentModel> findAppointmentByUuid(@Path("uuid") String uuid);
    
    @PATCH('/erp/appointment/clinic/in_progress/{uuid}')
    Future<AppointmentModel> inProgressAppointmentByClinic(@Path("uuid") String uuid);

    @PATCH('/erp/appointment/clinic/patient_arrived/{uuid}')
    Future<AppointmentModel> patientArrivedAppointmentByClinic(@Path("uuid") String uuid);

    @PATCH('/erp/appointment/clinic/finish/{uuid}')
    Future<AppointmentModel> finishAppointmentByClinic(@Path("uuid") String uuid);

    @PATCH('/erp/appointment/clinic/cancel/{uuid}')
    Future<AppointmentModel> cancelAppointmentByClinic(@Path("uuid") String uuid);

    @PATCH('/erp/appointment/patient/cancel/{uuid}')
    Future<AppointmentModel> cancelAppointmentByPatient(@Path("uuid") String uuid);

    /// Dentist endpoints

    @GET('/erp/dentist/names')
    Future<List<UserModel>> dentistNames();

    @POST('/erp/dentist/{uuid}/free-time')
    Future<DentistFreeTimeResponse> freeTime(@Path("uuid") String uuid, @Body() DentistFreeTimeRequest data);

    @GET('/erp/nurse/names')
    Future<List<UserModel>> nurseNames();

    /// Patient endpoints

    @POST('/erp/patient/insert_by_clinic')
    Future<String> insertByClinic(@Body() PatientModel patient);

    @GET('/erp/patient/{uuid}')
    Future<PatientModel> findById(@Path("uuid") String uuid);

    @POST('/erp/patient/page/secretary')
    Future<PageResponseModel<PatientModel>> patientSecretaryPagination(@Body() PageRequestModel data);

    @POST('/erp/patient/names')
    Future<List<UserModel>> patientNames(@Body() PageRequestModel data);

    @GET('/erp/language')
    Future<List<LanguageModel>> getLanguages();

    @GET('/erp/clinic/country')
    Future<ClinicCountry> getCountry();

    /// Clinical exam endpoints

    @POST('/erp/clinical_exam/{uuid}')
    Future<ClinicalExamModel> insertOrUpdateClinicalExam(@Body() ClinicalExamModel data, @Path("uuid") String uuid);

}