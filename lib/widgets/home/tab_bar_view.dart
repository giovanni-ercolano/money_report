import 'package:flutter/material.dart';
import 'package:money_report/services/screen_size.dart';
import 'package:money_report/widgets/home/home_pie_chart.dart';

import '../../styles/app_color.dart';

class MyTabBarView extends StatefulWidget {
  const MyTabBarView({
    Key? key,
  }) : super(key: key);

  @override
  State<MyTabBarView> createState() => _MyTabBarViewState();
}

class _MyTabBarViewState extends State<MyTabBarView>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: ScreenSize.padding10),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: ScreenSize.padding10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColor.secondaryOne,
                ),
                child: TabBar(
                  unselectedLabelColor: AppColor.additionalSix,
                  labelColor: AppColor.additionalOne,
                  indicatorWeight: 2,
                  indicator: BoxDecoration(
                    color: AppColor.primaryBlue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  enableFeedback: false,
                  splashBorderRadius: BorderRadius.circular(20),
                  controller: tabController,
                  tabs: const [
                    Tab(
                      text: 'Expansive',
                    ),
                    Tab(
                      text: 'Incomes',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: const [
              HomePieChart(),
              Text('Tab 2'),
            ],
          ),
        )
      ],
    );
  }
}
