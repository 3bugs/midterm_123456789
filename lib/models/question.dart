class Question {
  Question({required this.question, required this.options});

  final String question;
  final List<Option> options;

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      question: json['question'],
      options: json['options']
          .map<Option>(
            (item) => Option.fromJson(item),
          )
          .toList(),
    );
  }
}

class Option {
  Option({required this.text, required this.isAnswer});

  final String text;
  final bool isAnswer;

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(text: json['text'], isAnswer: json['is_answer']);
  }
}
