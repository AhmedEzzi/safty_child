import 'package:flutter/material.dart';
import '../models/question_model.dart';

class ReviewAnswersScreen extends StatelessWidget {
  final Map<String, dynamic> userAnswers;
  final List<List<QuestionModel>> allStageQuestions;

  const ReviewAnswersScreen({
    super.key,
    required this.userAnswers,
    required this.allStageQuestions,
  });

  @override
  Widget build(BuildContext context) {
    final List<_QuestionWithIndex> incorrectQuestions = [];

    userAnswers.forEach((key, answer) {
      final parts = key.split('_');
      if (parts.length != 2) return;

      final stageIndex = int.tryParse(parts[0]);
      final questionIndex = int.tryParse(parts[1]);
      if (stageIndex == null || questionIndex == null) return;

      if (stageIndex >= allStageQuestions.length) return;

      final stageQuestions = allStageQuestions[stageIndex];
      if (questionIndex >= stageQuestions.length) return;

      final question = stageQuestions[questionIndex];

      // Skip introductory questions (stage 0) or questions without correct answers
      if (stageIndex == 0 || question.correctAnswer.isEmpty) return;

      if (!_answersMatch(answer, question.correctAnswer)) {
        incorrectQuestions.add(_QuestionWithIndex(key, question, answer));
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text('مراجعة الأخطاء')),
      body: incorrectQuestions.isEmpty
          ? const Center(child: Text('كل إجاباتك صحيحة!'))
          : ListView.builder(
        itemCount: incorrectQuestions.length,
        itemBuilder: (context, index) {
          final item = incorrectQuestions[index];
          return Card(
            margin: const EdgeInsets.all(12),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('المرحلة ${item.question.stage}:', style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(item.question.question),
                  const SizedBox(height: 10),
                  Text('إجابتك:', style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(
                    _formatAnswer(item.userAnswer, item.question),
                    style: const TextStyle(color: Colors.red),
                  ),
                  const SizedBox(height: 10),
                  Text('الإجابة الصحيحة:', style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(
                    _formatAnswer(item.question.correctAnswer, item.question),
                    style: const TextStyle(color: Colors.green),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  bool _answersMatch(dynamic a, dynamic b) {
    if (a is List && b is List) {
      return a.length == b.length && a.toSet().containsAll(b);
    }
    return a.toString() == b.toString();
  }

  String _formatAnswer(dynamic answer, QuestionModel question) {
    if (answer is List) {
      return answer.map((i) => question.answers[i]).join(', ');
    } else if (answer is int) {
      return question.answers[answer];
    } else {
      return answer.toString();
    }
  }
}

class _QuestionWithIndex {
  final String id;
  final QuestionModel question;
  final dynamic userAnswer;

  _QuestionWithIndex(this.id, this.question, this.userAnswer);
}