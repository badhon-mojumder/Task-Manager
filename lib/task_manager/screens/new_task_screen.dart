import 'package:flutter/material.dart';
import '../widgets/task_card.dart';
import '../widgets/task_card_count.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
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
                itemCount: 4,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 90,
                    child: TaskCardCount(title: 'New', count: 25),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(width: 10);
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 15,
                itemBuilder: (context, index) {
                  return TaskCard();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

