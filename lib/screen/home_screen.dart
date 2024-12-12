import 'package:final1/utils/extensions.dart';
import 'package:final1/widgets/display_white_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatefulWidget {
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
                          fontWeight: FontWeight.normal
                          ),
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
                top: 170,
                left: 0,
                right: 0,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Container(
                      width: deviceSize.width,
                      height: deviceSize.height * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: colors.primaryContainer
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 8,
                        padding: EdgeInsets.zero,
                        itemBuilder: (ctx, index){
                        return const Text("home");
                      },
                      ),
                    ),
                  const Gap(20),
                  Text(
                    "Completed", 
                    style: context.textTheme.headlineMedium,
                    ),
                    const Gap(20),
                    Container(
                      width: deviceSize.width,
                      height: deviceSize.height * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: colors.primaryContainer
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 8,
                        padding: EdgeInsets.zero,
                        itemBuilder: (ctx, index){
                        return const Text("home");
                      },
                      ),
                    ),
                    const Gap(20),
                    ElevatedButton(
                      onPressed: () {},
                      // style: ElevatedButton.styleFrom(backgroundColor: Colors.orange), 
                      child: const Text("add new task"),
                    ),
                  ],
                  ),
                ),
              ),
        ],
      ),
    );
  }
}
