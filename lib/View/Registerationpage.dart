import 'package:attendanceapp/Controller/controller.dart';
import 'package:attendanceapp/Model/user_model.dart';
import 'package:attendanceapp/view/Widgets/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class RegisterationPage extends StatelessWidget {
  RegisterationPage({Key? key}) : super(key: key);
  final namecontroller = TextEditingController();
  final mailcontroller = TextEditingController();
  final phonecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  final conroller = Get.put(Controller());

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
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  loginandregisterationheading("Registeration"),
                  SizedBox(
                    height: 33,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white70,
                    ),
                    child: TextFormField(
                      controller: namecontroller,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter name";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Enter Your Name",
                          hintStyle: const TextStyle(
                              color: Color.fromRGBO(160, 160, 160, 100)),
                          prefixIcon: Icon(
                            Icons.person_outline,
                            color: Colors.black,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white70,
                    ),
                    child: TextFormField(
                      controller: mailcontroller,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter mail";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Enter Your Mail",
                          hintStyle: const TextStyle(
                              color: Color.fromRGBO(160, 160, 160, 100)),
                          prefixIcon: Icon(
                            Icons.mail_outline,
                            color: Colors.black,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white70,
                    ),
                    child: TextFormField(
                      controller: phonecontroller,
                      validator: (value) {
                        if (value!.isEmpty && value.length != 10) {
                          return "Please enter valid number";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Enter Your Phone",
                          hintStyle: const TextStyle(
                              color: Color.fromRGBO(160, 160, 160, 100)),
                          prefixIcon: Icon(
                            Icons.call_outlined,
                            color: Colors.black,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white70,
                    ),
                    child: Obx(() {
                      return TextFormField(
                        controller: passwordcontroller,
                        obscureText: conroller.isitobscure.value,
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
                              Icons.lock_outline,
                              color: Colors.black,
                            )),
                      );
                    }),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                      height: 42,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8)),
                      child: ElevatedButton(
                          onPressed: () {
                            signUp(
                                mailcontroller.text, passwordcontroller.text);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(41, 41, 41, 100),
                          ),
                          child: const Text("Register")))
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: registerbottombutton(),
    );
  }

  void signUp(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirebase()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  postDetailsToFirebase() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    UserModel userModel = UserModel();
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstname = namecontroller.text;
    userModel.phonenum = phonecontroller.text;
    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successful!");
    Get.back();
  }
}
