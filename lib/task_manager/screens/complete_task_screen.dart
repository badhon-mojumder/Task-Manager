import 'package:flutter/material.dart';

import '../widgets/task_card.dart';

class CompleteTaskScreen extends StatefulWidget {
  const CompleteTaskScreen({super.key});

  @override
  State<CompleteTaskScreen> createState() => _CompleteTaskScreenState();
}

class _CompleteTaskScreenState extends State<CompleteTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      itemCount: 15,
      itemBuilder: (context, index) {
        return TaskCard();
      },
    );
  }
}
