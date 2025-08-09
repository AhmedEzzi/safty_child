import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safty_children/core/themeing/app_styles.dart';

class Knowledgeitem extends StatelessWidget {
  final String title;
  final String subtitle;
  const Knowledgeitem({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        title,
        style: AppStyles.headStyle,
        textAlign: TextAlign.center,
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: subtitle
                .split('\n')
                .map(
                  (line) => Text(
                line,
                style: TextStyle(
                  fontSize: line.contains('؟') ? 20.sp : 15.sp,
                  fontWeight: line.contains('؟')
                      ? FontWeight.bold
                      : FontWeight.w500,
                ),
              ),
            )
                .toList(),
          ),
        ),
      ],
    );
  }
}