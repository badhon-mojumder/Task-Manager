import 'package:flutter/material.dart';
import 'package:task_manager/task_manager/models/api_response.dart';
import 'package:task_manager/task_manager/models/task_list_status.dart';
import 'package:task_manager/task_manager/service/api_caller.dart';
import 'package:task_manager/task_manager/utils/urls.dart';

class TaskCard extends StatefulWidget {
  final TaskListStatus taskListStatus;
  final Color cardColor;
  final VoidCallback refreshParent;

  const TaskCard({
    super.key,
    required this.taskListStatus,
    required this.cardColor,
    required this.refreshParent,
  });

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  Future<void> taskDelete() async {
    final ApiResponse response = await ApiCaller.getRequest(
      url: TMUrls.deleteTask(widget.taskListStatus.sId.toString()),
    );
    if (response.isSuccess) {
      widget.refreshParent();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Task Deleted Successfully')));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Something Wrong...!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Padding(
        padding: EdgeInsetsGeometry.only(left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.taskListStatus.title.toString(),
              style: Theme.of(context).textTheme.titleLarge!
                  .copyWith(fontSize: 19),
            ),
            SizedBox(height: 3),
            Text(
              widget.taskListStatus.description.toString(),
              style: Theme.of(context).textTheme.titleMedium!
                  .copyWith(color: Colors.grey),
            ),
            SizedBox(height: 3),

            Text(
              'Date:${widget.taskListStatus.createdDate}',
              style: Theme.of(context).textTheme.titleMedium!
                  .copyWith(color: Colors.grey[600]),
            ),
            SizedBox(height: 3),
            Row(
              children: [
                Chip(
                  label: Text(
                    widget.taskListStatus.status.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: widget.cardColor,
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 25),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(50),
                  ),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.edit_note, color: Colors.deepOrange),
                ),
                IconButton(
                  onPressed: () {
                    taskDelete();
                  },
                  icon: Icon(Icons.delete, color: Colors.red),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
