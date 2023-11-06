import 'package:flutter/material.dart';

class ContainerButton extends StatelessWidget {
  final String text;
  final Function()? onTap;
  const ContainerButton({
    required this.text,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(
              color: Colors.white,
              width: 2,
            )),
        child: Text(text),
      ),
    );
  }
}
