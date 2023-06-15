import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multiselect/multiselect.dart';

import '../controller/filter_controller.dart';
import '../utils/dimensions.dart';
import '../utils/styles.dart';

class AppointmentDataFilters extends StatefulWidget {
  const AppointmentDataFilters({super.key});

  @override
  State<AppointmentDataFilters> createState() => _AppointmentDataFiltersState();
}

class _AppointmentDataFiltersState extends State<AppointmentDataFilters> {
  bool onTap = false;
  FilterController filterController = Get.put(FilterController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.getWidth(10),
          vertical: Dimensions.getHeight(15)),
      child: Column(
        children: [
          SizedBox(
            key: const Key("location-filter"),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: Dimensions.getWidth(8)),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: onTap ? Styles.primaryColor : Colors.grey,
                          width: onTap ? 2 : 1),
                      borderRadius: BorderRadius.circular(Dimensions.radius4)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      elevation: 1,
                      isExpanded: true,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      disabledHint: const Text("No locations found"),
                      items: const [],
                      onChanged: (Object? value) {},
                    ),
                  ),
                ),
                Positioned(
                  top: -Dimensions.getHeight(10),
                  left: Dimensions.getHeight(8),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.getWidth(1)),
                    height: Dimensions.getHeight(20),
                    width: Dimensions.getWidth(105),
                    decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius4)),
                    child: Center(
                      child: Text(
                        "Select Location",
                        style: TextStyle(
                            color: onTap ? Styles.primaryColor : Colors.grey),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: Dimensions.getHeight(15),
          ),
          SizedBox(
            key: const Key("Time-filter"),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.getWidth(8)),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: onTap ? Styles.primaryColor : Colors.grey,
                            width: onTap ? 2 : 1),
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius4)),
                    child: DropDownMultiSelect(
                        options: filterController.options,
                        selectedValues: filterController.selectedOptions.value,
                        onChanged: (value) {
                          //set tapped value to list of selected options
                          filterController.selectedOptions.value = value;
                          filterController.selectedOption.value = "";
                          for (var element
                              in filterController.selectedOptions.value) {
                            filterController.selectedOption.value =
                                "${filterController.selectedOption.value} $element";
                          }
                        },
                        whenEmpty: "Select Time")),
                Positioned(
                  top: -Dimensions.getHeight(10),
                  left: Dimensions.getHeight(8),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.getWidth(1)),
                    height: Dimensions.getHeight(20),
                    width: Dimensions.getWidth(105),
                    decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius4)),
                    child: Center(
                      child: Text(
                        "Time Selection",
                        style: TextStyle(
                            color: onTap ? Styles.primaryColor : Colors.grey),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
