import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../core/network/response_data.dart';
import 'model/user_dto.dart';

part 'user_rest_client.g.dart';

@RestApi(baseUrl: "https://gorest.co.in/public-api")
abstract class UserRestClient {
  factory UserRestClient(Dio dio, {String baseUrl}) = _UserRestClient;

  @GET("/users")
  Future<ResponseData<UserDto>> getUsers();
}