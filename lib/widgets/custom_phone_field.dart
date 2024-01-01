import 'package:flutter/material.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:twity_bird_badminton/constants.dart';

class CustomPhoneField extends StatefulWidget {
  final TextEditingController phoneController;
  final TextEditingController countryController;
  final String hintText;
  final bool? validate;

  const CustomPhoneField({
    super.key,
    required this.hintText,
    this.validate,
    required this.phoneController,
    required this.countryController,
  });

  @override
  State<CustomPhoneField> createState() => _CustomPhoneFieldState();
}

class _CustomPhoneFieldState extends State<CustomPhoneField> {
  int maxLength = 0;
  String selectedCountryIsoCode = '';
  String selectedCountryDialCode = '';

  @override
  void initState() {
    super.initState();
    if (widget.countryController.text.isNotEmpty) {
      selectedCountryDialCode = widget.countryController.text;
      selectedCountryIsoCode =
          countries.firstWhere((element) => '+${element.dialCode}' == selectedCountryDialCode).code;
      maxLength = countries.firstWhere((element) => '+${element.dialCode}' == selectedCountryDialCode).maxLength;
    } else {
      selectedCountryDialCode = '+94';
      selectedCountryIsoCode = 'LK';
      maxLength = 9;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InternationalPhoneNumberInput(
      initialValue: PhoneNumber(isoCode: selectedCountryIsoCode),
      formatInput: false,
      selectorConfig: const SelectorConfig(
        selectorType: PhoneInputSelectorType.DIALOG,
        setSelectorButtonAsPrefixIcon: true,
        leadingPadding: 20,
        useEmoji: false,
        trailingSpace: false,
      ),
      selectorTextStyle: TextStyle(
        color: kDarkSecondaryColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      inputDecoration: InputDecoration(
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
      ),
      cursorColor: kDarkAccentColor,
      textFieldController: widget.phoneController,
      autoValidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (widget.validate != null && widget.validate == true && value!.isEmpty) {
          return 'Please fill this field to continue';
        } else if (value!.isNotEmpty && value.length != maxLength) {
          return 'Please enter a valid phone number';
        } else {
          return null;
        }
      },
      onInputChanged: (value) {
        selectedCountryIsoCode = value.isoCode!;
        selectedCountryDialCode = value.dialCode!;
        widget.countryController.text = selectedCountryDialCode;
        maxLength = countries.firstWhere((element) => element.code == value.isoCode).maxLength;
      },
    );
  }
}
