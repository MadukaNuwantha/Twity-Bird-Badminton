import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:twity_bird_badminton/constants.dart';
import 'package:twity_bird_badminton/models/practice_timing.dart';
import 'package:twity_bird_badminton/models/team.dart';
import 'package:twity_bird_badminton/services/team_service.dart';
import 'package:twity_bird_badminton/size_config.dart';
import 'package:twity_bird_badminton/util/practice.dart';
import 'package:twity_bird_badminton/widgets/custom_submit_button.dart';
import 'package:twity_bird_badminton/widgets/custom_text_field.dart';
import 'package:twity_bird_badminton/widgets/dynamic_practice_form.dart';

class UpdateTeamScreen extends StatefulWidget {
  const UpdateTeamScreen({super.key});

  @override
  State<UpdateTeamScreen> createState() => _UpdateTeamScreenState();
}

class _UpdateTeamScreenState extends State<UpdateTeamScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> dynamicPracticeFormKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  List<Practice> practiceControllerList = [];

  @override
  void initState() {
    Team selectedTeam = Provider.of<TeamService>(context, listen: false).selectedTeam;
    nameController.text = selectedTeam.name!;
    for (int i = 0; i < selectedTeam.practiceTiming!.length; i++) {
      practiceControllerList.add(
        Practice(
          date: TextEditingController(text: selectedTeam.practiceTiming![i].day),
          startTime: TextEditingController(text: selectedTeam.practiceTiming![i].startTime),
          endTime: TextEditingController(text: selectedTeam.practiceTiming![i].endTime),
        ),
      );
    }
    setState(() {});
    super.initState();
  }

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
          'Update Team',
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
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: kVerticalPadding,
              horizontal: kHorizontalPadding,
            ),
            child: Column(
              children: [
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Team Name',
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
                        controller: nameController,
                        hintText: 'Team Name',
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            'Practice Schedule',
                            style: GoogleFonts.inter(
                              color: kDarkSecondaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 1,
                            color: kLightAccentColor,
                          ),
                        ),
                        child: DynamicPracticeForm(
                          practiceControllerList: practiceControllerList,
                          formKey: dynamicPracticeFormKey,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                CustomSubmitButton(
                  title: 'Update',
                  color: kPrimaryColor,
                  onTap: () {
                    List<PracticeTiming> practiceTiming = [];
                    for (int i = 0; i < practiceControllerList.length; i++) {
                      practiceTiming.add(
                        PracticeTiming(
                          day: practiceControllerList[i].date.text,
                          startTime: practiceControllerList[i].startTime.text,
                          endTime: practiceControllerList[i].endTime.text,
                        ),
                      );
                    }
                    Team tempTeam = Team(
                      id: Provider.of<TeamService>(context, listen: false).selectedTeam.id,
                      name: nameController.text,
                      practiceTiming: practiceTiming,
                    );
                    Provider.of<TeamService>(context, listen: false).updateTeam(
                      context,
                      tempTeam,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
