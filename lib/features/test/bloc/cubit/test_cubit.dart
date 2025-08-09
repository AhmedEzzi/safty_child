import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safty_children/features/test/models/question_model.dart';
import 'test_state.dart';

class TestCubit extends Cubit<TestState> {
  final List<List<QuestionModel>> allStageQuestions;
  int currentQuestionIndex = 0;
  int currentStageIndex = 0;
  Map<String, dynamic> userAnswers = {};

  TestCubit(this.allStageQuestions) : super(TestInitialState());

  List<QuestionModel> get questions => allStageQuestions[currentStageIndex];

  String _currentKey() => "${currentStageIndex}_$currentQuestionIndex";

  bool hasStarted() {
    return userAnswers.isNotEmpty;
  }

  void startTest({bool reset = true}) {
    if (reset) {
      currentQuestionIndex = 0;
      currentStageIndex = 0;
      userAnswers.clear();
    }
    emit(NextQuestionState(currentQuestionIndex));
  }

  void inputAnswer(int answerIndex) {
    final currentQuestion = questions[currentQuestionIndex];
    final key = _currentKey();

    if (currentQuestion.isMultiChoice) {
      List<int> currentAnswers = [];
      final answer = userAnswers[key];
      if (answer != null) {
        if (answer is int) {
          currentAnswers = [answer];
        } else if (answer is Iterable) {
          currentAnswers = List<int>.from(answer);
        }
      }
      if (currentAnswers.contains(answerIndex)) {
        currentAnswers.remove(answerIndex);
      } else {
        if (currentAnswers.length < 2) {
          currentAnswers.add(answerIndex);
        }
      }
      userAnswers[key] = currentAnswers;
    } else {
      userAnswers[key] = answerIndex;
    }
    emit(ChoiceAnswerState(userAnswers: userAnswers));
  }

  double correctAnswerCount() {
    double count = 0.0;
    for (int stageIndex = 0; stageIndex <= currentStageIndex; stageIndex++) {
      final stageQuestions = allStageQuestions[stageIndex];
      for (var i = 0; i < stageQuestions.length; i++) {
        final key = "${stageIndex}_$i";
        final correctAnswers = stageQuestions[i].correctAnswer;
        final userAnswer = userAnswers[key];

        if (stageQuestions[i].isMultiChoice) {
          if (userAnswer is List<int>) {
            bool correct = userAnswer.length == correctAnswers.length &&
                userAnswer.toSet().containsAll(correctAnswers);
            if (correct) {
              count += stageQuestions[i].point;
            } else if (userAnswer.length == 1 &&
                correctAnswers.contains(userAnswer.first)) {
              count += stageQuestions[i].point / 2;
            }
          }
        } else {
          if (userAnswer is int && correctAnswers.contains(userAnswer)) {
            count += stageQuestions[i].point;
          }
        }
      }
    }
    return count;
  }

  double totalPoints() {
    double total = 0.0;
    for (int stageIndex = 0; stageIndex <= currentStageIndex; stageIndex++) {
      final stageQuestions = allStageQuestions[stageIndex];
      for (var question in stageQuestions) {
        total += question.point;
      }
    }
    return total;
  }

  bool canGoNext() {
    final answer = userAnswers[_currentKey()];
    final currentQuestion = questions[currentQuestionIndex];

    if (currentQuestion.isMultiChoice) {
      if (answer == null) return false;
      if (answer is List<int>) {
        return answer.isNotEmpty;
      }
      return false;
    } else {
      return answer != null;
    }
  }

  void nextQuestion() {
    if (!canGoNext()) {
      emit(ErrorState("من فضلك اختار إجابة قبل الانتقال"));
      return;
    }

    if (currentStageIndex == 0 && currentQuestionIndex == 4) {
      final answer = userAnswers[_currentKey()];
      if (answer is int) {
        if (answer == 1) {
          currentStageIndex++;
          currentQuestionIndex = 0;
          emit(StageChangedState(currentStageIndex));
          emit(NextQuestionState(currentQuestionIndex));
          return;
        } else if (answer == 0) {
          currentQuestionIndex = 5;
          emit(NextQuestionState(currentQuestionIndex));
          return;
        }
      }
    }

    do {

      if (questions[currentQuestionIndex].visibilityCondition != null &&
          !questions[currentQuestionIndex].visibilityCondition!(userAnswers)) {
        currentQuestionIndex++;
        if (currentQuestionIndex >= questions.length) {
          if (currentStageIndex < allStageQuestions.length - 1) {
            currentStageIndex++;
            currentQuestionIndex = 0;
            emit(StageChangedState(currentStageIndex));
            emit(NextQuestionState(currentQuestionIndex));
          } else {
            emit(TestCompleteState(userAnswers: userAnswers));
          }
          return;
        }
      } else {
        break;
      }
    } while (true);

    while (true) {
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
        if (questions[currentQuestionIndex].visibilityCondition != null &&
            !questions[currentQuestionIndex].visibilityCondition!(
              userAnswers,
            )) {
          continue;
        }
        emit(NextQuestionState(currentQuestionIndex));
        break;
      } else {
        if (currentStageIndex < allStageQuestions.length - 1) {
          currentStageIndex++;
          currentQuestionIndex = 0;
          emit(StageChangedState(currentStageIndex));
          emit(NextQuestionState(currentQuestionIndex));
          break;
        } else {
          emit(TestCompleteState(userAnswers: userAnswers));
          break;
        }
      }
    }
  }
}