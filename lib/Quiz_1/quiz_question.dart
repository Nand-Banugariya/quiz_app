// quiz_question.dart

class QuizQuestion {
  final int id;
  final String question;
  final List<String> options;
  final int correctOption;

  QuizQuestion({
    required this.id,
    required this.question,
    required this.options,
    required this.correctOption,
  });

  factory QuizQuestion.fromJson(Map<String, dynamic> json) {
    return QuizQuestion(
      id: json['id'],
      question: json['question'],
      options: List<String>.from(json['options']),
      correctOption: json['correctOption'],
    );
  }
}


class QuizSubject {
  final String name;
  final List<QuizQuestion> questions;

  QuizSubject({
    required this.name,
    required this.questions,
  });

  factory QuizSubject.fromJson(Map<String, dynamic> json) {
    return QuizSubject(
      name: json['name'],
      questions: List<QuizQuestion>.from(
        json['questions'].map((question) => QuizQuestion.fromJson(question)),
      ),
    );
  }
}