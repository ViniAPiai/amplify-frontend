
import 'package:dio/dio.dart';
import 'package:frontend/models/agenda_request.model.dart';
import 'package:frontend/models/appointment_type/appointment_type.model.dart';
import 'package:frontend/models/auth/auth_request_model.dart';
import 'package:frontend/models/auth/auth_response_model.dart';
import 'package:frontend/models/clinic/clinic_country.dart';
import 'package:frontend/models/consultation/appointment_model.dart';
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

@RestApi(baseUrl: "http://localhost:8080/api")
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
    Future<AppointmentModel> insertAppointment(@Body() AppointmentModel data);

    @GET('/erp/appointment/type/all')
    Future<List<AppointmentTypeModel>> getAppointmentTypes();

    @POST('/erp/appointment/clinic/agenda')
    Future<List<AppointmentModel>> secretaryAgenda(@Body() AgendaRequestModel data);

    @GET('/erp/procedure/type/all')
    Future<List<ProcedureTypeModel>> getProcedureTypes();

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

}