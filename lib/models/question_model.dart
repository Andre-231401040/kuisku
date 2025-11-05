class Question {
  final int number;
  final String question;
  final List<String> options;
  final String answer;

  Question({
    required this.number,
    required this.question,
    required this.options,
    required this.answer,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      number: json['number'],
      question: json['question'],
      options: List<String>.from(json['options']),
      answer: json['answer'],
    );
  }
}
