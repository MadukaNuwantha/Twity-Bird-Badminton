import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:twity_bird_badminton/constants.dart';
import 'package:twity_bird_badminton/screens/create_player_screen.dart';
import 'package:twity_bird_badminton/services/player_service.dart';
import 'package:twity_bird_badminton/widgets/player_tile.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({super.key});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
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
          'Players',
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
              builder: (context) => const CreatePlayerScreen(),
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
                Consumer<PlayerService>(
                  builder: (context, playerService, child) {
                    if (playerService.playerList.isNotEmpty) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: playerService.playerList.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => PlayerTile(
                          player: playerService.playerList[index],
                        ),
                      );
                    } else {
                      return const Center(
                        child: Text(
                          'No players to display',
                        ),
                      );
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
