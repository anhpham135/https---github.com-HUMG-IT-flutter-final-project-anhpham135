import 'package:final1/data/data.dart';
import 'package:final1/provider/task/task_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TaskNotifier extends StateNotifier<TaskState> {
  final TaskRepositories _repositories;

  TaskNotifier(this._repositories) : super(const TaskState.initial()) {
    // Load all tasks when the app opens or an instance of this class is created
    getTask();
  }

  Future<void> createTask(Tasks task) async {
    try {
      await _repositories.createTask(task);
      getTask();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> deleteTask(Tasks task) async {
    try {
      await _repositories.deleteTask(task);
      getTask();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> updateTask(Tasks task) async {
    try {
      final isCompleted = !task.isCompleted;
      final updatedTask = task.copyWith(isCompleted: isCompleted);
      await _repositories.updateTask(updatedTask);
      getTask();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void getTask() async {
    try {
      final tasks = await _repositories.getAllTask();
      state = state.copyWith(tasks: tasks);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
