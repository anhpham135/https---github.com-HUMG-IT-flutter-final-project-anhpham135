import 'package:final1/data/data.dart';

abstract class TaskRepositories {
  Future<void> createTask(Tasks task);
  Future<void> updateTask(Tasks task);
  Future<void> deleteTask(Tasks task);
  Future<List<Tasks>> getAllTask();
}
