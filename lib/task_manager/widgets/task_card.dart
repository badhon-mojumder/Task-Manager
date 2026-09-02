import 'package:flutter/material.dart';
import 'package:task_manager/task_manager/models/task_list_status.dart';

class TaskCard extends StatelessWidget {
  final TaskListStatus taskListStatus;
  final Color cardColor;
  final VoidCallback refreshParent;
  const TaskCard({
    super.key, required this.taskListStatus, required this.cardColor, required this.refreshParent
  });

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
              taskListStatus.title.toString(),
              style: Theme.of(context).textTheme.titleLarge!
                  .copyWith(fontSize: 19),
            ),
            SizedBox(height: 3),
            Text(
              taskListStatus.description.toString(),
              style: Theme.of(context).textTheme.titleMedium!
                  .copyWith(color: Colors.grey),
            ),
            SizedBox(height: 3),

            Text(
              'Date:${taskListStatus.createdDate}',
              style: Theme.of(context).textTheme.titleMedium!
                  .copyWith(color: Colors.grey[600]),
            ),
            SizedBox(height: 3),
            Row(
              children: [
                Chip(
                  label: Text( taskListStatus.status.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: cardColor,
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 25),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(50)
                  ),
                ),
                Spacer(),
                IconButton(onPressed: (){}, icon: Icon(Icons.edit_note,color: Colors.deepOrange,)),
                IconButton(onPressed: (){}, icon: Icon(Icons.delete,color: Colors.red,))

              ],
            ),
          ],
        ),
      ),
    );
  }
}
