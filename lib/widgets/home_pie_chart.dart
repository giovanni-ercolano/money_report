import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../styles/app_color.dart';

class HomePieChart extends StatefulWidget {
  const HomePieChart({super.key});

  @override
  State<HomePieChart> createState() => _HomePieChartState();
}

class _HomePieChartState extends State<HomePieChart> {
  String activeFilter = 'day';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColor.secondaryOne,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                FilterChip(
                  label: const Text('Day'),
                  selected: activeFilter == 'day',
                  onSelected: (bool selected) {
                    setState(() {
                      activeFilter = 'day';
                    });
                  },
                ),
                FilterChip(
                  label: const Text('Week'),
                  selected: activeFilter == 'week',
                  onSelected: (bool selected) {
                    setState(() {
                      activeFilter = 'week';
                    });
                  },
                ),
                FilterChip(
                  label: const Text('Month'),
                  selected: activeFilter == 'month',
                  selectedColor: AppColor.primaryBlue,
                  onSelected: (bool selected) {
                    setState(() {
                      activeFilter = 'month';
                    });
                  },
                ),
                FilterChip(
                  label: const Text('Year'),
                  selected: activeFilter == 'year',
                  onSelected: (bool selected) {
                    setState(() {
                      activeFilter = 'year';
                    });
                  },
                ),
                FilterChip(
                  label: const Text('Period'),
                  selected: activeFilter == 'period',
                  onSelected: (bool selected) {
                    setState(() {
                      activeFilter = 'period';
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                  },
                ),
                Expanded(child: Container()),
                const Text("04", style: TextStyle(fontSize: 20)),
                Expanded(child: Container()),
                IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  onPressed: () {
                  },
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: PieChart(
                  PieChartData(
                    sections: [
                      PieChartSectionData(
                        color: Colors.red,
                        value: 40,
                        title: '40%',
                      ),
                      PieChartSectionData(
                        color: Colors.green,
                        value: 30,
                        title: '30%',
                      ),
                      PieChartSectionData(
                        color: Colors.blue,
                        value: 15,
                        title: '15%',
                      ),
                      PieChartSectionData(
                        color: Colors.yellow,
                        value: 15,
                        title: '15%',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
