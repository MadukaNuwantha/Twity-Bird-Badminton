import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twity_bird_badminton/constants.dart';
import 'package:twity_bird_badminton/services/team_service.dart';

class SelectTeamDialog extends StatelessWidget {
  final TextEditingController teamIdController;
  final TextEditingController teamNameController;
  const SelectTeamDialog({
    super.key,
    required this.teamIdController,
    required this.teamNameController,
  });

  @override
  Widget build(BuildContext context) {
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
              'Select a team',
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
        content: Consumer<TeamService>(
          builder: (context, teamService, child) {
            if (teamService.teamList.isNotEmpty) {
              return SizedBox(
                width: double.maxFinite,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: teamService.teamList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        teamIdController.text = teamService.teamList[index].id!;
                        teamNameController.text = teamService.teamList[index].name!;
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 20,
                        ),
                        child: Text(
                          teamService.teamList[index].name.toString(),
                        ),
                      ),
                    );
                  },
                ),
              );
            } else {
              return const SizedBox(
                width: double.infinity,
                child: Text('No teams to display'),
              );
            }
          },
        ),
      ),
    );
  }
}
