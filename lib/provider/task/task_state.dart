import 'package:equatable/equatable.dart';

import 'package:final1/data/data.dart';

class TaskState extends Equatable {
  final List<Tasks> tasks;

  const TaskState({required this.tasks});
  const TaskState.initial({
    this.tasks = const [],
  });

  TaskState copyWith({
    List<Tasks>? tasks,
  }) {
    return TaskState(
      tasks: tasks ?? this.tasks,
    );
  }

  @override
  List<Object> get props => [tasks];
}
