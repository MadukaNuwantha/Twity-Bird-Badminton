import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:twity_bird_badminton/constants.dart';
import 'package:twity_bird_badminton/dialog/confirm_delete_player_dialog.dart';
import 'package:twity_bird_badminton/dialog/confirm_delete_team_dialog.dart';
import 'package:twity_bird_badminton/models/practice_timing.dart';
import 'package:twity_bird_badminton/screens/create_team_screen.dart';
import 'package:twity_bird_badminton/screens/home_screen.dart';
import 'package:twity_bird_badminton/screens/player_screen.dart';
import 'package:twity_bird_badminton/screens/team_screen.dart';
import 'package:twity_bird_badminton/screens/update_player_screen.dart';
import 'package:twity_bird_badminton/screens/update_team_screen.dart';
import 'package:twity_bird_badminton/services/player_service.dart';
import 'package:twity_bird_badminton/services/team_service.dart';
import 'package:twity_bird_badminton/widgets/custom_submit_button.dart';
import 'package:twity_bird_badminton/widgets/team_tile.dart';

class ViewPlayerScreen extends StatefulWidget {
  const ViewPlayerScreen({super.key});

  @override
  State<ViewPlayerScreen> createState() => _ViewPlayerScreenState();
}

class _ViewPlayerScreenState extends State<ViewPlayerScreen> {
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
          'View Player',
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
                builder: (context) => const PlayerScreen(),
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
                child: Consumer<PlayerService>(
                  builder: (context, playerService, child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            '${playerService.selectedPlayer.firstName} ${playerService.selectedPlayer.lastName}',
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
                              'Player Team',
                              style: GoogleFonts.poppins(
                                color: kDarkSecondaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              playerService.selectedPlayer.team!.name.toString(),
                              style: GoogleFonts.poppins(
                                color: kDarkSecondaryColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Divider(
                          color: kDarkAccentColor,
                          thickness: 1,
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Text(
                              'Player Contact',
                              style: GoogleFonts.poppins(
                                color: kDarkSecondaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              '${playerService.selectedPlayer.contactNumberCountry}${playerService.selectedPlayer.contactNumber}',
                              style: GoogleFonts.poppins(
                                color: kDarkSecondaryColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Divider(
                          color: kDarkAccentColor,
                          thickness: 1,
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Text(
                              'Player Parent Contact',
                              style: GoogleFonts.poppins(
                                color: kDarkSecondaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              '${playerService.selectedPlayer.parentContactNumberCountry}${playerService.selectedPlayer.parentContactNumber}',
                              style: GoogleFonts.poppins(
                                color: kDarkSecondaryColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Divider(
                          color: kDarkAccentColor,
                          thickness: 1,
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Text(
                              'Player Birthday',
                              style: GoogleFonts.poppins(
                                color: kDarkSecondaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              playerService.selectedPlayer.dob.toString(),
                              style: GoogleFonts.poppins(
                                color: kDarkSecondaryColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Divider(
                          color: kDarkAccentColor,
                          thickness: 1,
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Text(
                              'Player Age',
                              style: GoogleFonts.poppins(
                                color: kDarkSecondaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              playerService.selectedPlayer.age.toString(),
                              style: GoogleFonts.poppins(
                                color: kDarkSecondaryColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Divider(
                          color: kDarkAccentColor,
                          thickness: 1,
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Text(
                              'Practice Timings',
                              style: GoogleFonts.poppins(
                                color: kDarkSecondaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Column(
                          children: playerService.selectedPlayer.team!.practiceTiming!
                              .map(
                                (practice) => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      practice.day.toString(),
                                      style: GoogleFonts.poppins(
                                        color: kDarkSecondaryColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
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
                        const SizedBox(height: 5),
                        Divider(
                          color: kDarkAccentColor,
                          thickness: 1,
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
                                      builder: (context) => const UpdatePlayerScreen(),
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
                                    builder: (context) => const ConfirmDeletePlayerDialog(),
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
