import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start FTC Event Group Code

class FTCEventGroup {
  static String getBaseUrl() => 'https://ftc-api.firstinspires.org';
  static Map<String, String> headers = {
    'Authorization':
        'Basic VG9teTk5OToyMjkzQ0U1My05ODM1LTQ5MTktOENCOS1GOTA5RTI0MEQ5MEU=',
  };
  static GetEventInfoListCall getEventInfoListCall = GetEventInfoListCall();
}

class GetEventInfoListCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = FTCEventGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get event Info List ',
      apiUrl: '$baseUrl/v2.0/2024/events',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Basic VG9teTk5OToyMjkzQ0U1My05ODM1LTQ5MTktOENCOS1GOTA5RTI0MEQ5MEU=',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? eventscode(dynamic response) => (getJsonField(
        response,
        r'''$.events[:].code''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? eventsname(dynamic response) => (getJsonField(
        response,
        r'''$.events[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? eventsdate(dynamic response) => (getJsonField(
        response,
        r'''$.events[:].dateStart''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? events(dynamic response) => getJsonField(
        response,
        r'''$.events''',
        true,
      ) as List?;
}

/// End FTC Event Group Code

class SearchComplistCall {
  static Future<ApiCallResponse> call({
    String? searchstring = '',
    String? sortq = '',
    String? uuid = '',
    int? eventid,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Search Complist',
      apiUrl:
          'https://thgjyxwhwbuqpejcrvkg.supabase.co/rest/v1/compscoutlist?teamnumber=ilike.*$searchstring*&user_id=eq.$uuid&eventid=eq.$eventid$sortq',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRoZ2p5eHdod2J1cXBlamNydmtnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzc2ODA2ODAsImV4cCI6MjA1MzI1NjY4MH0.cpHNasNXz_Sl5XF8wFkJcBWbMCAUCWrG6AD8KWE3rVs',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRoZ2p5eHdod2J1cXBlamNydmtnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzc2ODA2ODAsImV4cCI6MjA1MzI1NjY4MH0.cpHNasNXz_Sl5XF8wFkJcBWbMCAUCWrG6AD8KWE3rVs',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SearchPitlistCall {
  static Future<ApiCallResponse> call({
    String? searchstring = '',
    String? sortq = '',
    String? uuid = '',
    int? eventid,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Search Pitlist',
      apiUrl:
          'https://thgjyxwhwbuqpejcrvkg.supabase.co/rest/v1/pitscoutlist?teamnumber=ilike.*$searchstring*&user_id=eq.$uuid&eventid=eq.$eventid$sortq',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRoZ2p5eHdod2J1cXBlamNydmtnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzc2ODA2ODAsImV4cCI6MjA1MzI1NjY4MH0.cpHNasNXz_Sl5XF8wFkJcBWbMCAUCWrG6AD8KWE3rVs',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRoZ2p5eHdod2J1cXBlamNydmtnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzc2ODA2ODAsImV4cCI6MjA1MzI1NjY4MH0.cpHNasNXz_Sl5XF8wFkJcBWbMCAUCWrG6AD8KWE3rVs',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
