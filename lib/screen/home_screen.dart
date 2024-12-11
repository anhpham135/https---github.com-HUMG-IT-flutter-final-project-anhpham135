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
                        fontWeight: FontWeight.normal),
                    Gap(10),
                    DisplayWhiteText(
                        text: "My Tasks List",
                        fontSize: 40,
                        fontWeight: FontWeight.normal),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: deviceSize.height * 0.3,
            left: 0,
            right: 0,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: deviceSize.width,
                    height: deviceSize.height * 0.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: colors.primaryContainer,
                    ),
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: 8,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (ctx, index) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Text("Home"),
                        );
                      },
                    ),
                  ),
                  const Gap(20),
                  Text(
                    "Completed",
                    style: context.textTheme.headlineMedium,
                  ),
                  Container(
                    width: deviceSize.width,
                    height: deviceSize.height * 0.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: colors.primaryContainer,
                    ),
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: 8,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (ctx, index) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Text("Home"),
                        );
                      },
                    ),
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
