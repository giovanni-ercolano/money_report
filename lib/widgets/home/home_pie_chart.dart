import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:money_report/services/screen_size.dart';

import '../../styles/app_color.dart';

class HomePieChart extends StatefulWidget {
  const HomePieChart({super.key});

  @override
  State<HomePieChart> createState() => _HomePieChartState();
}

class _HomePieChartState extends State<HomePieChart> {
  String activeFilter = 'Month';
  List<String> filterOptions = ['Day', 'Week', 'Month', 'Year', 'Period'];
  final DateTime _selectedDate = DateTime.now();

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
            Padding(
              padding: EdgeInsets.symmetric(vertical: ScreenSize.padding8, horizontal: ScreenSize.padding10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  alignment: WrapAlignment.start,
                  spacing: 8.0,
                  children: filterOptions.map((filterOption) {
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: ScreenSize.padding8),
                      child: FilterChip(
                        backgroundColor: AppColor.additionalOne,
                        // checkmarkColor: AppColor.additionalOne,
                        showCheckmark: false,
                        label: Text(
                          filterOption,
                          style: TextStyle(
                            color: activeFilter == filterOption
                                ? AppColor.additionalOne
                                : AppColor.additionalSix,
                          ),
                        ),
                        selectedColor: AppColor.primaryBlue,
                        selected: activeFilter == filterOption,
                        onSelected: (bool selected) {
                          setState(() {
                            activeFilter = filterOption;
                          });
                        },
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    // Handle arrow back
                  },
                  child: Padding(
                    padding: EdgeInsets.all(ScreenSize.padding8),
                    child: const Icon(Icons.arrow_back),
                  ),
                ),
                Expanded(child: Container()),
                Text(
                    '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                    style: const TextStyle(fontSize: 20)),
                Expanded(child: Container()),
                InkWell(
                  onTap: () {
                    // Handle arrow forward
                  },
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: ScreenSize.padding20),
                    child: const Icon(Icons.arrow_forward),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(ScreenSize.padding8),
                child: Stack(
                  children: [
                    PieChart(
                      PieChartData(
                        centerSpaceRadius: 60,
                        sections: [
                          //da ridurre il quantitativo di righe, operazione troppo rindondante al momento
                          PieChartSectionData(
                            color: Colors.red,
                            value: 40,
                            title: '40%',
                            radius: 40,
                          ),
                          PieChartSectionData(
                            color: Colors.green,
                            value: 30,
                            title: '30%',
                            radius: 30,
                          ),
                          PieChartSectionData(
                            color: Colors.blue,
                            value: 15,
                            title: '15%',
                            radius: 30,
                          ),
                          PieChartSectionData(
                            color: Colors.yellow,
                            value: 15,
                            title: '15%',
                            radius: 30,
                          ),
                        ],
                      ),
                    ),
                    const Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '\$5000', //da cambiare con i valori reali
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
