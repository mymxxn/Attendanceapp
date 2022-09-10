import 'package:attendanceapp/View/Widgets/Widgets.dart';
import 'package:flutter/material.dart';

class AddSubjectPage extends StatelessWidget {
  const AddSubjectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainappbar("Add Subject"),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            commontextfield("Enter Subject"),
            SizedBox(
              height: 22,
            ),
            commontextfield("Department"),
            SizedBox(
              height: 22,
            ),
            commontextfield("Semester"),
            SizedBox(
              height: 34,
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
                    child: const Text("Add Subject")))
          ],
        ),
      ),
    );
  }
}
