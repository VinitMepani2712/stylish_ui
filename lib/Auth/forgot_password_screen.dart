import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widget/widget_support.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 15.w),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Forgot",
                  style: AppWidget.loginHeaderTextStyle(),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "password?",
                  style: AppWidget.loginHeaderTextStyle(),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40.h),
                TextFormField(
                  controller: emailController,
                  validator: (value) => value == null || value.isEmpty
                      ? '\u274C Please enter your email address'
                      : !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                              .hasMatch(value)
                          ? '\u274C Please enter a valid email address'
                          : null,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Color((0xffDEDEDE))),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Color((0xffDEDEDE))),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Color((0xffDEDEDE))),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Color((0xffDEDEDE))),
                    ),
                    fillColor: Color.fromRGBO(64, 123, 255, 0.03),
                    filled: true,
                    hintText: "Enter your email address",
                    hintStyle: TextStyle(color: Color(0xff858383)),
                    suffixIcon: Icon(FontAwesomeIcons.envelope),
                    border: InputBorder.none,
                  ),
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(height: 20.h),
                Text(
                    "* We will send you a message to set or reset your new password"),
                SizedBox(height: 20.h),
                GestureDetector(
                  // onTap: () {
                  //   if (_formkey.currentState!.validate())
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) => BottomNavBarPage(),
                  //       ),
                  //     );
                  // },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 54.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xffF83758),
                      border: Border.all(color: const Color(0xffDEDEDE)),
                    ),
                    child: Center(
                      child: Text(
                        "Submit",
                        textAlign: TextAlign.center,
                        style: AppWidget.signUpAndLoginButtonTextStyle(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
