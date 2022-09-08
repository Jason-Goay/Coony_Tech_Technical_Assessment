import 'package:flutter/material.dart';
import 'package:my_app/utils/app_colors.dart';

class MyCard extends StatelessWidget {
  final EdgeInsets contentPadding;
  final IconData? icon;
  final String title;
  final String? subtitle;
  final bool? hasSub;
  final double? width;
  final Color? color;

  MyCard(
      {required this.contentPadding,
      this.icon,
      required this.title,
      this.subtitle,
      this.hasSub,
      this.width,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
            child: SizedBox(
          width: width ?? 380,
          height: 110,
          child: ListTile(
            contentPadding: contentPadding,
            leading: CircleAvatar(
                backgroundColor: AppColors.backgroundColor,
                radius: 25,
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 25,
                )),
            title: Text(
              title,
              style: TextStyle(
                  color: color ?? Colors.black, fontWeight: FontWeight.bold),
            ),
            subtitle: hasSub!
                ? Text(
                    subtitle!,
                    style: TextStyle(fontSize: 12),
                  )
                : SizedBox(),
          ),
        )),
        SizedBox(
          height: 10,
        )
      ],
    );
    ;
  }
}
