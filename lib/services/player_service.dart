import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:twity_bird_badminton/models/player.dart';
import 'package:twity_bird_badminton/models/team.dart';
import 'package:twity_bird_badminton/screens/player_screen.dart';
import 'package:twity_bird_badminton/screens/team_screen.dart';
import 'package:twity_bird_badminton/widgets/snack_bars.dart';

class PlayerService extends ChangeNotifier {
  List<Player> playerList = [];
  Player selectedPlayer = Player();
  Team selectedTeam = Team();

  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> getPlayers(
    BuildContext context,
  ) async {
    try {
      QuerySnapshot teamSnapshot = await _firebaseFirestore.collection('players').get();
      playerList.clear();
      playerList.addAll(
        teamSnapshot.docs.map(
          (doc) {
            return Player.fromJson(
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

  Future<void> createPlayer(
    BuildContext context,
    Player player,
  ) async {
    try {
      await _firebaseFirestore.collection('players').add(player.toJson()).then(
        (docRef) async {
          Player storedPlayer = Player(
            id: docRef.id,
            firstName: player.firstName,
            lastName: player.lastName,
            age: player.age,
            dob: player.dob,
            contactNumberCountry: player.contactNumberCountry,
            contactNumber: player.contactNumber,
            parentContactNumberCountry: player.parentContactNumberCountry,
            parentContactNumber: player.parentContactNumber,
            team: player.team,
          );
          await _firebaseFirestore
              .collection('players')
              .doc(docRef.id)
              .update(
                storedPlayer.toJson(),
              )
              .whenComplete(
            () {
              getPlayers(context).whenComplete(
                () => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PlayerScreen(),
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

  Future<void> updatePlayer(
    BuildContext context,
    Player player,
  ) async {
    try {
      await _firebaseFirestore.collection('players').doc(selectedPlayer.id).update(player.toJson()).whenComplete(
        () {
          getPlayers(context).whenComplete(
            () => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const PlayerScreen(),
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

  Future<void> deletePlayer(
    BuildContext context,
  ) async {
    try {
      await _firebaseFirestore.collection('players').doc(selectedPlayer.id).delete().whenComplete(
            () => getPlayers(context).whenComplete(
              () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const PlayerScreen(),
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
