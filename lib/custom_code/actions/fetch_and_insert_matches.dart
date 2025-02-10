// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'package:http/http.dart' as http;

/// Define a Dart class to represent match data.
class MatchData {
  final int teamNumber;
  final int matchNumber;
  final String allianceColor;
  final int eventid;
  final String comptype;
  final String userId;
  final String email;

  MatchData({
    required this.teamNumber,
    required this.matchNumber,
    required this.allianceColor,
    required this.eventid,
    required this.comptype,
    required this.userId,
    required this.email,
  });

  /// Convert the match data to a map format for insertion into Supabase.
  Map<String, dynamic> toMap() {
    return {
      'teamnumber': teamNumber,
      'compnum': matchNumber, // Adjusted match number
      'comptype': comptype,
      'alliancecolor': allianceColor,
      'autoendgamerobotpos': "None",
      'teleopendgamerobotpos': "None",
      'note': "",
      'eventid': eventid,
      'total': 0,
      'autosamplenet': 0,
      'teleopsamplenet': 0,
      'autohighbusketsample': 0,
      'autolowbusketsample': 0,
      'autohighchemberspec': 0,
      'autolowchemberspec': 0,
      'teleophighbusketsample': 0,
      'teleoplowbusketsample': 0,
      'teleophighchemberspec': 0,
      'teleoplowchemberspec': 0,
      'autototal': 0,
      'teleoptotal': 0,
      'user_id': userId,
      'email': email,
    };
  }
}

/// Fetch match data from API and insert into Supabase.
Future<void> fetchAndInsertMatches(
    String eventCode, int eventid, String userId, String email) async {
  final url = Uri.parse(
      'https://api.ftcscout.org/rest/v1/events/2024/$eventCode/matches');

  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> matches = json.decode(response.body);
      List<MatchData> matchDataList = [];
      int playoffMatchCounter = 1; // Start Playoff Matches from 1

      for (var match in matches) {
        int matchNumber = match['id'];
        String comptype;
        int adjustedMatchNumber;

        if (matchNumber < 999) {
          comptype = "Qualifications";
          adjustedMatchNumber = matchNumber; // Keep original number
        } else {
          comptype = "Playoffs";
          adjustedMatchNumber = playoffMatchCounter++; // Reset to start from 1
        }

        for (var team in match['teams']) {
          String allianceColor = team['alliance'].toLowerCase();

          if (allianceColor != "red" && allianceColor != "blue") {
            continue;
          }

          matchDataList.add(MatchData(
            teamNumber: team['teamNumber'],
            matchNumber: adjustedMatchNumber, // Updated match number
            allianceColor: allianceColor,
            eventid: eventid,
            comptype: comptype,
            userId: userId,
            email: email,
          ));
        }
      }

      // Insert all match data into Supabase
      if (matchDataList.isNotEmpty) {
        await Supabase.instance.client
            .from('compscoutlist')
            .insert(matchDataList.map((data) => data.toMap()).toList());
      }
    }
  } catch (e) {
    print("Error: $e");
  }
}
