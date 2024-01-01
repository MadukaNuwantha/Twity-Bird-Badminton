import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:twity_bird_badminton/constants.dart';
import 'package:twity_bird_badminton/dialog/confirm_delete_team_dialog.dart';
import 'package:twity_bird_badminton/models/practice_timing.dart';
import 'package:twity_bird_badminton/screens/create_team_screen.dart';
import 'package:twity_bird_badminton/screens/home_screen.dart';
import 'package:twity_bird_badminton/screens/team_screen.dart';
import 'package:twity_bird_badminton/screens/update_team_screen.dart';
import 'package:twity_bird_badminton/services/team_service.dart';
import 'package:twity_bird_badminton/widgets/custom_submit_button.dart';
import 'package:twity_bird_badminton/widgets/team_tile.dart';

class ViewTeamScreen extends StatefulWidget {
  const ViewTeamScreen({super.key});

  @override
  State<ViewTeamScreen> createState() => _ViewTeamScreenState();
}

class _ViewTeamScreenState extends State<ViewTeamScreen> {
  @override
  void dispose() {
    super.dispose();
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
          'View Team',
          style: GoogleFonts.inter(
            color: kDarkSecondaryColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TeamScreen(),
              ),
            );
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
                child: Consumer<TeamService>(
                  builder: (context, teamService, child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            teamService.selectedTeam.name.toString(),
                            style: GoogleFonts.poppins(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Text(
                              'Practice Timings',
                              style: GoogleFonts.poppins(
                                color: kDarkSecondaryColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Column(
                          children: teamService.selectedTeam.practiceTiming!
                              .map(
                                (practice) => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      practice.day.toString(),
                                      style: GoogleFonts.poppins(
                                        color: kDarkSecondaryColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Start Time : ${DateFormat('h:mm a').format(DateFormat('HH:mm').parse(practice.startTime!))}',
                                          style: GoogleFonts.poppins(
                                            color: kDarkSecondaryColor,
                                            fontSize: 12,
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                        Text(
                                          'End Time : ${DateFormat('h:mm a').format(DateFormat('HH:mm').parse(practice.endTime!))}',
                                          style: GoogleFonts.poppins(
                                            color: kDarkSecondaryColor,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 15),
                                  ],
                                ),
                              )
                              .toList(),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Expanded(
                              child: CustomSubmitButton(
                                title: 'Edit',
                                color: kPrimaryColor,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const UpdateTeamScreen(),
                                    ),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: CustomSubmitButton(
                                title: 'Delete',
                                color: kDarkSecondaryColor,
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => const ConfirmDeleteTeamDialog(),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
