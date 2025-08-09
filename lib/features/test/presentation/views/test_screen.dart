import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;

import 'package:safty_children/core/helpers/navigation_helper.dart';
import 'package:safty_children/core/helpers/spacer.dart';
import 'package:safty_children/core/themeing/app_colors.dart';
import 'package:safty_children/core/themeing/app_strings.dart';
import 'package:safty_children/core/themeing/app_styles.dart';
import 'package:safty_children/features/test/bloc/cubit/test_cubit.dart';
import 'package:safty_children/features/test/bloc/cubit/test_state.dart';
import 'package:safty_children/features/test/presentation/views/widgets/box_choice.dart';
import 'package:safty_children/features/test/presentation/views/widgets/custom_dialog.dart';
import 'package:safty_children/features/test/presentation/views/widgets/main_button.dart';
import 'package:safty_children/features/test/presentation/views/widgets/no_answer_dialog.dart';

import '../../data/questions stage/stage_four_questions.dart';
import '../../data/questions stage/stage_one_intro.dart';
import '../../data/questions stage/stage_thee_questions.dart';
import '../../models/question_model.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  Future<void> sendResultToGoogleSheet(
      String name,
      int score,
      int total,
      Map<String, dynamic> userAnswers,
      List<QuestionModel> stageOneIntroQuestions, {
        String? id,
      }) async {
    final url = Uri.parse(
      'https://script.google.com/macros/s/AKfycbxgjtpaeqeJwOfRzyKKrNFMjBvHtRECtLYyFIKxUtH4Pt6qOl-BWlTG5OGzvY0f7TAKHw/exec',
    );

    String? extractAnswer(String key) {
      final index = userAnswers[key];
      debugPrint("🔍 Extracting for $key → $index");

      if (index == null) return '';

      int questionIndex = int.tryParse(key.split("_")[1]) ?? -1;
      if (questionIndex == -1 || questionIndex >= stageOneIntroQuestions.length) {
        debugPrint("⚠️ Invalid question index for key $key");
        return '';
      }

      final answers = stageOneIntroQuestions[questionIndex].answers;

      if (index is int && index >= 0 && index < answers.length) {
        return answers[index];
      } else {
        debugPrint("❌ Invalid index $index for question $questionIndex");
      }

      return '';
    }

    final age = extractAnswer('0_0');
    final education = extractAnswer('0_1');
    final gender = extractAnswer('0_2');
    final marital = extractAnswer('0_3');
    final tookTraining = extractAnswer('0_4');
    final courseCount = extractAnswer('0_5');

    final usedFirstAidApp = (() {
      final index = userAnswers['2_0'];
      if (index is int && index >= 0 && index < stageThreeQuestions[0].answers.length) {
        return stageThreeQuestions[0].answers[index];
      }
      return '';
    })();

    final usedAIAssistant = (() {
      final index = userAnswers['3_0'];
      if (index is int && index >= 0 && index < stageFourQuestions[0].answers.length) {
        return stageFourQuestions[0].answers[index];
      }
      return '';
    })();

    final aiAssistantUsageFrequency = (() {
      final index = userAnswers['3_1'];
      if (index is int && index >= 0 && index < stageFourQuestions[1].answers.length) {
        return stageFourQuestions[1].answers[index];
      }
      return '';
    })();

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': name,
          'id': id ?? '',
          'score': score,
          'total': total,
          'age': age,
          'education': education,
          'gender': gender,
          'marital': marital,
          'tookTraining': tookTraining,
          'courseCount': courseCount,
          'usedFirstAidApp': usedFirstAidApp,
          'usedAIAssistant': usedAIAssistant,
          'aiAssistantUsageFrequency': aiAssistantUsageFrequency,
        }),
      );

      if (response.statusCode == 200 && response.body.contains("Success")) {
        debugPrint("✅ Result sent successfully!");
      } else {
        debugPrint("❌ Failed to send result: ${response.statusCode} - ${response.body}");
      }
    } catch (e) {
      debugPrint("❌ Error sending result: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Row(

mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/img/image_2025-08-03_01-37-21-removebg-preview.png',
         height: 40,
            ),
            Text(
              AppStrings.main,
              style: AppStyles.appBarStyle.copyWith(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

        // title: Text(
        //   AppStrings.main,
        //   style: AppStyles.appBarStyle.copyWith(
        //     fontSize: 20.sp,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Image.asset(
              'assets/img/image_2025-08-03_01-37-30-removebg-preview.png',
              height: 50,

            ),
          ),
        ],
        centerTitle: true,
        automaticallyImplyLeading: true,
        backgroundColor: AppColors.appBarColor,
        elevation: 46,
      ),
      body: BlocListener<TestCubit, TestState>(
        listener: (context, state) {
          if (state is TestCompleteState) {
            final cubit = context.read<TestCubit>();
            final nameController = TextEditingController();

            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) {
                return AlertDialog(
                  title: const Text("ادخل اسمك ورقمك التعريفي"),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: nameController,
                        decoration: const InputDecoration(labelText: "الاسم"),
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () async {
                        final name = nameController.text.trim();
                        final score = cubit.correctAnswerCount().round();
                        final total = cubit.totalPoints().round();
                        final currentUserAnswers = Map<String, dynamic>.from(cubit.userAnswers);

                        if (name.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("الرجاء إدخال الاسم")),
                          );
                          return;
                        }

                        Navigator.pop(context);

                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (_) => BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                            child: AlertDialog(
                              backgroundColor: Colors.white.withOpacity(0.7),
                              content: SizedBox(
                                height: 100,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    CircularProgressIndicator(),
                                    SizedBox(height: 16),
                                    Text("جاري إرسال النتيجة...", style: TextStyle(fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );

                        await sendResultToGoogleSheet(
                          name,
                          score,
                          total,
                          currentUserAnswers,
                          stageOneIntro,
                        );

                        Navigator.pop(context);

                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (_) => CustomDialog(
                            correctAnswersCount: score.toDouble(),
                            totalQuestions: total.toDouble(),
                            userAnswers: cubit.userAnswers,
                          ),
                        );
                      },
                      child: const Text("إرسال"),
                    ),
                  ],
                );
              },
            );
          }
        },
        child: BlocBuilder<TestCubit, TestState>(
          builder: (context, state) {
            final cubit = context.read<TestCubit>();

            if (state is TestInitialState) {
              bool hasStarted = cubit.userAnswers.isNotEmpty;

              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "استمارة إستبيان للممرضين عن تأثير الذكاء الإصطناعي مساعد الطيار المدمج مع تطبيق الموبايل على أداء الممرضين الجدد تجاه الإسعافات الأولية للأطفال",
                        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.green),
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.green.withOpacity(0.05),
                        ),
                        child: Text(
                          "عزيزتي / عزيزي الممرض / الممرضة، هذه المعلومات سرية لغرض البحث والدراسة، ولك الحق في المشاركة أو الإنسحاب في أي وقت.\n\nملاحظة: بعض الأسئلة لها أكثر من إجابة.",
                          style: TextStyle(fontSize: 14.sp),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 30),
                      MainButton(
                        title: "بدء الاختبار",
                        onPressed: () {
                          cubit.startTest(reset: true);
                        },
                      ),
                      if (hasStarted) ...[
                        SizedBox(height: 20.h),
                        MainButton(
                          title: "إكمال الامتحان",
                          onPressed: () {
                            cubit.startTest(reset: false);
                          },
                        ),
                      ],
                    ],
                  ),
                ),
              );
            } else if (state is NextQuestionState || state is ChoiceAnswerState) {
              final currentIndex = cubit.currentQuestionIndex;
              if (currentIndex >= cubit.questions.length) {
                return const Center(child: Text('لا يوجد سؤال حالياً'));
              }
              String getStageName(int stageIndex) {
                switch (stageIndex) {
                  case 1:
                    return "الخصائص الشخصية للممرضين:";
                  case 2:
                    return "معلومات الممرضين عن الإسعافات الأولية:";
                  case 3:
                    return ": معلومات الممرضين عن تطبيق الموبايل للإسعافات الأولية:";
                  default:
                    return "معلومات الممرضين فيما يتعلق بتطبيق مساعد الطيار:";
                }
              }
              final currentQuestion = cubit.questions[currentIndex];
              final userAnswer = cubit.userAnswers["${cubit.currentStageIndex}_$currentIndex"];

              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "  ${cubit.currentStageIndex + 1}  ${getStageName(cubit.currentStageIndex + 1)}",
                        style: AppStyles.headStyle.copyWith(fontSize: 20.sp, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "السؤال ${currentIndex + 1} من ${cubit.questions.length}",
                        style: AppStyles.headStyle.copyWith(fontSize: 18.sp, fontWeight: FontWeight.bold),
                      ),
                      verticalSpace(12),
                      Text(
                        currentQuestion.question,
                        style: AppStyles.headStyle.copyWith(fontSize: 16.sp, fontWeight: FontWeight.bold),
                      ),
                      verticalSpace(24),
                      ...List.generate(currentQuestion.answers.length, (index) {
                        bool isSelected = false;
                        if (currentQuestion.isMultiChoice && userAnswer is List<int>) {
                          isSelected = userAnswer.contains(index);
                        } else if (userAnswer is int) {
                          isSelected = userAnswer == index;
                        }

                        return BoxChoice(
                          isSelected: isSelected,
                          currentQuestion.answers[index],
                          onTap: () {
                            cubit.inputAnswer(index);
                          },
                        );
                      }),
                      verticalSpace(40),
                      Align(
                        alignment: Alignment.center,
                        child: MainButton(
                          onPressed: () {
                            final userAnswer = cubit.userAnswers["${cubit.currentStageIndex}_${cubit.currentQuestionIndex}"];
                            bool hasAnswerSelected = false;

                            if (userAnswer != null) {
                              if (userAnswer is int || (userAnswer is List && userAnswer.isNotEmpty)) {
                                hasAnswerSelected = true;
                              }
                            }

                            if (!hasAnswerSelected) {
                              showDialog(
                                context: context,
                                builder: (_) => NoAnswerDialog(onPressed: () => context.pop()),
                              );
                            } else {
                              cubit.nextQuestion();
                            }
                          },
                          title: 'السؤال التالي',
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return const Center(child: Text('لا يوجد سؤال حالياً'));
            }
          },
        ),
      ),
    );
  }
}