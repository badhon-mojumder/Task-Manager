import 'package:flutter/material.dart';
import 'package:task_manager/task_manager/widgets/screen_bg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                'Get started with',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 25),
              TextFormField(decoration: InputDecoration(hintText: 'Email')),
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
              SizedBox(height: 80),
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
                        text: "Don't have an account ?",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                            text: ' Sign up',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
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
