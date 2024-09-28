import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:early_eyes/components/coreComponents/TextView.dart';
import 'package:early_eyes/components/coreComponents/common_app_bar.dart';
import 'package:early_eyes/components/styles/appColors.dart';
import 'package:early_eyes/components/styles/app_strings.dart';
import 'package:early_eyes/components/styles/textStyles.dart';
import 'package:early_eyes/feature/presentation/widgets/common_card.dart';
import 'package:early_eyes/feature/presentation/widgets/common_scaffold_widget.dart';
import 'package:early_eyes/utils/extensions/contextExtensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../components/coreComponents/appDropDown.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key});

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  final List<String> items = [
    'Python',
    'PHP',
    'Flutter',
    'Nodejs',
    'React Native',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      onBackTap: () {
        context.pop();
      },
      title: AppStrings.calendar,

      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextView(
                margin: const EdgeInsets.only(left: 16),
                text: 'Hedi',
                style: 18.txtSBoldDarkBlue,
              ),
              TextView(
                  margin: const EdgeInsets.only(right: 16),
                  text: 'Class: VI A',
                  style: 15.txtRegularDBlue),
            ],
          ),
          CommonCard(
            radius: 10,
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
            child: Row(
              children: [
                TextView(
                    text: AppStrings.selectCourse, style: 13.txtRegularDBlue),
                const Spacer(),
                AppDropDown<String>.singleSelect(
                    borderColor: AppColors.darkBlue.withOpacity(0.8),
                    radius: 5,
                    hint: 'Python',
                    width: 150,
                    list: items,
                    selectedValue: selectedValue,
                    singleValueBuilder: (value) => value,
                    itemBuilder: (value) => value,
                    onSingleChange: (value) {
                      setState(() {
                        selectedValue = value;
                      });
                    }),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 16,right: 16,top: 24),
            height: context.getHeight / 1.8,
            child: TableCalendar(
              availableGestures: AvailableGestures.none,
              weekendDays: const [DateTime.sunday],
              headerStyle: HeaderStyle(
                  headerMargin: const EdgeInsets.only(bottom: 16),
                  rightChevronIcon: const Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: AppColors.darkBlue,
                      size: 16),
                  leftChevronIcon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: AppColors.darkBlue,
                      size: 16),
                  titleTextStyle: 14.txtBoldDarkBlue,

                  titleCentered: true,
                  formatButtonVisible: false),
              daysOfWeekStyle: const DaysOfWeekStyle(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: AppColors.darkBlue))),
                  ),
              daysOfWeekHeight: 35,
              calendarStyle: const CalendarStyle(

                rangeEndTextStyle:
                TextStyle(color: AppColors.red, fontSize: 16.0),
                outsideDecoration: BoxDecoration(shape: BoxShape.circle),
                cellAlignment: Alignment.center,
                cellMargin: EdgeInsets.all(2.0),
                markersAlignment: Alignment.bottomCenter,
                todayDecoration: BoxDecoration(
                  color:  AppColors.darkBlue,
                    shape: BoxShape.circle),
                outsideDaysVisible: false,
                selectedDecoration: BoxDecoration(
                   color: AppColors.darkBlue,
                    shape: BoxShape.circle),
              ),
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: DateTime.now(),
            ),
          ),

          ListView.separated(
              padding: const EdgeInsets.only(left: 32, right: 16),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    CircleAvatar(
                        radius: 8,
                        backgroundColor: index == 0
                            ? AppColors.primaryBlue
                            : index == 1
                                ? AppColors.bkColor
                                : AppColors.red),
                    TextView(
                      margin: const EdgeInsets.only(left: 8.0),
                        text: index == 0
                            ? 'Upcoming Classes '
                            : index == 1
                                ? 'Past Classes'
                                : "Can't be attend",style: 13.txtSBoldBlack,)
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 8);
              },
              itemCount: 3)
        ],
      ),
    );
  }
}
