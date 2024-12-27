import 'package:final1/data/data.dart';
import 'package:final1/utils/utils.dart';
import 'package:final1/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class TaskDetails extends ConsumerWidget {
  const TaskDetails({super.key, required this.task});
  final Tasks task;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final style = context.textTheme;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      //cần phải chỉnh cho phù hợp kích thước từng màn hình
      child: Column(
        children: [
          CircleContainer(
            color: task.category.color.withAlpha(225),
            child: Icon(
              task.category.icon,
              color: task.category.color,
            ),
          ),
          const Gap(16),
          Text(
            task.title,
            style: style.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(task.time, style: style.titleMedium),
          const Gap(16),
          Visibility(
            visible: !task.isCompleted,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Task to be completed on ${task.date}'),
                Icon(
                  Icons.check_box,
                  color: task.category.color,
                )
              ],
            ),
          ),
          const Gap(16),
          Divider(
            thickness: 1.5,
            color: task.category.color,
          ),
          const Gap(16),
          Text(
            task.note.isEmpty
                ? 'there is no additional note for this task'
                : task.note,
          ),
          const Gap(16),
          Visibility(
            visible: task.isCompleted,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Task completed'),
                Icon(
                  Icons.check_box,
                  color: Colors.green,
                )
              ],
            ),
          ),
          // xóa task
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Center(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    backgroundColor: context.colorScheme.error,
                    foregroundColor: context.colorScheme.onError,
                    padding: const EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 16.0,
                    )),
                onPressed: () async {
                  await AppAlerts.showDeleteAlertDialog(context, ref, task);
                },
                icon: const Icon(Icons.delete),
                label: const Text('Delete task'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
