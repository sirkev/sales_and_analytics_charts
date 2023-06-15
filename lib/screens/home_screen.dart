import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import '../models/AppointmentDataModel.dart';
import '../utils/dimensions.dart';
import '../widgets/appointment_data_filter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<AppointmentData> _chartData;
  List<String> names = ["confirmed", "Cancelled"];
  int itemCount = 4;
  bool showFilters = false;

  @override
  void initState() {
    super.initState();
    // Initialize data source for spark charts
    _chartData = getChartData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Container(
            height: 488,
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(4)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Recent Sales',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff1D252D)),
                ),
                const Text(
                  'All locations, last 7 days',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff1D252D)),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  "\$8,225.00",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff1D252D)),
                ),
                SfSparkLineChart(
                  axisCrossesAt: 0,
                  axisLineColor: Colors.grey,
                  axisLineWidth: 0,
                  color: const Color(0xff1D252D),
                ),
              ],
            ),
          ),
          SizedBox(
            //color: Colors.grey,
            child: Stack(
              children: [
                Container(
                  height: Dimensions.getHeight(488),
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(
                      vertical: Dimensions.getHeight(10),
                      horizontal: Dimensions.getWidth(10)),
                  margin: EdgeInsets.symmetric(
                      horizontal: Dimensions.getWidth(16),
                      vertical: Dimensions.getHeight(16)),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(4)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Upcoming Appointments',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff1D252D)),
                              ),
                              Text(
                                'All locations, last 7 days',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff1D252D)),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                showFilters = !showFilters;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: Dimensions.getWidth(8),
                                vertical: Dimensions.getHeight(4),
                              ),
                              height: Dimensions.getHeight(30),
                              width: Dimensions.getWidth(40),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    height: 8,
                                    width: 8,
                                    decoration: const BoxDecoration(
                                        color: Colors.blueGrey,
                                        shape: BoxShape.circle),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Container(
                                    height: 8,
                                    width: 8,
                                    decoration: const BoxDecoration(
                                        color: Colors.blueGrey,
                                        shape: BoxShape.circle),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        "324 booked",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff1D252D)),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Confirmed appointments 314',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                              ),
                              Text(
                                'Canceled appointments 10',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Text(
                                    'Confirmed',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Container(
                                    height: 5,
                                    width: 10,
                                    decoration: const BoxDecoration(
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Text(
                                    'Canceled ',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Container(
                                    height: 5,
                                    width: 10,
                                    decoration: const BoxDecoration(
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SfCartesianChart(
                        legend: Legend(
                          isVisible: true,
                          position: LegendPosition.bottom,
                          overflowMode: LegendItemOverflowMode.wrap,
                          textStyle: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                        palette: const [
                          Colors.green,
                          Colors.redAccent,
                          Colors.grey,
                          Colors.blue
                        ],
                        primaryXAxis:
                            CategoryAxis(title: AxisTitle(text: "Locations")),
                        series: List.generate(
                          2,
                          (index) =>
                              StackedColumnSeries<AppointmentData, String>(
                            dataSource: _chartData,
                            name: names[index],
                            xValueMapper: (AppointmentData sales, _) =>
                                sales.location,
                            yValueMapper: (AppointmentData sales, _) =>
                                sales.confirmed,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                showFilters
                    ? Positioned(
                        top: Dimensions.getHeight(60),
                        right: Dimensions.getWidth(35),
                        child: Container(
                          height: Dimensions.getHeight(200),
                          width: Dimensions.screenWidth * 0.7,
                          decoration: BoxDecoration(
                            color: Colors.grey[50],
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, Dimensions.getHeight(3)),
                              ),
                            ],
                            border: Border.all(color: Colors.grey[50] as Color),
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius4),
                          ),
                          child: const AppointmentDataFilters(),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
