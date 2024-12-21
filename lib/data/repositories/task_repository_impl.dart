import 'package:final1/data/data.dart';

class TaskRepositoryImpl implements TaskRepositories {
  final TaskDatasource _datasource;

  TaskRepositoryImpl(
    TaskDatasource datasource,
  ) : _datasource = datasource;

  @override
  Future<void> createTask(Tasks task) async {
    try {
      await _datasource.addTask(task);
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<void> deleteTask(Tasks task) async {
    try {
      await _datasource.deleteTask(task);
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<List<Tasks>> getAllTask() async {
    try {
      return await _datasource.getAllTasks();
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<void> updateTask(Tasks task) async {
    try {
      await _datasource.uupdateTask(task);
    } catch (e) {
      throw '$e';
    }
  }
}
