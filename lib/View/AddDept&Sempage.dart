import 'package:attendanceapp/View/Widgets/Widgets.dart';
import 'package:flutter/material.dart';

class AddDeptandSemPage extends StatelessWidget {
  const AddDeptandSemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainappbar("Add Dept & Sem"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 38, vertical: 25),
        child: Column(
          children: [
            commontextfield("Enter Department"),
            SizedBox(
              height: 21,
            ),
            commontextfield("Enter Semester"),
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
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(41, 41, 41, 100),
                    ),
                    child: const Text("Add Details")))
          ],
        ),
      ),
    );
  }
}
