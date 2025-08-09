import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safty_children/core/helpers/spacer.dart';
import 'package:safty_children/core/themeing/app_colors.dart';
import 'package:safty_children/core/themeing/app_styles.dart';
import 'package:safty_children/features/test/data/questions%20stage/stage_one_intro.dart';
import 'package:safty_children/features/test/data/questions%20stage/stage_two_questions.dart';

import 'package:safty_children/features/test/data/questions%20stage/stage_four_questions.dart';
import 'package:safty_children/features/test/presentation/views/widgets/main_button.dart';

import '../../../data/questions stage/stage_thee_questions.dart';
import '../../review_answers_screen.dart';

class CustomDialog extends StatelessWidget {
  final double correctAnswersCount;
  final double totalQuestions;
  final Map<String, dynamic> userAnswers;

  const CustomDialog({
    super.key,
    required this.correctAnswersCount,
    required this.totalQuestions,
    required this.userAnswers,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20).r),
      child: Container(
        width: 300.w,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20).r),
        padding: EdgeInsets.all(16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 16.h),
              decoration: BoxDecoration(
                color: AppColors.appBarColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20).r,
                  topRight: Radius.circular(20).r,
                ),
              ),
              child: Center(
                child: Text(
                  'انتهى اختبارك.',
                  style: AppStyles.appBarStyle.copyWith(
                    fontSize: 20.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.h),
            Text(
              'نتيجتك: ${correctAnswersCount.toStringAsFixed(1)}',
              style: AppStyles.appBarStyle.copyWith(
                color: AppColors.purple,
                fontSize: 18.sp,
              ),
            ),
            verticalSpace(20),
            Text(
              'الدرجة الكلية: ${totalQuestions.toStringAsFixed(1)}',
              style: AppStyles.appBarStyle.copyWith(
                color: AppColors.appBarColor,
                fontSize: 18.sp,
              ),
            ),
            verticalSpace(40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: MainButton(
                    title: 'اغلاق',
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: MainButton(
                    title: 'مراجعة',
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ReviewAnswersScreen(
                            userAnswers: userAnswers,
                            allStageQuestions: [
                              stageOneIntro,      // Stage 0 (Stage 1)
                              stageTwoQuestions,  // Stage 1 (Stage 2)
                              stageThreeQuestions,// Stage 2 (Stage 3)
                              stageFourQuestions, // Stage 3 (Stage 4)
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}