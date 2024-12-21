import 'package:final1/data/data.dart';
import 'package:final1/provider/task/task_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TaskNotifier extends StateNotifier<TaskState> {
  final TaskRepositories _repositories;

  TaskNotifier(this._repositories) : super(const TaskState.initial());

  Future<void> createTask(Tasks task) async {
    try {
      await _repositories.createTask(task);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> deleteTask(Tasks task) async {
    try {
      final isCompleted = !task.isCompleted;
      final updatedTask = task.copyWith(isCompleted: isCompleted);
      await _repositories.deleteTask(updatedTask);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> getTask(Tasks task) async {
    try {
      final tasks = await _repositories.getAllTask();
      state = state.copyWith(tasks: tasks);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
