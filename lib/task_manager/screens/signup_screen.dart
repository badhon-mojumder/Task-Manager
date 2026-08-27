import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/task_manager/screens/login_screen.dart';
import 'package:task_manager/task_manager/widgets/screen_bg.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  void goToLogInScreen(){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBg(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 200),
              Text(
                'Join With Us',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 25),
              TextFormField(decoration: InputDecoration(hintText: 'Email')),
              SizedBox(height: 25),
              TextFormField(decoration: InputDecoration(hintText: 'First Name')),
              SizedBox(height: 25),
              TextFormField(decoration: InputDecoration(hintText: 'Last Name')),
              SizedBox(height: 25),
              TextFormField(decoration: InputDecoration(hintText: 'Mobile')),
              SizedBox(height: 25),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(hintText: 'Password'),
              ),
              SizedBox(height: 20),
              FilledButton(
                onPressed: () {},
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
                            recognizer: TapGestureRecognizer()..onTap = goToLogInScreen
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
    );
  }
}
