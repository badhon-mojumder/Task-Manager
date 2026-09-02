import 'package:flutter/material.dart';
import 'package:task_manager/task_manager/controller/auth_controller.dart';
import 'package:task_manager/task_manager/models/api_response.dart';
import 'package:task_manager/task_manager/models/task_list_status.dart';
import 'package:task_manager/task_manager/models/task_status_count.dart';
import 'package:task_manager/task_manager/service/api_caller.dart';
import 'package:task_manager/task_manager/utils/urls.dart';

import '../widgets/task_card.dart';
import '../widgets/task_card_count.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  void initState() {
    super.initState();
    getTaskStatusCount();
    getTaskList('New');
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

  List<TaskStatusCount> taskStatusCount = [];

  Future<void> getTaskStatusCount() async {
    final ApiResponse response = await ApiCaller.getRequest(
      url: TMUrls.taskCount,
    );
    List<TaskStatusCount> tStatusCount = [];
    if (response.isSuccess) {
      for (Map<String, dynamic> userData in response.responseData['data']) {
        tStatusCount.add(TaskStatusCount.fromJson(userData));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(response.responseData['data'])));
    }
    setState(() {
      taskStatusCount = tStatusCount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(
              height: 100,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: taskStatusCount.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 90,
                    child: TaskCardCount(
                      title: taskStatusCount[index].sId.toString(),
                      count: taskStatusCount[index].sum!.toInt(),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(width: 10);
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: taskStatusList.length,
                itemBuilder: (context, index) {
                  return TaskCard(taskListStatus: taskStatusList[index], cardColor: Colors.blue, refreshParent: (){});
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
