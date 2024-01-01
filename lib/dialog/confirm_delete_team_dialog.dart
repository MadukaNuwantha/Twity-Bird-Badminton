import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:twity_bird_badminton/constants.dart';
import 'package:twity_bird_badminton/services/team_service.dart';
import 'package:twity_bird_badminton/widgets/custom_submit_button.dart';

class ConfirmDeleteTeamDialog extends StatelessWidget {
  const ConfirmDeleteTeamDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Dialog(
        backgroundColor: kLightSecondaryColor,
        surfaceTintColor: kLightSecondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Text(
                  Provider.of<TeamService>(context, listen: false).selectedTeam.name.toString(),
                  style: GoogleFonts.inter(
                    color: kDarkSecondaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  'Are you sure you want to delete team?',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    color: kDarkAccentColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: CustomSubmitButton(
                      title: 'No',
                      color: kDarkSecondaryColor,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: CustomSubmitButton(
                      title: 'Yes',
                      color: kPrimaryColor,
                      onTap: () {
                        Provider.of<TeamService>(context, listen: false).deleteTeam(context);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
