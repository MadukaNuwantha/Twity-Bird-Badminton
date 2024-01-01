import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twity_bird_badminton/constants.dart';
import 'package:twity_bird_badminton/models/team.dart';

class TeamTile extends StatefulWidget {
  final Team team;

  const TeamTile({
    super.key,
    required this.team,
  });

  @override
  State<TeamTile> createState() => _TeamTileState();
}

class _TeamTileState extends State<TeamTile> {
  List<String> practiceDays = [];

  @override
  void initState() {
    if (widget.team.practiceTiming != null && widget.team.practiceTiming!.isNotEmpty) {
      for (int i = 0; i < widget.team.practiceTiming!.length; i++) {
        practiceDays.add(
          widget.team.practiceTiming![i].day.toString(),
        );
      }
    }
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: ShapeDecoration(
                color: kLightSecondaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 6,
                    offset: Offset(1, 1),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.team.name.toString(),
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.inter(
                              color: kDarkSecondaryColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            practiceDays.join(", "),
                            style: GoogleFonts.inter(
                              color: kDarkAccentColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
