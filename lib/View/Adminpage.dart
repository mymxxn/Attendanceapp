import 'package:attendanceapp/View/AddDept&Sempage.dart';
import 'package:attendanceapp/View/AddStudentpage.dart';
import 'package:attendanceapp/View/AddSubjectpage.dart';
import 'package:attendanceapp/View/ViewStudentspage.dart';
import 'package:attendanceapp/View/Widgets/Widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({Key? key}) : super(key: key);

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
                  children: const [
                    Text(
                      "Hi,",
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                    ),
                    Text(
                      "Mymoon Jaleel",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                    ),
                    Text(
                      "mymoon@gmail.com \n9876543210",
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
                            Get.to(AddStudentPage());
                          }),
                      Text("Add Student")
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
                            Get.to(() => AddDeptandSemPage());
                          }),
                      Text("Add Dept & Sem")
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 28,
            ),
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
                            Get.to(() => AddSubjectPage());
                          }),
                      Text("Add Subject")
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
            SizedBox(
              height: 82,
            ),
            logoutbutton()
          ],
        ),
      ),
    );
  }
}
