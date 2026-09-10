import 'package:flutter/material.dart';
import 'package:task_manager/task_manager/controller/auth_controller.dart';
import 'package:task_manager/task_manager/models/api_response.dart';
import 'package:task_manager/task_manager/models/user_model.dart';
import 'package:task_manager/task_manager/screens/main_nav_screen.dart';
import 'package:task_manager/task_manager/service/api_caller.dart';
import 'package:task_manager/task_manager/utils/urls.dart';
import 'package:task_manager/task_manager/widgets/screen_bg.dart';
import 'package:task_manager/task_manager/widgets/tm_app_bar.dart';

class ProfileUpdateScreen extends StatefulWidget {
  const ProfileUpdateScreen({super.key});

  @override
  State<ProfileUpdateScreen> createState() => _ProfileUpdateScreenState();
}

class _ProfileUpdateScreenState extends State<ProfileUpdateScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void profileUpdate() async {
    Map<String, dynamic> requestBody = {
      "email": emailController.text,
      "firstName": firstNameController.text,
      "lastName": lastNameController.text,
      "mobile": mobileController.text,
    };

    if (passwordController.text.isNotEmpty) {
      requestBody["password"] = passwordController.text;
    }
    final ApiResponse response = await ApiCaller.postRequest(
      url: TMUrls.profileUpdateUrl,
      body: requestBody,
    );
    if (response.isSuccess) {
      UserModel model = UserModel(
        sId: AuthController.userData?.sId,
        email: emailController.text,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        mobile: mobileController.text,
      );
      AuthController.updateUserData(model);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainNavScreen()),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    UserModel user = AuthController.userData!;
    emailController.text = user.email!;
    firstNameController.text = user.firstName!;
    lastNameController.text = user.lastName!;
    mobileController.text = user.mobile!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TMAppBar(),
      body: ScreenBg(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 35),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 120),
                Text(
                  'Update Profile',
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
                    profileUpdate();
                  },
                  child: Icon(Icons.arrow_forward_ios_outlined, size: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
