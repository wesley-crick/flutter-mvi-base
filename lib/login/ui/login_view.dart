import 'package:flutter/material.dart';
import 'package:flutter_demo_app/util/dimens.dart';
import 'package:get/get.dart';
import '../../util/form_factor.dart';
import '../viewmodel/login_page_action.dart';
import '../viewmodel/login_page_view_model.dart';

class LoginView extends StatelessWidget {

  final LoginPageViewModel viewModel = Get.find();

  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: AppBar(
          title: const Text("Title"),
        ),
        body: LayoutBuilder(
            builder: (context, constraints) =>
                Container(
                  padding: constraints.maxWidth < FormFactor.handset
                      ? EdgeInsets.zero
                      : const EdgeInsets.all(30.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextFormField(
                          decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: "Email address:"),
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: "Password:"),
                        ),
                        Container(
                          height: 24,
                        ),
                        _buildEnterButton(),
                        Container(
                          height: 24,
                        ),
                        TextButton(
                            onPressed: () => viewModel.send(
                                OnResetClicked()
                            ),
                            child: const Text("RESET")
                        )
                      ],
                    ),
                  ),
                )),
      );

  Widget _buildEnterButton() =>
      GetBuilder<LoginPageViewModel>(
          builder: (vm) => !vm.state.isLoading ?
          ElevatedButton(
            onPressed: () {
              vm.send(OnEnterClicked());
            },
            child: const Text("Enter"),
          ) :
          ElevatedButton(
            onPressed: null,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: const [
                SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),

                Text(" Loading")
              ],
            ),
          )
      );
}
