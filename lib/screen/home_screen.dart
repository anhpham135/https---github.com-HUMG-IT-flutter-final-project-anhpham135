import 'package:final1/config/routes/routes.dart';
import 'package:final1/data/data.dart';
import 'package:final1/utils/utils.dart';
import 'package:final1/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  static HomeScreen builder(BuildContext context, GoRouterState state) =>
      const HomeScreen();
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: deviceSize.height * 0.3,
                width: deviceSize.width,
                color: colors.primary,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DisplayWhiteText(
                        text: "Dec 12, 2024",
                        fontSize: 20,
                        fontWeight: FontWeight.normal),
                    DisplayWhiteText(
                      text: "My Tasks List",
                      fontSize: 40,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: deviceSize.height * 0.2,
            left: 0,
            right: 0,
            child: SafeArea(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const DisplayListOfTasks(tasks: [
                      Tasks(
                        title: 'meet Mr Yasuo',
                        note: '',
                        time: '16:43',
                        date: 'Dec, 15',
                        isCompleted: false,
                        category: TaskCategories.orther,
                      ),
                      Tasks(
                        title: 'go to concert',
                        note: 'this is note',
                        time: '17:43',
                        date: 'Dec, 15',
                        isCompleted: false,
                        category: TaskCategories.social,
                      )
                    ]),
                    const Gap(20),
                    Text(
                      "Completed",
                      style: context.textTheme.headlineMedium,
                    ),
                    const Gap(20),
                    const DisplayListOfTasks(
                      tasks: [
                        Tasks(
                          title: 'meetting (flutter)',
                          note: 'B2 test',
                          time: '16:43',
                          date: 'Dec, 15',
                          isCompleted: true,
                          category: TaskCategories.educaiton,
                        ),
                        Tasks(
                          title: 'Gym Phạm Đức Anh',
                          note: 'push day!!!!',
                          time: '17:43',
                          date: 'Dec, 15',
                          isCompleted: true,
                          category: TaskCategories.health,
                        )
                      ],
                      isCompletedTask: true,
                    ),
                    const Gap(20),
                    ElevatedButton(
                      onPressed: () => context.push(RoutesLocation.createTask),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: DisplayWhiteText(text: 'Add New Task'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
