import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../commons/customformfield.dart';
import '../../data/model/registration_request_model.dart';
import '../controller/registration_controller.dart';

class ScreenPage extends ConsumerStatefulWidget {
  const ScreenPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ScreenPageState();
}

class _ScreenPageState extends ConsumerState<ScreenPage> {
  bool isloading = false;

  late TextEditingController namecontroller = TextEditingController();

  TextEditingController emailcontroller = TextEditingController();

  TextEditingController passwordcontroller = TextEditingController();

  TextEditingController repasswordcontroller = TextEditingController();
  final GlobalKey<FormState> _hellokey = GlobalKey<FormState>();
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _hellokey,
          child: Column(
            children: [
              CustomFormField(
                validator: (name) {
                  return namecontroller.text.isEmpty ? "Enter name" : null;
                },
                controller: namecontroller,
                hinttext: "enter your name",
                textInputType: TextInputType.name,
              ),
              CustomFormField(
                controller: emailcontroller,
                hinttext: "enter your email",
                textInputType: TextInputType.emailAddress,
                validator: (value) {
                  String pattern =
                      r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  return RegExp(pattern).hasMatch(value!)
                      ? null
                      : 'Enter Valid Email';
                },
              ),
              CustomFormField(
                suffix: InkWell(
                  onTap: () {
                    setState(() {
                      // isObscure == true ? isObscure = false : isObscure = true;
                      isObscure = !isObscure;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Icon(
                      isObscure ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                ),
                controller: passwordcontroller,
                hinttext: "enter your password",
                textInputType: TextInputType.visiblePassword,
                obsure: isObscure,
                validator: (value) {
                  return value!.length < 8
                      ? "Please enter number more than 8 digits"
                      : null;
                },
              ),
              CustomFormField(
                suffix: InkWell(
                  onTap: (() {
                    setState(
                      () {
                        isObscure = !isObscure;
                      },
                    );
                  }),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Icon(
                        isObscure ? Icons.visibility : Icons.visibility_off),
                  ),
                ),
                controller: repasswordcontroller,
                hinttext: "Re-enter password",
                textInputType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                obsure: isObscure,
                validator: (value) {
                  if (passwordcontroller.text == repasswordcontroller.text) {
                    return null;
                  } else {
                    return "Confirm passsword does not match";
                  }
                },
              ),

              // final data =
              //     ref.watch(registrationconrtolProvider;
              isloading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () async {
                        if (_hellokey.currentState!.validate()) {
                          setState(() {
                            isloading = true;
                          });
                          RegistrationModel registrationModel =
                              RegistrationModel(
                            name: namecontroller.text,
                            email: emailcontroller.text,
                            password: passwordcontroller.text,
                            repassword: repasswordcontroller.text,
                          );
                          await ref
                              .read(registrationconrtolProvider.notifier)
                              .postuserr(registrationModel, context);
                          setState(() {
                            isloading = false;
                          });
                        }
                      },
                      child: const Text('Register'),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
