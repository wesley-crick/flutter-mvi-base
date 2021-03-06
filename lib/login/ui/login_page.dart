import 'package:flutter_demo_app/core/contract/get_x_page.dart';
import 'package:flutter_demo_app/core/network/rest_client.dart';
import 'package:flutter_demo_app/login/network/user_rest_client.dart';
import 'package:flutter_demo_app/login/repository/user_repository.dart';
import 'package:flutter_demo_app/login/ui/login_view.dart';
import 'package:flutter_demo_app/login/viewmodel/login_page_view_model.dart';
import 'package:get/get.dart';

class LoginPage implements GetXPage {

  @override
  GetPage getPage() {
    return GetPage(
      name: '/',
      page: () => LoginView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<LoginPageViewModel>(() => LoginPageViewModel());
        Get.lazyPut<UserRestClient>(() => UserRestClient(RestClient().dio));
        Get.lazyPut<UserRepository>(() => UserRepository());
      }),
    );
  }
}