class TaskModel {
  final String title;
  final String id;
  final bool isCompleted;
  final String isSomeDay;

TaskModel({
    required this.title,
    required this.id,
    required this.isSomeDay,
    this.isCompleted = false,
  });

  TaskModel copyWith({
    String? title,
    String? id,
    bool? isCompleted,
    String? isSomeDay,
  }) {
    return TaskModel(
      title: title ?? this.title,
      id: id ?? this.id,
      isCompleted: isCompleted ?? this.isCompleted,
      isSomeDay: isSomeDay ?? this.isSomeDay,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'id': id,
      'isCompleted': isCompleted,
      'isSomeDay': isSomeDay,
    };
  }

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      title: json['title'] as String,
      id: json['id'] as String,
      isCompleted: json['isCompleted'] as bool,
      isSomeDay: json['isSomeDay'] as String,
    );
  }
}


