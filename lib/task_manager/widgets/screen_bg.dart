import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/asset_path.dart';

class ScreenBg extends StatelessWidget {
  final Widget child;
  const new({
    super.key, required this.child
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          height: double.maxFinite,
          width: double.maxFinite,
          fit: BoxFit.cover,
          AssetPath.bgImage,
        ),
        child,
      ],
    );
  }
}
