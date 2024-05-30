import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_ui/Auth/forgot_password_screen.dart';
import 'package:stylish_ui/Auth/signup_screen.dart';
import 'package:stylish_ui/widget/widget_support.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordVisible1 = false;
  bool isChecked = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 15.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome",
                  style: AppWidget.loginHeaderTextStyle(),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Back!",
                  style: AppWidget.loginHeaderTextStyle(),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40.h),
                TextFormField(
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "\u274C Please enter your email address";
                    }
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(value)) {
                      return '\u274C Please enter a valid email address';
                    }
                    return null;
                  },
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "\u274C Enter your password";
                    }
                    return null;
                  },
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
                    hintStyle: TextStyle(color: Color(0xff858383)),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          isPasswordVisible1 = !isPasswordVisible1;
                        });
                      },
                      child: isPasswordVisible1
                          ? Icon(FontAwesomeIcons.eye)
                          : Icon(FontAwesomeIcons.eyeSlash),
                    ),
                    border: InputBorder.none,
                  ),
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 15.w),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => ForgotPasswordScreen()),
                            ),
                          );
                        },
                        child: Text("Forgot Password?",
                            style: AppWidget.forgotPasswordStyle()),
                      ),
                    ),
                  ],
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
                        "Login",
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
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUpScreen(),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Create An Account  ",
                        style: TextStyle(
                          color: Color(0xFF6C6C6C),
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                        ),
                      ),
                      Text(
                        "Sign Up",
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
