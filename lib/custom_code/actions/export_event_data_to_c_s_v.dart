// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert' show utf8;
import 'package:download/download.dart';

/// Fetches all data from Supabase based on the given eventid and exports it as a CSV file.
Future<void> exportEventDataToCSV(int eventid, String eventname) async {
  try {
    // Query Supabase for records matching the eventid
    final List<Map<String, dynamic>>? records = await Supabase.instance.client
        .from('compscoutlist') // Use the correct table name
        .select()
        .eq('eventid', eventid);

    if (records == null || records.isEmpty) {
      return; // Exit function silently if there is no data
    }

    // CSV Headers (excluding id, created_at, eventid, user_id, email)
    List<String> headers = [
      "teamnumber",
      "compnum",
      "comptype",
      "alliancecolor",
      "autoendgamerobotpos",
      "teleopendgamerobotpos",
      "note",
      "total",
      "autosamplenet",
      "teleopsamplenet",
      "autohighbusketsample",
      "autolowbusketsample",
      "autohighchemberspec",
      "autolowchemberspec",
      "teleophighbusketsample",
      "teleoplowbusketsample",
      "teleophighchemberspec",
      "teleoplowchemberspec",
      "autototal",
      "teleoptotal"
    ];

    // Convert records into CSV format
    String fileContent = headers.join(";"); // CSV header

    for (var record in records) {
      List<String> row =
          headers.map((header) => record[header]?.toString() ?? "").toList();
      fileContent += "\n" + row.join(";");
    }

    // Format the filename: FTCScout_<eventname>_<datetime>_export.csv
    final formattedDate = DateTime.now()
        .toIso8601String()
        .replaceAll(":", "-"); // Replace colons to prevent filename issues
    final fileName = "FTCScout_${eventname}_${formattedDate}_export.csv";

    var bytes = utf8.encode(fileContent);

    // Create a stream for the file content and initiate download
    final stream = Stream.fromIterable(bytes);
    return download(stream, fileName);
  } catch (_) {
    return; // Silently handle any errors
  }
}
