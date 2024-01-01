import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:twity_bird_badminton/constants.dart';
import 'package:twity_bird_badminton/dialog/select_team_dialog.dart';
import 'package:twity_bird_badminton/models/player.dart';
import 'package:twity_bird_badminton/models/team.dart';
import 'package:twity_bird_badminton/services/player_service.dart';
import 'package:twity_bird_badminton/services/team_service.dart';
import 'package:twity_bird_badminton/widgets/custom_date_field.dart';
import 'package:twity_bird_badminton/widgets/custom_phone_field.dart';
import 'package:twity_bird_badminton/widgets/custom_popup_field.dart';
import 'package:twity_bird_badminton/widgets/custom_submit_button.dart';
import 'package:twity_bird_badminton/widgets/custom_text_field.dart';

class CreatePlayerScreen extends StatefulWidget {
  const CreatePlayerScreen({super.key});

  @override
  State<CreatePlayerScreen> createState() => _CreatePlayerScreenState();
}

class _CreatePlayerScreenState extends State<CreatePlayerScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController contactNumberCountryController = TextEditingController();
  TextEditingController contactNumberController = TextEditingController();
  TextEditingController parentContactNumberCountryController = TextEditingController();
  TextEditingController parentContactNumberController = TextEditingController();
  TextEditingController teamIdController = TextEditingController();
  TextEditingController teamNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        surfaceTintColor: kLightSecondaryColor,
        backgroundColor: kLightSecondaryColor,
        foregroundColor: kLightSecondaryColor,
        shadowColor: kLightAccentColor,
        title: Text(
          'Create Player',
          style: GoogleFonts.inter(
            color: kDarkSecondaryColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: kDarkSecondaryColor,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: kVerticalPadding,
            horizontal: kHorizontalPadding,
          ),
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'First Name',
                            style: GoogleFonts.inter(
                              color: kDarkSecondaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      CustomTextField(
                        controller: firstNameController,
                        hintText: 'Ex: Jon',
                        validate: true,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            'Last Name',
                            style: GoogleFonts.inter(
                              color: kDarkSecondaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      CustomTextField(
                        controller: lastNameController,
                        hintText: 'Ex: Fernando',
                        validate: true,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            'Age',
                            style: GoogleFonts.inter(
                              color: kDarkSecondaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      CustomTextField(
                        controller: ageController,
                        hintText: 'XX',
                        validate: true,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            'DOB',
                            style: GoogleFonts.inter(
                              color: kDarkSecondaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      CustomDateField(
                        controller: dobController,
                        hintText: 'YYYY-MM-DD',
                        validate: true,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            'Contact Number',
                            style: GoogleFonts.inter(
                              color: kDarkSecondaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      CustomPhoneField(
                        countryController: contactNumberCountryController,
                        phoneController: contactNumberController,
                        hintText: 'XXXXXXXXX',
                        validate: true,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            'Parent Contact Number',
                            style: GoogleFonts.inter(
                              color: kDarkSecondaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      CustomPhoneField(
                        countryController: parentContactNumberCountryController,
                        phoneController: parentContactNumberController,
                        hintText: 'XXXXXXXXX',
                        validate: true,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            'Team',
                            style: GoogleFonts.inter(
                              color: kDarkSecondaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      CustomPopUpField(
                        controller: teamNameController,
                        hintText: 'Ex: Badminton Team',
                        validate: true,
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => SelectTeamDialog(
                              teamIdController: teamIdController,
                              teamNameController: teamNameController,
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      const Spacer(),
                      CustomSubmitButton(
                        title: 'Create Player',
                        color: kPrimaryColor,
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            Team tempTeam = Team();
                            tempTeam = Provider.of<TeamService>(context, listen: false).teamList.firstWhere(
                                  (team) => team.id == teamIdController.text,
                                  orElse: () => Team(),
                                );
                            Player tempPlayer = Player(
                              firstName: firstNameController.text,
                              lastName: lastNameController.text,
                              age: ageController.text,
                              dob: dobController.text,
                              contactNumber: contactNumberCountryController.text + contactNumberController.text,
                              parentContactNumber:
                                  parentContactNumberCountryController.text + parentContactNumberController.text,
                              team: tempTeam,
                            );
                            Provider.of<PlayerService>(context, listen: false).createPlayer(context, tempPlayer);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
