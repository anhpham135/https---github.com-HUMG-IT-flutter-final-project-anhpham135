import 'package:equatable/equatable.dart';

import 'package:final1/utils/utils.dart';

class Tasks extends Equatable {
  final int? id;
  final String title;
  final String note;
  final String time;
  final String date;
  final TaskCategories category;
  final bool isCompleted;
  const Tasks({
    this.id,
    required this.title,
    required this.note,
    required this.time,
    required this.date,
    required this.category,
    required this.isCompleted,
  });

  @override
  List<Object> get props {
    return [
      id!,
      title,
      note,
      time,
      date,
      isCompleted,
    ];
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      TaskKey.id: id,
      TaskKey.title: title,
      TaskKey.note: note,
      TaskKey.time: time,
      TaskKey.date: date,
      TaskKey.category: category.name,
      TaskKey.isCompleted: isCompleted,
    };
  }

  factory Tasks.fromJson(Map<String, dynamic> map) {
    return Tasks(
      id: map[TaskKey.id],
      title: map[TaskKey.title],
      note: map[TaskKey.note],
      time: map[TaskKey.time],
      date: map[TaskKey.date],
      category: TaskCategories.stringToCategory(map[TaskKey.category]),
      isCompleted: map[TaskKey.isCompleted],
    );
  }
}
