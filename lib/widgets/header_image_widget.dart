import 'package:flutter/material.dart';

class HeaderImageWidget extends StatelessWidget {
  const HeaderImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/rajang.jpg', // Ensure this image is in your assets
      width: double.infinity,
      height: 250,
      fit: BoxFit.cover,
    );
  }
}