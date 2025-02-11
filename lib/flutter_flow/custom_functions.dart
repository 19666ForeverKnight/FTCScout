import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

String? displaycomptype(String matchtype) {
  if (matchtype == "Qualifications") {
    return "Q";
  } else if (matchtype == "Practice") {
    return "PA";
  } else if (matchtype == "Playoffs") {
    return "PO";
  }
}

int calteleoptotal(
  int highbasket,
  int lowbasket,
  int net,
  int highchember,
  int lowchember,
  String endgame,
) {
  int eg = 0;
  if (endgame == "Observation Zone") {
    eg = 3;
  } else if (endgame == "Level 1 Ascent") {
    eg = 3;
  } else if (endgame == "Level 2 Ascent") {
    eg = 15;
  } else if (endgame == "None") {
    eg = 0;
  } else {
    eg = 30;
  }
  int total = highbasket * 8 +
      lowbasket * 4 +
      net * 2 +
      highchember * 10 +
      lowchember * 6 +
      eg;
  return total;
}

String? convertdropdownsorttosearchquaryforpit(
  String? sorttype,
  String? sortdirection,
) {
  if (sorttype == "None") {
    //return []&order=[sortkey].;
    return "";
  } else if (sortdirection == "Descending") {
    if (sorttype == "Auto Sample") {
      return ",expautosample&order=expautosample.desc";
    } else if (sorttype == "Auto Specimen") {
      return ",expautospec&order=expautospec.desc";
    } else if (sorttype == "Auto Net") {
      return ",expautosamplenet&order=expautosamplenet.desc";
    } else if (sorttype == "Teleop Sample") {
      return ",expteleopsample&order=expteleopsample.desc";
    } else if (sorttype == "Teleop Specimen") {
      return ",expteleopspec&order=expteleopspec.desc";
    } else {
      return ",expteleopsamplenet&order=expteleopsamplenet.desc";
    }
  } else {
    if (sorttype == "Auto Sample") {
      return ",expautosample&order=expautosample.asc";
    } else if (sorttype == "Auto Specimen") {
      return ",expautospec&order=expautospec.asc";
    } else if (sorttype == "Auto Net") {
      return ",expautosamplenet&order=expautosamplenet.asc";
    } else if (sorttype == "Teleop Sample") {
      return ",expteleopsample&order=expteleopsample.asc";
    } else if (sorttype == "Teleop Specimen") {
      return ",expteleopspec&order=expteleopspec.asc";
    } else {
      return ",expteleopsamplenet&order=expteleopsamplenet.asc";
    }
  }
}

String? convertdropdownsorttosearchquary(
  String? sorttype,
  String? sortdirection,
) {
  if (sorttype == "None") {
    //return []&order=[sortkey].;
    return "";
  } else if (sortdirection == "Descending") {
    if (sorttype == "Auto Sample" || sorttype == "自动标本") {
      return "&order=autohighbusketsample.desc&order=autolowbusketsample.desc";
    } else if (sorttype == "Auto Spec" || sorttype == "自动样本") {
      return "&order=autohighchemberspec.desc&order=autolowchemberspec.desc";
    } else if (sorttype == "Teleop Sample" || sorttype == "手动标本") {
      return "&order=teleophighbusketsample.desc&order=teleoplowbusketsample.desc";
    } else if (sorttype == "Teleop Spec" || sorttype == "手动样本") {
      return "&order=teleophighchemberspec.desc&order=teleoplowchemberspec.desc";
    } else {
      return "";
    }
  } else {
    if (sorttype == "Auto Sample" || sorttype == "自动标本") {
      return "&order=autohighbusketsample.asc&order=autolowbusketsample.asc";
    } else if (sorttype == "Auto Spec" || sorttype == "自动样本") {
      return "&order=autohighchemberspec.asc&order=autolowchemberspec.asc";
    } else if (sorttype == "Teleop Sample" || sorttype == "手动标本") {
      return "&order=teleophighbusketsample.asc&order=teleoplowbusketsample.asc";
    } else if (sorttype == "Teleop Spec" || sorttype == "手动样本") {
      return "&order=teleophighchemberspec.asc&order=teleoplowchemberspec.asc";
    } else {
      return "";
    }
  }
}

double calteammeanauto(List<dynamic> data) {
  int totalEntries = data.length;

  if (totalEntries == 0) {
    return 0.0;
  }

  double autoTotal = 0.0;

  for (var entry in data) {
    autoTotal += entry['autototal'] ?? 0.0;
  }

  double autoMean = autoTotal / totalEntries;

  return autoMean;
}

double calteammeantotal(List<dynamic> data) {
  int totalEntries = data.length;

  if (totalEntries == 0) {
    return 0.0;
  }

  double totalTotal = 0.0;

  for (var entry in data) {
    totalTotal += entry['total'] ?? 0.0;
  }

  double totalMean = totalTotal / totalEntries;

  return totalMean;
}

int calautototal(
  int highbasket,
  int lowbasket,
  int net,
  int highchember,
  int lowchember,
  String endgame,
) {
  int eg = 0;
  if (endgame != "None") {
    eg = 3;
  }
  int total = highbasket * 16 +
      lowbasket * 8 +
      net * 4 +
      highchember * 20 +
      lowchember * 12 +
      eg;
  return total;
}

double calteammeanteleop(List<dynamic> data) {
  int totalEntries = data.length;

  if (totalEntries == 0) {
    return 0.0;
  }

  double teleopTotal = 0.0;

  for (var entry in data) {
    teleopTotal += entry['teleoptotal'] ?? 0.0;
  }

  double teleopMean = teleopTotal / totalEntries;

  return teleopMean;
}

int? calmax(List<int> inputlist) {
  if (inputlist.isEmpty) {
    return null; // Return null if the list is empty
  }

  return inputlist.reduce((a, b) => a > b ? a : b); // Return the max value
}

int? calmin(List<int> inputlist) {
  if (inputlist.isEmpty) {
    return null; // Return null if the list is empty
  }

  return inputlist.reduce((a, b) => a < b ? a : b);
}
