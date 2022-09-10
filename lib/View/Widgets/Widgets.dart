// ignore: file_names
import 'package:attendanceapp/View/AddStudentpage.dart';
import 'package:attendanceapp/View/Adminpage.dart';
import 'package:attendanceapp/View/Loginpage.dart';
import 'package:attendanceapp/View/Registerationpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget loginbottomtext() => BottomAppBar(
    elevation: 0,
    color: Colors.transparent,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "No Account ?",
          style: TextStyle(color: Colors.grey),
        ),
        Container(
          height: 100.0,
        ),
        TextButton(
            onPressed: () {
              Get.to( RegisterationPage());
            },
            child: const Text(
              "Sign Up",
              style: TextStyle(color: Colors.black),
            ))
      ],
    ));
Widget loginandregisterationtextfields(String txt, dynamic icon) => Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white70,
      ),
      child: TextField(
        decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            hintText: txt,
            hintStyle:
                const TextStyle(color: Color.fromRGBO(160, 160, 160, 100)),
            prefixIcon: Icon(
              icon,
              color: Colors.black,
            )),
      ),
    );
Widget loginandregisterationheading(String txt) => Text(
      txt,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
    );
Widget loginbutton() => Container(
    height: 42,
    width: double.infinity,
    decoration: BoxDecoration(
        color: Colors.black, borderRadius: BorderRadius.circular(8)),
    child: ElevatedButton(
        onPressed: () {
          Get.to(() => const AdminPage());
        },
        style: ElevatedButton.styleFrom(
          primary: Color.fromRGBO(41, 41, 41, 100),
        ),
        child: const Text("Login")));

Widget registerbutton() => Container(
    height: 42,
    width: double.infinity,
    decoration: BoxDecoration(
        color: Colors.black, borderRadius: BorderRadius.circular(8)),
    child: ElevatedButton(
        onPressed: () {
          Get.to(() =>  LoginPage());
        },
        style: ElevatedButton.styleFrom(
          primary: Color.fromRGBO(41, 41, 41, 100),
        ),
        child: const Text("Login")));
Widget registerbottombutton() => BottomAppBar(
    elevation: 0,
    color: Colors.transparent,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Already Registered ?",
          style: TextStyle(color: Colors.grey),
        ),
        Container(
          height: 100.0,
        ),
        TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text(
              "Sign In",
              style: TextStyle(color: Colors.black),
            ))
      ],
    ));

Widget logoutbutton() => Container(
    height: 42,
    width: double.infinity,
    decoration: BoxDecoration(
        color: Colors.black, borderRadius: BorderRadius.circular(8)),
    child: ElevatedButton(
        onPressed: () {
          Get.to(() =>  LoginPage());
        },
        style: ElevatedButton.styleFrom(
          primary: Color.fromRGBO(41, 41, 41, 100),
        ),
        child: const Text("Log Out")));
mainappbar(String txt) => AppBar(
      leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_circle_left_outlined,
            color: Colors.black,
          )),
      title: Text(
        txt,
        style: TextStyle(color: Colors.black, fontSize: 20),
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
Widget commontextfield(String txt) => TextField(
        decoration: InputDecoration(
      hintText: txt,
      border: OutlineInputBorder(
          borderSide: BorderSide.none, borderRadius: BorderRadius.circular(8)),
      filled: true,
      fillColor: Colors.white,
      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 13),
    ));
