import 'package:attendanceapp/Controller/controller.dart';
import 'package:attendanceapp/View/Widgets/Widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class ViewStudentsPage extends StatelessWidget {
  ViewStudentsPage({Key? key}) : super(key: key);
  final controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainappbar("Students"),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            TextFormField(
                autofocus: false,
                onTap: () {
                  //GetBuilder<Controller>(builder: (_)=>controller.)
                  controller.checkiftrue();
                },
                decoration: InputDecoration(
                  isDense: true,
                  suffixIcon: Obx(
                    () => controller.yess.value
                        ? IconButton(
                            icon: Icon(Icons.close),
                            onPressed: () {},
                          )
                        : IconButton(
                            icon: Icon(Icons.search),
                            onPressed: () {},
                          ),
                  ),
                  hintText: "Search for Students",
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20)),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.only(
                      top: 10.0, bottom: 10.0, left: 23, right: 12.5),
                ))
          ],
        ),
      ),
    );
  }
}
