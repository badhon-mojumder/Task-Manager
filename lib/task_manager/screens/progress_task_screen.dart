import 'package:flutter/material.dart';

import '../widgets/task_card.dart';

class ProgressTaskScreen extends StatefulWidget {
  const ProgressTaskScreen({super.key});

  @override
  State<ProgressTaskScreen> createState() => _ProgressTaskScreenState();
}

class _ProgressTaskScreenState extends State<ProgressTaskScreen> {
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
