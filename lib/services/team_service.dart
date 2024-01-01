import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:twity_bird_badminton/models/team.dart';
import 'package:twity_bird_badminton/screens/team_screen.dart';
import 'package:twity_bird_badminton/widgets/snack_bars.dart';

class TeamService extends ChangeNotifier {
  List<Team> teamList = [];
  Team selectedTeam = Team();

  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> createTeam(
    BuildContext context,
    Team team,
  ) async {
    try {
      await _firebaseFirestore.collection('teams').add(team.toJson()).then(
        (docRef) async {
          Team storedTeam = Team(
            id: docRef.id,
            name: team.name,
            practiceTiming: team.practiceTiming,
          );
          await _firebaseFirestore
              .collection('teams')
              .doc(docRef.id)
              .update(
                storedTeam.toJson(),
              )
              .whenComplete(
            () {
              getTeams(context).whenComplete(
                () => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TeamScreen(),
                  ),
                  (route) => false,
                ),
              );
            },
          );
        },
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        errorSnackBar(e.toString()),
      );
    }
  }

  Future<void> updateTeam(
    BuildContext context,
    Team team,
  ) async {
    try {
      await _firebaseFirestore.collection('teams').doc(team.id).update(team.toJson()).whenComplete(
        () {
          getTeams(context).whenComplete(
            () => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const TeamScreen(),
              ),
              (route) => false,
            ),
          );
        },
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        errorSnackBar(e.toString()),
      );
    }
  }

  Future<void> getTeams(
    BuildContext context,
  ) async {
    try {
      QuerySnapshot teamSnapshot = await _firebaseFirestore.collection('teams').get();
      teamList.clear();
      teamList.addAll(
        teamSnapshot.docs.map(
          (doc) {
            return Team.fromJson(
              doc.data() as Map<String, dynamic>,
            );
          },
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        errorSnackBar(e.toString()),
      );
    }
  }

  Future<void> deleteTeam(
    BuildContext context,
  ) async {
    try {
      await _firebaseFirestore.collection('teams').doc(selectedTeam.id).delete().whenComplete(
            () => getTeams(context).whenComplete(
              () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const TeamScreen(),
                ),
                (route) => false,
              ),
            ),
          );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        errorSnackBar(e.toString()),
      );
    }
  }
}
