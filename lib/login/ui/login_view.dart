import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../viewmodel/login_page_action.dart';
import '../viewmodel/login_page_view_model.dart';

class LoginView extends StatelessWidget {

  LoginView({Key? key}) : super(key: key) {
    LoginPageViewModel vm = Get.find();
    vm.send(GetUsers());
  }

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: AppBar(
          title: const Text("List 'O Names"),
        ),
        body: _buildBody()
      );

  final TextEditingController nameController = TextEditingController();
  Widget _buildBody() => GetBuilder<LoginPageViewModel>(
      builder: (vm) {
        nameController.text = vm.state.name;

        return Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: "Enter name: "),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: vm.state.isLoading ? null : () {
                    vm.send(GetRandomUser());
                  },
                  child: const Text("Random Name"),
                ),
                ElevatedButton(
                  onPressed: () {
                    vm.send(SaveName(nameController.text));
                  },
                  child: const Text("Save"),
                )
              ],
            ),
            Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: vm.state.users.map(
                          (user) =>
                              Text(user.name)
                  ).toList(),
                ),
            ),
          ],
        );
      }
  );
}
