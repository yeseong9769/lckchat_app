import '../../flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';
export 'api_manager.dart' show ApiCallResponse;

class GetStandingsCall {
  static Future<ApiCallResponse> call(String tournamentId) {
    return ApiManager.instance.makeApiCall(
      callName: 'GetStandings',
      apiUrl:
          'https://esports-api.lolesports.com/persisted/gw/getStandingsV3?hl=ko-KR&tournamentId=$tournamentId',
      callType: ApiCallType.GET,
      headers: {
        'X-Api-Key': '0TvQnueqKa5mxJntVWt0w4LpLfEkrV1Ta8rQBb9Z',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
    );
  }

  static dynamic rankings(dynamic response) => getJsonField(
        response,
        r'''$.data.standings[:].stages[:].sections[:].rankings[:]''',
        true,
      );
}

class GetScheduleCall {
  static Future<ApiCallResponse> call() async {
    final presentCallResponse = await presentCall();
    final olderCallResponse = await olderCall(getJsonField(presentCallResponse.jsonBody, r'$.data.schedule.pages.older'));
    final newerCallResponse = await newerCall(getJsonField(presentCallResponse.jsonBody, r'$.data.schedule.pages.newer'));

    final events1 =
        getJsonField(presentCallResponse.jsonBody, r'$.data.schedule.events') as List;
    final events2 =
        getJsonField(olderCallResponse.jsonBody, r'$.data.schedule.events') as List;
    final events3 =
        getJsonField(newerCallResponse.jsonBody, r'$.data.schedule.events') as List;

    final combinedEvents = [...events1, ...events2, ...events3];

    presentCallResponse.jsonBody['data']['schedule']['events'] = combinedEvents;

    return presentCallResponse;
  }

  static Future<ApiCallResponse> presentCall() {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Schedule',
      apiUrl:
          'https://esports-api.lolesports.com/persisted/gw/getSchedule?hl=ko-KR&leagueId=98767991310872058',
      callType: ApiCallType.GET,
      headers: {
        'X-API-Key': '0TvQnueqKa5mxJntVWt0w4LpLfEkrV1Ta8rQBb9Z',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static Future<ApiCallResponse> olderCall(String pageToken) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Schedule',
      apiUrl:
          'https://esports-api.lolesports.com/persisted/gw/getSchedule?hl=ko-KR&leagueId=98767991310872058&pageToken=$pageToken',
      callType: ApiCallType.GET,
      headers: {
        'X-API-Key': '0TvQnueqKa5mxJntVWt0w4LpLfEkrV1Ta8rQBb9Z',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static Future<ApiCallResponse> newerCall(String pageToken) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Schedule',
      apiUrl:
          'https://esports-api.lolesports.com/persisted/gw/getSchedule?hl=ko-KR&leagueId=98767991310872058&pageToken=$pageToken',
      callType: ApiCallType.GET,
      headers: {
        'X-API-Key': '0TvQnueqKa5mxJntVWt0w4LpLfEkrV1Ta8rQBb9Z',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic events(dynamic response) => getJsonField(
        response,
        r'''$.data.schedule.events''',
        true,
      );
}

// Event
class GetEventCall {
  static Future<ApiCallResponse> call(String matchId) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Event Detail',
      apiUrl:
          'https://esports-api.lolesports.com/persisted/gw/getEventDetails?hl=ko-KR&id=$matchId',
      callType: ApiCallType.GET,
      headers: {
        'X-API-Key': '0TvQnueqKa5mxJntVWt0w4LpLfEkrV1Ta8rQBb9Z',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
    );
  }
}

// 한 세트별
class GetLiveStats {
  static Future<ApiCallResponse> call(
      String gameId, String firstFrameTime) async {
    String startingTime = DateFormat("yyyy-MM-dd'T'HH:mm:00'Z'")
        .format(DateTime.parse(firstFrameTime).add(const Duration(hours: 5)));
    return ApiManager.instance.makeApiCall(
      callName: 'GetLiveStats',
      apiUrl:
          'https://feed.lolesports.com/livestats/v1/window/$gameId?startingTime=${Uri.encodeComponent(startingTime)}',
      callType: ApiCallType.GET,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
    );
  }
}

class RasaApiCall {
  static Future<ApiCallResponse> call(String message) {
    return ApiManager.instance.makeApiCall(
      callName: 'RasaApiCall',
      apiUrl:
          'http://49.247.42.241:5005/webhooks/rest/webhook?token=inhatc1234!!',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
          <String, String>{"sender": "test_user", "message": message}),
      bodyType: BodyType.JSON,
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
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
