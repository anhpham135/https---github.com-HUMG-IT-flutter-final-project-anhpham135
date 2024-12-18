import 'package:final1/provider/provider.dart';
import 'package:final1/utils/utils.dart';
import 'package:final1/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class SelectCategory extends ConsumerWidget {
  const SelectCategory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = ref.watch(categoryProvider);
    final categories = TaskCategories.values.toList();
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          Text(
            'Category',
            style: context.textTheme.titleLarge,
          ),
          const Gap(10),
          Expanded(
            child: ListView.separated(
              physics: const AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) {
                final category = categories[index];

                return InkWell(
                  onTap: () {
                    ref.read(categoryProvider.notifier).state = category;
                  },
                  //borderRadius: BorderRadius.circular(30),
                  child: AnimatedScale(
                    scale: category == selectedCategory ? 1.2 : 1.0,
                    duration: const Duration(milliseconds: 200),
                    child: CircleContainer(
                      color: category.color,
                      child: Icon(
                        category.icon,
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (ctx, indext) => const Gap(8),
              itemCount: categories.length,
            ),
          ),
        ],
      ),
    );
  }
}
