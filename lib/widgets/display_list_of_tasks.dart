import 'package:final1/data/data.dart';
import 'package:final1/provider/provider.dart';
import 'package:final1/utils/utils.dart';
import 'package:final1/widgets/common_container.dart';
import 'package:final1/widgets/task_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'task_title.dart';

class DisplayListOfTasks extends ConsumerWidget {
  const DisplayListOfTasks({
    super.key,
    required this.tasks,
    this.isCompletedTask = false,
  });

  final List<Tasks> tasks;
  final bool isCompletedTask;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceSize = context.deviceSize;
    final height =
        isCompletedTask ? deviceSize.height * 0.25 : deviceSize.height * 0.3;
    final emptyTasksMessage = isCompletedTask
        ? 'There is no competed task yet !'
        : 'There is no task to do !';

    return CommonContainer(
      height: height,
      child: tasks.isEmpty
          ? Center(
              child: Text(
                emptyTasksMessage,
                style: context.textTheme.headlineSmall,
              ),
            )
          : ListView.separated(
              shrinkWrap: true,
              itemCount: tasks.length,
              padding: EdgeInsets.zero,
              itemBuilder: (ctx, index) {
                final task = tasks[index];
                return InkWell(
                  onLongPress: () {
                    AppAlerts.showDeleteAlertDialog(
                      context,
                      ref,
                      task,
                    ); //--------------------------------------------------------
                    //todo, delete (task)
                  },
                  onTap: () async {
                    //todo-show task details

                    await showModalBottomSheet(
                        context: context,
                        builder: (ctx) {
                          return TaskDetails(task: task);
                        });
                  },
                  child: TaskTitle(
                    tasks: task,
                    onCompleted: (value) async {
                      await ref
                          .read(taskProvider.notifier)
                          .updateTask(task)
                          .then((value) {
                        AppAlerts.displaySnackBar(
                            context,
                            task.isCompleted
                                ? 'Task incompleted'
                                : 'Task completed');
                      });
                    },
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(thickness: 1.5);
              },
            ),
    );
  }
}
