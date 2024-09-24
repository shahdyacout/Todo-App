import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget{
  final void Function()? onPressed;
  final String title;
  final Widget ?image;
  final Color color;
  CustomButton({
    required this.title,
    this.image,
    required this.onPressed,
    required this.color,
});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialButton(color: color,
      onPressed: onPressed,
    child: Row(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title),
        image== null ? const SizedBox():image!
      ],
    ),
    );
  }

}
