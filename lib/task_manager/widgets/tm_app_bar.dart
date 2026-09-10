import 'package:flutter/material.dart';
import 'package:task_manager/task_manager/controller/auth_controller.dart';
import 'package:task_manager/task_manager/screens/profile_update_screeen.dart';

class TMAppBar extends StatelessWidget implements PreferredSize {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.green,
      elevation: 5,
      title: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProfileUpdateScreen()),
          );
        },
        child: Row(
          children: [
            ClipOval(
              child: Image.network(
                'https://images.unsplash.com/photo-1695927621677-ec96e048dce2?w=600&auto=format&fit=crop&q=60',
                width: 55,
                height: 55,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${AuthController.userData?.firstName} ${AuthController.userData?.lastName}',
                  style: Theme.of(context).textTheme.titleMedium!
                      .copyWith(color: Colors.white),
                ),
                Text(
                  '${AuthController.userData!.email}',
                  style: Theme.of(context).textTheme.titleSmall!
                      .copyWith(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
