import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';
import 'package:twity_bird_badminton/constants.dart';
import 'package:twity_bird_badminton/screens/home_screen.dart';
import 'package:twity_bird_badminton/services/player_service.dart';
import 'package:twity_bird_badminton/services/team_service.dart';
import 'package:twity_bird_badminton/size_config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () {
        Provider.of<TeamService>(context, listen: false).getTeams(context).then(
              (value) => Provider.of<PlayerService>(context, listen: false).getPlayers(context).then(
                    (value) => Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                      (route) => false,
                    ),
                  ),
            );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Twity Bird Badminton',
              textAlign: TextAlign.center,
              style: GoogleFonts.alegreya(
                color: kDarkAccentColor,
                fontSize: 50,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: SizedBox(
                width: SizeConfig.blockSizeHorizontal * 15,
                child: LoadingIndicator(
                  indicatorType: Indicator.ballSpinFadeLoader,
                  colors: [
                    kPrimaryColor,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
