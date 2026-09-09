import 'package:flutter/material.dart';



class TaskCardCount extends StatelessWidget {
  final String title;
  final int count;
  const new({
    super.key, required this.title, required this.count
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 1, vertical: 10),
        child: Column(
          children: [
            Text(count.toString(), style: Theme
                .of(context)
                .textTheme
                .titleLarge!.copyWith(
              fontSize: 18
            )),
            Text(title, style: Theme
                .of(context)
                .textTheme
                .titleMedium),

          ],
        ),
      ),
    );
  }
}


