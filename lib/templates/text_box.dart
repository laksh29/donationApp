import 'package:donationsapp/const.dart';
import 'package:flutter/material.dart';

import 'font_styles.dart';

class TextBox extends StatelessWidget {
  final String text;
  final String? subText;
  final String? leadingIcon;

  const TextBox({
    super.key,
    required this.text,
    this.subText,
    this.leadingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(20.0),
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white60,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: leadingIcon == null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: subHeading(),
                  ),
                  subText != null
                      ? Text(
                          subText.toString(),
                          style: label(),
                        )
                      : buildHeight(1.0),
                ],
              )
            : Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage("$leadingIcon"),
                  ),
                  buildWidth(15.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        text,
                        style: subHeading(),
                      ),
                      subText != null
                          ? Text(
                              subText.toString(),
                              style: label(),
                            )
                          : buildHeight(1.0),
                    ],
                  )
                ],
              ));
  }
}
