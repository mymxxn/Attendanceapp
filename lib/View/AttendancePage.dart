import 'package:attendanceapp/Model/student_model.dart';
import 'package:attendanceapp/View/Widgets/Widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({Key? key}) : super(key: key);

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  StudentModel students = StudentModel();
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("${students.department}")
        .doc(students.semester)
        .get()
        .then((value) {
      students = StudentModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainappbar("Attendance"),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [Text("${students.name}")],
        ),
      ),
    );
  }
}
