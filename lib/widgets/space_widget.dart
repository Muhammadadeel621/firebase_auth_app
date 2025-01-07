import 'package:flutter/material.dart';

class SpaceCustomWidget extends StatelessWidget {
  final double? height;
  final double? width;
  const SpaceCustomWidget({super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
