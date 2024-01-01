import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:twity_bird_badminton/constants.dart';
import 'package:twity_bird_badminton/screens/create_team_screen.dart';
import 'package:twity_bird_badminton/services/team_service.dart';
import 'package:twity_bird_badminton/widgets/team_tile.dart';

class TeamScreen extends StatefulWidget {
  const TeamScreen({super.key});

  @override
  State<TeamScreen> createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> {
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
          'Teams',
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        child: Icon(
          Icons.add,
          color: kLightSecondaryColor,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CreateTeamScreen(),
            ),
          );
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: kVerticalPadding,
            horizontal: kHorizontalPadding,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Consumer<TeamService>(
                  builder: (context, teamService, child) {
                    if (teamService.teamList.isNotEmpty) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: teamService.teamList.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => TeamTile(
                          team: teamService.teamList[index],
                        ),
                      );
                    } else {
                      return const Text('No teams to display');
                    }
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
