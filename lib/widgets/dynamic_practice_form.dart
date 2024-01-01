import 'package:flutter/material.dart';
import 'package:twity_bird_badminton/constants.dart';
import 'package:twity_bird_badminton/dialog/select_day_dialog.dart';
import 'package:twity_bird_badminton/util/practice.dart';
import 'package:twity_bird_badminton/widgets/custom_popup_field.dart';
import 'package:twity_bird_badminton/widgets/custom_time_field.dart';

class DynamicPracticeForm extends StatefulWidget {
  final List<Practice> practiceControllerList;
  final GlobalKey<FormState> formKey;
  const DynamicPracticeForm({
    super.key,
    required this.practiceControllerList,
    required this.formKey,
  });

  @override
  State<DynamicPracticeForm> createState() => _DynamicPracticeFormState();
}

class _DynamicPracticeFormState extends State<DynamicPracticeForm> {
  addFormField() {
    setState(() {
      widget.practiceControllerList.add(
        Practice(
          date: TextEditingController(),
          startTime: TextEditingController(),
          endTime: TextEditingController(),
        ),
      );
    });
  }

  removeFormField(int index) {
    setState(() {
      widget.practiceControllerList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.practiceControllerList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      CustomPopUpField(
                        controller: widget.practiceControllerList[index].date,
                        hintText: 'Day',
                        validate: true,
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => SelectDayDialog(
                              dayController: widget.practiceControllerList[index].date,
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTimeField(
                              hintText: 'Start Time',
                              controller: widget.practiceControllerList[index].startTime,
                              validate: true,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: CustomTimeField(
                              hintText: 'End Time',
                              controller: widget.practiceControllerList[index].endTime,
                              validate: true,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (index == 0) {
                          addFormField();
                        } else {
                          removeFormField(index);
                        }
                      },
                      child: Icon(
                        index == 0 ? Icons.add_circle : Icons.remove_circle,
                        size: 25,
                        color: kDarkSecondaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
