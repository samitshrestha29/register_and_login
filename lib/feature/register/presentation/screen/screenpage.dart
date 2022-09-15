import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/model/registration_model.dart';
import '../controller/registration_controller.dart';

class ScreenPage extends StatefulWidget {
  const ScreenPage({Key? key}) : super(key: key);

  @override
  State<ScreenPage> createState() => _ScreenPageState();
}

class _ScreenPageState extends State<ScreenPage> {
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
                customFormfield(
                  controller: namecontroller,
                  hinttext: "entre your name",
                  textInputType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                ),
                customFormfield(
                  controller: emailcontroller,
                  hinttext: "enter your email",
                  textInputType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                ),
                customFormfield(
                  controller: passwordcontroller,
                  hinttext: "entre your password",
                  textInputType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.next,
                ),
                customFormfield(
                  controller: repasswordcontroller,
                  hinttext: "Re-entre password",
                  textInputType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                ),
                Consumer(
                  builder: (context, ref, child) {
                    // var registrationconrtolProvider;
                    // final data =
                    //     ref.watch(registrationconrtolProvider;
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
                              ref
                                  .read(registrationconrtolProvider.notifier)
                                  .postuserr(registrationModel, context);

                              setState(() {
                                isloading = true;
                              });
                            },
                            child: const Text('Button'),
                          );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class customFormfield extends StatelessWidget {
  const customFormfield({
    Key? key,
    required this.controller,
    required this.hinttext,
    required this.textInputType,
    required this.textInputAction,
  }) : super(key: key);
  final String hinttext;
  final TextEditingController controller;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        labelText: hinttext,
      ),
    );
  }
}
