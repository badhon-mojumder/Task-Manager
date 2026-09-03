import 'package:flutter/material.dart';
import 'package:task_manager/task_manager/models/api_response.dart';
import 'package:task_manager/task_manager/screens/main_nav_screen.dart';
import 'package:task_manager/task_manager/service/api_caller.dart';
import 'package:task_manager/task_manager/utils/urls.dart';
import 'package:task_manager/task_manager/widgets/screen_bg.dart';

import '../widgets/tm_app_bar.dart';

class AddNewTask extends StatefulWidget {
  const AddNewTask({super.key});

  @override
  State<AddNewTask> createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TMAppBar(),
      body: ScreenBg(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 150),
              Text(
                'Add New Task',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 25),
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(hintText: 'Title'),
              ),
              SizedBox(height: 25),
              TextFormField(
                controller: descriptionController,
                maxLines: 6,
                decoration: InputDecoration(hintText: 'Description'),
              ),
              SizedBox(height: 20),
              FilledButton(
                onPressed: () async {
                  final ApiResponse response = await ApiCaller.postRequest(
                    url: TMUrls.createTask,
                    body: {
                      "title": titleController.text,
                      "description": descriptionController.text,
                      "status": "New",
                    },
                  );

                  if (response.isSuccess) {
                    await Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => MainNavScreen()),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Task Added Successfully')),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Something Wrong...!')),
                    );
                  }
                },
                child: Icon(Icons.arrow_forward_ios_outlined, size: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
