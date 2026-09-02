import 'package:flutter/material.dart';

import '../models/api_response.dart';
import '../models/task_list_status.dart';
import '../service/api_caller.dart';
import '../utils/urls.dart';
import '../widgets/task_card.dart';

class CancelTaskScreen extends StatefulWidget {
  const CancelTaskScreen({super.key});

  @override
  State<CancelTaskScreen> createState() => _CancelTaskScreenState();
}

class _CancelTaskScreenState extends State<CancelTaskScreen> {
  @override
  void initState() {
    super.initState();
    getTaskList('Cancelled');
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
        return TaskCard(taskListStatus: taskStatusList[index], cardColor: Colors.red, refreshParent: (){});
      },
    );

  }
}
