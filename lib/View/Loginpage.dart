import 'dart:developer';

import 'package:attendanceapp/Controller/controller.dart';
import 'package:attendanceapp/View/Adminpage.dart';
import 'package:attendanceapp/View/Teacherspage.dart';
import 'package:attendanceapp/View/Widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final conroller = Get.put(Controller());

  final _auth = FirebaseAuth.instance;
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 39),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    loginandregisterationheading("Login"),
                    const SizedBox(
                      height: 33,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white70,
                      ),
                      child: TextFormField(
                        controller: emailcontroller,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your email";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            hintText: "Enter Your Email",
                            hintStyle: const TextStyle(
                                color: Color.fromRGBO(160, 160, 160, 100)),
                            prefixIcon: Icon(
                              Icons.mail_outline,
                              color: Colors.black,
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white70,
                      ),
                      child: Obx(() {
                        return TextFormField(
                          obscureText: conroller.isitobscure.value,
                          controller: passwordcontroller,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter password";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    conroller.checkifobscure();
                                  },
                                  icon: conroller.isitobscure.value
                                      ? Icon(Icons.visibility_off_outlined)
                                      : Icon(Icons.visibility_outlined)),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              hintText: "Enter Your Password",
                              hintStyle: const TextStyle(
                                  color: Color.fromRGBO(160, 160, 160, 100)),
                              prefixIcon: Icon(
                                Icons.lock_open_outlined,
                                color: Colors.black,
                              )),
                        );
                      }),
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    Container(
                        height: 42,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8)),
                        child: ElevatedButton(
                            onPressed: () {
                              if (emailcontroller.text == "admin@gmail.com" &&
                                  passwordcontroller.text == "admin@143") {
                                log("success");
                                Get.to(AdminPage());
                              } else {
                                signIn(emailcontroller.text,
                                    passwordcontroller.text);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(41, 41, 41, 100),
                            ),
                            child: const Text("Login")))
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: loginbottomtext());
  }

  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => {
                Fluttertoast.showToast(msg: "Logged in!"),
                Get.to(TeachersPage())
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }
}
