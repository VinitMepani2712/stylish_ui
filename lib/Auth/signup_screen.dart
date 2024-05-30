import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stylish_ui/Auth/login_screen.dart';
import 'package:stylish_ui/widget/widget_support.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isIconPressed = true;
  bool isPasswordVisible1 = false;
  bool isPasswordVisible2 = false;
  String name = "";
  String email = "";
  String password = "";
  String confirmPassword = "";

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 40.h),
          child: Form(
            key: _formkey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Create an",
                    style: AppWidget.loginHeaderTextStyle(),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "account!",
                    style: AppWidget.loginHeaderTextStyle(),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20.h),
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
                      hintText: "username or Email",
                      hintStyle: TextStyle(color: Color(0xff858383)),
                      prefixIcon: Icon(FontAwesomeIcons.userLarge),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(height: 20.h),
                  TextFormField(
                    validator: (value) => value == null || value.isEmpty
                        ? "\u274C Enter your password"
                        : value.length < 8
                            ? "\u274C Password must be at least 8 characters long , 1 Uppercase letter , 1 Lowercase letter , 1 Special Character "
                            : null,
                    controller: passwordController,
                    obscureText: !isPasswordVisible1,
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
                      hintText: "Password",
                      prefixIcon: Icon(Icons.lock),
                      hintStyle: TextStyle(color: Color(0xff858383)),
                      suffixIcon: GestureDetector(
                        onTap: () => setState(() {
                          isPasswordVisible1 = !isPasswordVisible1;
                        }),
                        child: isPasswordVisible1
                            ? Icon(FontAwesomeIcons.eye)
                            : Icon(FontAwesomeIcons.eyeSlash),
                      ),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(height: 20.h),
                  TextFormField(
                    validator: (value) => value != passwordController.text
                        ? "\u274C Enter password does not match"
                        : null,
                    controller: confirmPasswordController,
                    obscureText: !isPasswordVisible2,
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
                      prefixIcon: Icon(Icons.lock),
                      hintText: "Confirm Password",
                      hintStyle: TextStyle(color: Color(0xff858383)),
                      suffixIcon: GestureDetector(
                        onTap: () => setState(() {
                          isPasswordVisible2 = !isPasswordVisible2;
                        }),
                        child: isPasswordVisible2
                            ? Icon(FontAwesomeIcons.eye)
                            : Icon(FontAwesomeIcons.eyeSlash),
                      ),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(height: 20),
                  RichText(
                    text: TextSpan(
                      text: "By clicking the ",
                      style: TextStyle(
                        color: Color(0xff676767),
                      ),
                      children: [
                        TextSpan(
                          text: "Create Account",
                          style: TextStyle(
                            color: Color(0xffF83758),
                          ),
                        ),
                        TextSpan(
                          text: " button, you agree to the public offer",
                          style: TextStyle(
                            color: Color(0xff676767),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40),
                  GestureDetector(
                    // onTap: () {
                    //   if (_formKey.currentState!.validate())
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: ((context) => BottomNavBarPage()),
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
                          "Create Account",
                          textAlign: TextAlign.center,
                          style: AppWidget.signUpAndLoginButtonTextStyle(),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Center(
                    child: Text(
                      "- OR Continue with -",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xffF83758),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: CircleAvatar(
                          backgroundColor: Color(0xffFCF3F6),
                          minRadius: 30,
                          maxRadius: 30,
                          child: Image.asset(
                              "assets/images/login_screen_images/google.png"),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xffF83758),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: CircleAvatar(
                          backgroundColor: Color(0xffFCF3F6),
                          minRadius: 30,
                          maxRadius: 30,
                          child: Image.asset(
                              "assets/images/login_screen_images/apple.png"),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xffF83758),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: CircleAvatar(
                          backgroundColor: Color(0xffFCF3F6),
                          minRadius: 30,
                          maxRadius: 30,
                          child: Image.asset(
                              "assets/images/login_screen_images/facebook.png"),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20.h),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 18.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "I Already Have an Account  ",
                            style: TextStyle(
                              color: Color(0xFF6C6C6C),
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                            ),
                          ),
                          Text(
                            "Login",
                            style: TextStyle(
                              color: Color(0xffF83758),
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                              decoration: TextDecoration.underline,
                              decorationColor: Color(0xffF83758),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
