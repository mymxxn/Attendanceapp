import 'package:attendanceapp/Model/student_model.dart';
import 'package:attendanceapp/Model/user_model.dart';
import 'package:attendanceapp/View/Widgets/Widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class AddStudentPage extends StatelessWidget {
  AddStudentPage({Key? key}) : super(key: key);
  final studentnamecontroller = TextEditingController();
  final rollnumcontroller = TextEditingController();
  final departmentcontroller = TextEditingController();
  final semestercontroller = TextEditingController();
  final _auth = FirebaseAuth.instance;
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainappbar("Add Student"),
      body: Form(
        key: _formkey,
        child: Column(
          children: [
            CircleAvatar(
              radius: 46,
              backgroundImage: AssetImage("assets/mmm.png"),
            ),
            Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    TextFormField(
                        controller: studentnamecontroller,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter name";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Enter Name",
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(8)),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 13),
                        )),
                    SizedBox(
                      height: 21,
                    ),
                    TextFormField(
                        controller: rollnumcontroller,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Roll number";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Roll Number",
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(8)),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 13),
                        )),
                    SizedBox(
                      height: 21,
                    ),
                    TextFormField(
                        controller: departmentcontroller,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Department";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Enter Department",
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(8)),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 13),
                        )),
                    SizedBox(
                      height: 21,
                    ),
                    TextFormField(
                        controller: semestercontroller,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Semester";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Enter Semester",
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(8)),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 13),
                        )),
                    SizedBox(
                      height: 42,
                    ),
                    Container(
                        height: 42,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8)),
                        child: ElevatedButton(
                            onPressed: () {
                              addDetails();
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(41, 41, 41, 100),
                            ),
                            child: const Text("Add Details")))
                  ],
                ))
          ],
        ),
      ),
    );
  }

  void addDetails() async {
    if (_formkey.currentState!.validate()) {
      await poststudentDetailsToFirebase();
    }
  }

  poststudentDetailsToFirebase() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    UserModel userModel = UserModel();
    StudentModel studentModel = StudentModel();
    studentModel.department = departmentcontroller.text;
    studentModel.name = studentnamecontroller.text;
    studentModel.rollnum = rollnumcontroller.text;
    studentModel.semester = semestercontroller.text;

    await firebaseFirestore
        .collection("${studentModel.department}")
        .doc(studentModel.semester)
        .set(studentModel.toMap());
    Fluttertoast.showToast(msg: "Details added successful");
  }
}
