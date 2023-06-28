// ignore_for_file: public_member_api_docs, sort_constructors_first
class Question {
  int num1;
  int num2;
  int answer;
  List<int> options;
  String type;
  Question({
    required this.num1,
    required this.num2,
    required this.answer,
    required this.options,
    required this.type,
  });

  Question copyWith({
    int? num1,
    int? num2,
    int? answer,
    List<int>? options,
    String? type,
  }) {
    return Question(
      num1: num1 ?? this.num1,
      num2: num2 ?? this.num2,
      answer: answer ?? this.answer,
      options: options ?? this.options,
      type: type ?? this.type,
    );
  }
}
