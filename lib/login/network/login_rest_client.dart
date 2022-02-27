import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import 'model/user_dto.dart';

part 'login_rest_client.g.dart';

@RestApi(baseUrl: "https://gorest.co.in/public-api")
abstract class LoginRestClient {
  factory LoginRestClient(Dio dio, {String baseUrl}) = _LoginRestClient;

  @GET("/users")
  Future<ResponseData<UserDto>> getUsers();
}