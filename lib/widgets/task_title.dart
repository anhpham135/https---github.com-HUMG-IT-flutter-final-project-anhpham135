import 'package:final1/data/models/tasks.dart';
import 'package:final1/utils/extensions.dart';
import 'package:final1/widgets/widgets.dart';
import 'package:gap/gap.dart';
import 'package:final1/data/data.dart';
import 'package:flutter/material.dart';

class TaskTitle extends StatelessWidget {
  const TaskTitle({super.key, required this.tasks, this.onCompleted});
  final Tasks tasks;
  final Function(bool?)? onCompleted;

  @override
  Widget build(BuildContext context) {
    final style = context.textTheme;
    final double icon0pacity = tasks.isCompleted ? 0.3 : 0.5;
    final background0pacity = tasks.isCompleted ? 0.1 : 0.3;
    final textDecoration =
        tasks.isCompleted ? TextDecoration.lineThrough : TextDecoration.none;
    final fontWeight = tasks.isCompleted ? FontWeight.normal : FontWeight.bold;

    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        top: 10,
        bottom: 10,
      ),
      child: Row(
        children: [
          CircleContainer(
            color: tasks.category.color.withOpacity(background0pacity),
            child: Center(
              child: Icon(
                tasks.category.icon,
                color: tasks.category.color.withOpacity(icon0pacity),
              ),
            ),
          ),
          const Gap(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tasks.title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        decoration: textDecoration,
                        fontSize: 20,
                        fontWeight: fontWeight,
                      ),
                ),
                Text(
                  tasks.time,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        decoration: textDecoration,
                      ),
                ),
              ],
            ),
          ),
          Checkbox(
            value: tasks.isCompleted,
            onChanged: (value) {},
          )
        ],
      ),
    );
    // ignore: dead_code
  }
}