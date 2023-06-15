import 'package:get/get.dart';

class FilterController extends GetxController {
  List<String> options = [
    "Last 3 days",
    "Tomorrow",
    "Next 3 Days",
    "7 days",
    "Custom"
  ];
  Rx<List<String>> selectedOptions = Rx<List<String>>([]);

  var selectedOption = "".obs;



}
