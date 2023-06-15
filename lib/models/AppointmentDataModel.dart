class AppointmentData {
  AppointmentData(this.location, this.confirmed, this.cancelled);
  final String location;
  final num confirmed;
  final num cancelled;
}

List<AppointmentData> getChartData() {
  final List<AppointmentData> chartData = [
    AppointmentData('New York', 10, 5),
    AppointmentData('Los Angeles', 20, 2),
    AppointmentData('Chicago', 18, 1),
    AppointmentData('Houston', 20, 1),
    AppointmentData('ohio', 16, 2),
  ];
  return chartData;
}

List filterList = [
  ['Last 3 days', false],
  ['Tomorrow', false],
  ['Next 3 Days', false],
  ['7 days', false],
  ['Custom', true],
];
