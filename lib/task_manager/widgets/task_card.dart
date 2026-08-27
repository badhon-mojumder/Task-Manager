import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  const new({
    super.key,
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
              'title',
              style: Theme.of(context).textTheme.titleLarge!
                  .copyWith(fontSize: 19),
            ),
            SizedBox(height: 3),
            Text(
              'Description',
              style: Theme.of(context).textTheme.titleMedium!
                  .copyWith(color: Colors.grey),
            ),
            SizedBox(height: 3),

            Text(
              'Date: 22/03/2026',
              style: Theme.of(context).textTheme.titleMedium!
                  .copyWith(color: Colors.grey[600]),
            ),
            SizedBox(height: 3),
            Row(
              children: [
                Chip(
                  label: Text(
                    'New',
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.blue,
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
