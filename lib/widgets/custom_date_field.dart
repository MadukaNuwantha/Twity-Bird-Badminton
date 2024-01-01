// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:twity_bird_badminton/constants.dart';

class CustomDateField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool? validate;

  const CustomDateField({
    super.key,
    required this.controller,
    required this.hintText,
    this.validate,
  });

  @override
  State<CustomDateField> createState() => _CustomDateFieldState();
}

class _CustomDateFieldState extends State<CustomDateField> {
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 3650)),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: kPrimaryColor,
            hintColor: kPrimaryColor,
            colorScheme: ColorScheme.light(
              primary: kPrimaryColor,
              background: kLightSecondaryColor,
              surfaceTint: kLightSecondaryColor,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked.toString() != widget.controller?.text) {
      setState(
            () {
          widget.controller?.text = DateFormat('yyyy-MM-dd').format(picked).toString();
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      controller: widget.controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: kLightAccentColor,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: kLightAccentColor,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: kLightAccentColor,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: kLightAccentColor,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: kLightAccentColor,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: kLightAccentColor,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: kLightAccentColor,
        ),
        suffixIcon: const Icon(
          Icons.calendar_month_rounded,
        ),
        suffixIconColor: kDarkAccentColor,
      ),
      onTap: () => _selectDate(context),
      validator: (value) {
        if (widget.validate != null && widget.validate == true && value?.isEmpty == true) {
          return 'Please fill this field to continue';
        } else {
          return null;
        }
      },
    );
  }
}
