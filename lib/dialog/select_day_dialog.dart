import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:twity_bird_badminton/constants.dart';

class SelectDayDialog extends StatelessWidget {
  final TextEditingController dayController;
  const SelectDayDialog({
    super.key,
    required this.dayController,
  });

  @override
  Widget build(BuildContext context) {
    List<String> titleList = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: AlertDialog(
        contentPadding: EdgeInsets.zero,
        backgroundColor: kLightSecondaryColor,
        surfaceTintColor: kLightSecondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Select a day',
              textAlign: TextAlign.center,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.clear,
                color: kDarkSecondaryColor,
              ),
            )
          ],
        ),
        titlePadding: const EdgeInsets.all(20),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: titleList.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  dayController.text = titleList[index].toString();
                  Navigator.pop(context);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 20,
                  ),
                  child: Text(
                    titleList[index].toString(),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
