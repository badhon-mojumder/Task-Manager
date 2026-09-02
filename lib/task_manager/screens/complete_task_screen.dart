import 'package:flutter/material.dart';

import '../models/api_response.dart';
import '../models/task_list_status.dart';
import '../service/api_caller.dart';
import '../utils/urls.dart';
import '../widgets/task_card.dart';

class CompleteTaskScreen extends StatefulWidget {
  const CompleteTaskScreen({super.key});

  @override
  State<CompleteTaskScreen> createState() => _CompleteTaskScreenState();
}

class _CompleteTaskScreenState extends State<CompleteTaskScreen> {
  void initState() {
    super.initState();
    getTaskList('Completed');
  }

  List<TaskListStatus> taskStatusList = [];

  Future<void> getTaskList(String status) async {
    final ApiResponse response = await ApiCaller.getRequest(
      url: TMUrls.taskList(status),
    );
    List<TaskListStatus> tList = [];
    if (response.isSuccess) {
      for (Map<String, dynamic> userData in response.responseData['data']) {
        tList.add(TaskListStatus.fromJson(userData));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(response.responseData['data'])));
    }
    setState(() {
      taskStatusList = tList;
    });
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: taskStatusList.length,
      itemBuilder: (context, index) {
        return TaskCard(taskListStatus: taskStatusList[index], cardColor: Colors.green, refreshParent: (){});
      },
    );
  }
}
