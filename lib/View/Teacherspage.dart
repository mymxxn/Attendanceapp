import 'dart:ffi';

import 'package:attendanceapp/Model/user_model.dart';
import 'package:attendanceapp/View/AttendancePage.dart';
import 'package:attendanceapp/View/Loginpage.dart';
import 'package:attendanceapp/View/ViewStudentspage.dart';
import 'package:attendanceapp/View/Widgets/Widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class TeachersPage extends StatefulWidget {
  const TeachersPage({Key? key}) : super(key: key);

  @override
  State<TeachersPage> createState() => _TeachersPageState();
}

class _TeachersPageState extends State<TeachersPage> {
  User? user = FirebaseAuth.instance.currentUser;

  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 32.5,
                  backgroundImage: AssetImage("assets/mmm.png"),
                ),
                const SizedBox(
                  width: 14,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hi,",
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                    ),
                    Text(
                      "${loggedInUser.firstname}",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                    ),
                    Text(
                      "${loggedInUser.email} \n${loggedInUser.phonenum}",
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 9),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 151,
                      height: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 15,
                                spreadRadius: -15,
                                offset: Offset(0, 15))
                          ],
                          color: Colors.white),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              icon: const Icon(Icons.note_outlined),
                              onPressed: () {
                                Get.to(() => AttendancePage());
                              }),
                          Text("Attendance")
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 151,
                      height: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 15,
                                spreadRadius: -15,
                                offset: Offset(0, 15))
                          ],
                          color: Colors.white),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              icon: const Icon(Icons.note_outlined),
                              onPressed: () {
                                Get.to(() => ViewStudentsPage());
                              }),
                          Text("View Students")
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 82,
            ),
            Container(
                height: 42,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8)),
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => LoginPage());
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(41, 41, 41, 100),
                    ),
                    child: const Text("Log Out")))
          ],
        ),
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }
}
