import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:registration_login/feature/register/data/model/registration_model.dart';
import 'package:registration_login/feature/register/presentation/controller/registration_controller.dart';

class ScreenPage extends StatelessWidget {
  ScreenPage({Key? key}) : super(key: key);
  bool isloading = false;
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController repasswordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Form(
            child: Column(
              children: [
                Consumer(
                  builder: (context, ref, child) {
                    final data =
                        ref.watch(registrationconrtolProvider.notifier);
                    return isloading
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: () async {
                              RegistrationModel registrationModel =
                                  RegistrationModel(
                                name: namecontroller.text,
                                email: emailcontroller.text,
                                password: passwordcontroller.text,
                                repassword: repasswordcontroller.text,
                              );
                            },
                            child: const Text('Button'));
                  },
                ),
                TextFormField(
                  controller: namecontroller,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    hintText: 'enter your name',
                  ),
                ),
                TextFormField(
                  controller: emailcontroller,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    hintText: 'enter your email',
                  ),
                ),
                TextFormField(
                  controller: passwordcontroller,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    hintText: 'enter password',
                  ),
                ),
                TextFormField(
                  controller: repasswordcontroller,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    hintText: 'Re-enter password',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
