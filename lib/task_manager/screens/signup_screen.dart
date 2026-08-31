import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/task_manager/models/api_response.dart';
import 'package:task_manager/task_manager/screens/login_screen.dart';
import 'package:task_manager/task_manager/service/api_caller.dart';
import 'package:task_manager/task_manager/utils/urls.dart';
import 'package:task_manager/task_manager/widgets/screen_bg.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void goToLogInScreen() async {
    final ApiResponse response = await ApiCaller.postRequest(
      url: TMUrls.signUpUrl,
      body: {
        "email": emailController.text,
        "firstName": firstNameController.text,
        "lastName": lastNameController.text,
        "mobile": mobileController.text,
        "password": passwordController.text,
      },
    );
    if (response.isSuccess) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBg(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 35),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 200),
                Text(
                  'Join With Us',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 25),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(hintText: 'Email'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }

                    final emailRegex = RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                    );

                    if (!emailRegex.hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 25),
                TextFormField(
                  controller: firstNameController,
                  decoration: InputDecoration(hintText: 'First Name'),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your firstName';
                    }

                    if (value.trim().length < 2) {
                      return 'Name must be at least 2 characters';
                    }

                    return null;
                  },
                ),
                SizedBox(height: 25),
                TextFormField(
                  controller: lastNameController,
                  decoration: InputDecoration(hintText: 'Last Name'),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your lastName';
                    }

                    if (value.trim().length < 2) {
                      return 'Name must be at least 2 characters';
                    }

                    return null;
                  },
                ),
                SizedBox(height: 25),
                TextFormField(
                  controller: mobileController,
                  decoration: InputDecoration(hintText: 'Mobile'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your mobile number';
                    }

                    final mobileRegex = RegExp(r'^01[3-9]\d{8}$');

                    if (!mobileRegex.hasMatch(value)) {
                      return 'Please enter a valid mobile number';
                    }

                    return null;
                  },
                ),
                SizedBox(height: 25),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(hintText: 'Password'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }

                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }

                    return null;
                  },
                ),
                SizedBox(height: 20),
                FilledButton(
                  onPressed: () {
                    goToLogInScreen();
                  },
                  child: Icon(Icons.arrow_forward_ios_outlined, size: 20),
                ),
                SizedBox(height: 40),
                Center(
                  child: Column(
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forget password..?',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: "Have account..?",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                          children: [
                            TextSpan(
                              text: ' Sign In',
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = goToLogInScreen,
                            ),
                          ],
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
