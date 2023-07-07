import '../../flutter_flow/flutter_flow_web_view.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'game_data_model.dart';
export 'game_data_model.dart';

class GameDataWidget extends StatefulWidget {
  const GameDataWidget({Key? key, required this.matchId}) : super(key: key);

  final String matchId;

  @override
  _GameDataWidgetState createState() => _GameDataWidgetState();
}

class _GameDataWidgetState extends State<GameDataWidget> {
  late GameDataModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  int selectedIndex = 0; // Index of selected button

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GameDataModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: FutureBuilder<ApiCallResponse>(
            future: GetEventCall.call(widget.matchId),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(
                      color: FlutterFlowTheme.of(context).primary,
                    ),
                  ),
                );
              }
              final columnGetEventDetailResponse = snapshot.data!;
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    // 상단 바
                    Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 5, 0, 5),
                                  child: Container(
                                    width: 60,
                                    height: 60,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.network(
                                      getJsonField(
                                        columnGetEventDetailResponse.jsonBody,
                                        r'''$.data.event.match.teams[0].image''',
                                      ),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                Text(
                                  getJsonField(
                                    columnGetEventDetailResponse.jsonBody,
                                    r'''$.data.event.match.teams[0].result.gameWins''',
                                  ).toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: valueOrDefault<Color>(
                                          getJsonField(
                                                    columnGetEventDetailResponse
                                                        .jsonBody,
                                                    r'''$.data.event.match.teams[0].result.gameWins''',
                                                  ) <
                                                  getJsonField(
                                                    columnGetEventDetailResponse
                                                        .jsonBody,
                                                    r'''$.data.event.match.teams[1].result.gameWins''',
                                                  )
                                              ? FlutterFlowTheme.of(context)
                                                  .primaryBtnText
                                              : FlutterFlowTheme.of(context)
                                                  .warning,
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                        fontSize: 35,
                                      ),
                                ),
                                Text(
                                  ':',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontSize: 35,
                                      ),
                                ),
                                Text(
                                  getJsonField(
                                    columnGetEventDetailResponse.jsonBody,
                                    r'''$.data.event.match.teams[1].result.gameWins''',
                                  ).toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: valueOrDefault<Color>(
                                          getJsonField(
                                                    columnGetEventDetailResponse
                                                        .jsonBody,
                                                    r'''$.data.event.match.teams[0].result.gameWins''',
                                                  ) >
                                                  getJsonField(
                                                    columnGetEventDetailResponse
                                                        .jsonBody,
                                                    r'''$.data.event.match.teams[1].result.gameWins''',
                                                  )
                                              ? FlutterFlowTheme.of(context)
                                                  .primaryBtnText
                                              : FlutterFlowTheme.of(context)
                                                  .warning,
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                        fontSize: 35,
                                      ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 5, 0, 5),
                                  child: Container(
                                    width: 60,
                                    height: 60,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.network(
                                      getJsonField(
                                        columnGetEventDetailResponse.jsonBody,
                                        r'''$.data.event.match.teams[1].image''',
                                      ),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Text(
                                    getJsonField(
                                      columnGetEventDetailResponse.jsonBody,
                                      r'''$.data.event.match.teams[0].code''',
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 20,
                                        ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 5, 0, 0),
                                    child: Text(
                                      '경기종료',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 20,
                                          ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    getJsonField(
                                      columnGetEventDetailResponse.jsonBody,
                                      r'''$.data.event.match.teams[1].code''',
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 20,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // 세트 버튼
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                      child: Builder(
                        builder: (context) {
                          List<String> allSetResult = [];
                          int index = getJsonField(
                                  columnGetEventDetailResponse.jsonBody,
                                  r'$.data.event.match.teams[0].result.gameWins') +
                              getJsonField(
                                  columnGetEventDetailResponse.jsonBody,
                                  r'$.data.event.match.teams[1].result.gameWins');
                          for (int i = 0; i < index; i++) {
                            int j = i + 1;
                            allSetResult.add('$j 세트');
                          }
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(allSetResult.length,
                                  (allSetResultIndex) {
                                final allSetResultItem =
                                    allSetResult[allSetResultIndex];
                                bool isSelected =
                                    allSetResultIndex == selectedIndex;

                                return Align(
                                  alignment: AlignmentDirectional(-0.05, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 0, 0, 0),
                                    child: FFButtonWidget(
                                      onPressed: () {
                                        setState(() {
                                          selectedIndex = allSetResultIndex;
                                        });
                                      },
                                      text: allSetResultItem,
                                      options: FFButtonOptions(
                                        width: 80,
                                        height: 40,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0, 0, 0, 0),
                                        color: Color(0xFF18181D),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: isSelected
                                                  ? FlutterFlowTheme.of(context)
                                                      .warning
                                                  : FlutterFlowTheme.of(context)
                                                      .primaryBtnText,
                                            ),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                        hoverBorderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .warning,
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          );
                        },
                      ),
                    ),
                    // VOD
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: FlutterFlowWebView(
                          url: "https://vod.afreecatv.com/player/" +
                              getJsonField(
                                columnGetEventDetailResponse.jsonBody,
                                r'''$.data.event.match.games[:].vods[0].parameter''',
                              )[selectedIndex] +
                              "/embed?showChat=false&autoPlay=false&mutePlay=true",
                          bypass: false,
                          height: 200,
                          verticalScroll: false,
                          horizontalScroll: false,
                        ),
                      ),
                    ),
                    // 주요통계
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: FutureBuilder<ApiCallResponse>(
                        future: GetLiveStats.call(
                            getJsonField(columnGetEventDetailResponse.jsonBody,
                                    r'''$.data.event.match.games[:].id''')[
                                selectedIndex],
                            getJsonField(columnGetEventDetailResponse.jsonBody,
                                    r'''$.data.event.match.games[:].vods[0].firstFrameTime''')[
                                selectedIndex]),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          }

                          if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          }

                          final getGameCallResponse = snapshot.data!;

                          final frames = getJsonField(
                              getGameCallResponse.jsonBody, r'''$.frames''');
                          final lastFrameIndex = frames.length - 1;
                          final lastFrame = frames[lastFrameIndex];
                          return Container(
                            height: 250,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(5),
                              shape: BoxShape.rectangle,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 10, 15, 0),
                                  child: Text(
                                    '주요 통계',
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium,
                                  ),
                                ),
                                // 주요통계_전체 골드
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 16,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: getJsonField(lastFrame,
                                                      r'''$.blueTeam.totalGold''') >
                                                  getJsonField(lastFrame,
                                                      r'''$.redTeam.totalGold''')
                                              ? Colors.blue
                                              : Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        padding:
                                            EdgeInsets.fromLTRB(12, 6, 12, 6),
                                        child: Text(
                                          getJsonField(lastFrame,
                                                  r'''$.blueTeam.totalGold''')
                                              .toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            '전체 골드',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: getJsonField(lastFrame,
                                                      r'''$.redTeam.totalGold''') >
                                                  getJsonField(lastFrame,
                                                      r'''$.blueTeam.totalGold''')
                                              ? Colors.red
                                              : Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        padding:
                                            EdgeInsets.fromLTRB(12, 6, 12, 6),
                                        child: Text(
                                          getJsonField(lastFrame,
                                                  r'''$.redTeam.totalGold''')
                                              .toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 16,
                                      ),
                                    ],
                                  ),
                                ),
                                // 주요통계_전체 킬
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 16,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: getJsonField(lastFrame,
                                                      r'''$.blueTeam.totalKills''') >
                                                  getJsonField(lastFrame,
                                                      r'''$.redTeam.totalKills''')
                                              ? Colors.blue
                                              : Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        padding:
                                            EdgeInsets.fromLTRB(12, 6, 12, 6),
                                        child: Text(
                                          getJsonField(lastFrame,
                                                  r'''$.blueTeam.totalKills''')
                                              .toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            '전체 킬',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: getJsonField(lastFrame,
                                                      r'''$.redTeam.totalKills''') >
                                                  getJsonField(lastFrame,
                                                      r'''$.blueTeam.totalKills''')
                                              ? Colors.red
                                              : Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        padding:
                                            EdgeInsets.fromLTRB(12, 6, 12, 6),
                                        child: Text(
                                          getJsonField(lastFrame,
                                                  r'''$.redTeam.totalKills''')
                                              .toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 16,
                                      ),
                                    ],
                                  ),
                                ),
                                // 주요통계_타워
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 16,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: getJsonField(lastFrame,
                                                      r'''$.blueTeam.towers''') >
                                                  getJsonField(lastFrame,
                                                      r'''$.redTeam.towers''')
                                              ? Colors.blue
                                              : Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        padding:
                                            EdgeInsets.fromLTRB(12, 6, 12, 6),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            getJsonField(lastFrame,
                                                    r'''$.blueTeam.towers''')
                                                .toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            '타워',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: getJsonField(lastFrame,
                                                      r'''$.redTeam.towers''') >
                                                  getJsonField(lastFrame,
                                                      r'''$.blueTeam.towers''')
                                              ? Colors.red
                                              : Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        padding:
                                            EdgeInsets.fromLTRB(12, 6, 12, 6),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            getJsonField(lastFrame,
                                                    r'''$.redTeam.towers''')
                                                .toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 16,
                                      ),
                                    ],
                                  ),
                                ),
                                // 주요통계_바론
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 16,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: getJsonField(lastFrame,
                                                      r'''$.blueTeam.barons''') >
                                                  getJsonField(lastFrame,
                                                      r'''$.redTeam.barons''')
                                              ? Colors.blue
                                              : Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        padding:
                                            EdgeInsets.fromLTRB(12, 6, 12, 6),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            getJsonField(lastFrame,
                                                    r'''$.blueTeam.barons''')
                                                .toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            '바론',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: getJsonField(lastFrame,
                                                      r'''$.redTeam.barons''') >
                                                  getJsonField(lastFrame,
                                                      r'''$.blueTeam.barons''')
                                              ? Colors.red
                                              : Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        padding:
                                            EdgeInsets.fromLTRB(12, 6, 12, 6),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            getJsonField(lastFrame,
                                                    r'''$.redTeam.barons''')
                                                .toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 16,
                                      ),
                                    ],
                                  ),
                                ),
                                // 주요통계_드래곤
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 16,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: getJsonField(lastFrame,
                                                          r'''$.blueTeam.dragons''')
                                                      .length >
                                                  getJsonField(lastFrame,
                                                          r'''$.redTeam.dragons''')
                                                      .length
                                              ? Colors.blue
                                              : Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        padding:
                                            EdgeInsets.fromLTRB(12, 6, 12, 6),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            getJsonField(lastFrame,
                                                    r'''$.blueTeam.dragons''')
                                                .length
                                                .toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            '드래곤',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: getJsonField(lastFrame,
                                                          r'''$.redTeam.dragons''')
                                                      .length >
                                                  getJsonField(lastFrame,
                                                          r'''$.blueTeam.dragons''')
                                                      .length
                                              ? Colors.red
                                              : Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        padding:
                                            EdgeInsets.fromLTRB(12, 6, 12, 6),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            getJsonField(lastFrame,
                                                    r'''$.redTeam.dragons''')
                                                .length
                                                .toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 16,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    // 플레이어 요약
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                        child: FutureBuilder<ApiCallResponse>(
                            future: GetLiveStats.call(
                                getJsonField(
                                        columnGetEventDetailResponse.jsonBody,
                                        r'''$.data.event.match.games[:].id''')[
                                    selectedIndex],
                                getJsonField(
                                        columnGetEventDetailResponse.jsonBody,
                                        r'''$.data.event.match.games[:].vods[0].firstFrameTime''')[
                                    selectedIndex]),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return CircularProgressIndicator();
                              }

                              if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              }

                              final getGameCallResponse = snapshot.data!;

                              final frames = getJsonField(
                                  getGameCallResponse.jsonBody,
                                  r'''$.frames''');
                              final lastFrameIndex = frames.length - 1;
                              final lastFrame = frames[lastFrameIndex];
                              return Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional
                                          .fromSTEB(0, 5, 0, 0),
                                      child: Text(
                                        '플레이어 요약',
                                        style:
                                        FlutterFlowTheme.of(context)
                                            .titleMedium,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional
                                          .fromSTEB(0, 0, 0, 5),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(
                                              context)
                                              .secondaryBackground,
                                        ),
                                        child: Column(
                                          mainAxisSize:
                                          MainAxisSize.max,
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            // 첫번째 Row
                                            Row(
                                              mainAxisSize:
                                              MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Align(
                                                    alignment:
                                                    AlignmentDirectional(
                                                        -0.95, -1),
                                                    child: Text(
                                                      getJsonField(
                                                        getGameCallResponse
                                                            .jsonBody,
                                                        r"$.gameMetadata.blueTeamMetadata.participantMetadata[0].summonerName",
                                                      ),
                                                      style: FlutterFlowTheme
                                                          .of(context)
                                                          .bodyMedium,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Align(
                                                    alignment:
                                                    AlignmentDirectional(
                                                        0.95, -1),
                                                    child: Text(
                                                      getJsonField(
                                                        getGameCallResponse
                                                            .jsonBody,
                                                        r"$.gameMetadata.redTeamMetadata.participantMetadata[0].summonerName",
                                                      ),
                                                      style: FlutterFlowTheme
                                                          .of(context)
                                                          .bodyMedium,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize:
                                              MainAxisSize.max,
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceEvenly,
                                              children: [
                                                Padding(
                                                  padding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(5,
                                                      0, 0, 0),
                                                  child: Image.network(
                                                    "https://opgg-static.akamaized.net/images/lol/champion/" +
                                                        getJsonField(
                                                            getGameCallResponse
                                                                .jsonBody,
                                                            r"$.gameMetadata.blueTeamMetadata.participantMetadata[0].championId") +
                                                        ".png",
                                                    width: 70,
                                                    height: 70,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                    MainAxisSize
                                                        .min,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                        MainAxisSize
                                                            .min,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        children: [
                                                          Padding(
                                                            padding: EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                0,
                                                                0,
                                                                5,
                                                                0),
                                                            child: Image
                                                                .asset(
                                                              'assets/images/Mediamodifier-Design-Template.png',
                                                              width: 20,
                                                              height:
                                                              20,
                                                              fit: BoxFit
                                                                  .cover,
                                                            ),
                                                          ),
                                                          Text(
                                                            getJsonField(lastFrame, r'''$.blueTeam.participants[0].kills''').toString() +
                                                                '/' +
                                                                getJsonField(lastFrame,
                                                                    r'''$.blueTeam.participants[0].deaths''')
                                                                    .toString() +
                                                                '/' +
                                                                getJsonField(lastFrame,
                                                                    r'''$.blueTeam.participants[0].assists''')
                                                                    .toString(),
                                                            style: FlutterFlowTheme.of(
                                                                context)
                                                                .bodyMedium,
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                        MainAxisSize
                                                            .min,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        children: [
                                                          Padding(
                                                            padding: EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                0,
                                                                0,
                                                                5,
                                                                0),
                                                            child: Image
                                                                .asset(
                                                              'assets/images/Mediamodifier-Design-Template_(1).png',
                                                              width: 20,
                                                              height:
                                                              20,
                                                              fit: BoxFit
                                                                  .cover,
                                                            ),
                                                          ),
                                                          Text(
                                                            getJsonField(
                                                                lastFrame,
                                                                r'''$.blueTeam.participants[0].creepScore''')
                                                                .toString(),
                                                            style: FlutterFlowTheme.of(
                                                                context)
                                                                .bodyMedium,
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                        MainAxisSize
                                                            .min,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        children: [
                                                          Padding(
                                                            padding: EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                0,
                                                                0,
                                                                5,
                                                                0),
                                                            child: Image
                                                                .asset(
                                                              'assets/images/Mediamodifier-Design-Template_(2).png',
                                                              width: 20,
                                                              height:
                                                              20,
                                                              fit: BoxFit
                                                                  .cover,
                                                            ),
                                                          ),
                                                          Text(
                                                            NumberFormat.compact().format(getJsonField(
                                                                lastFrame,
                                                                r'''$.blueTeam.participants[0].totalGold''')
                                                                .toDouble()),
                                                            style: FlutterFlowTheme.of(
                                                                context)
                                                                .bodyMedium,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                    MainAxisSize
                                                        .min,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .end,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                        MainAxisSize
                                                            .min,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        children: [
                                                          Text(
                                                            getJsonField(lastFrame, r'''$.redTeam.participants[0].kills''').toString() +
                                                                '/' +
                                                                getJsonField(lastFrame,
                                                                    r'''$.redTeam.participants[0].deaths''')
                                                                    .toString() +
                                                                '/' +
                                                                getJsonField(lastFrame,
                                                                    r'''$.redTeam.participants[0].assists''')
                                                                    .toString(),
                                                            style: FlutterFlowTheme.of(
                                                                context)
                                                                .bodyMedium,
                                                          ),
                                                          Padding(
                                                            padding: EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                0,
                                                                0,
                                                                5,
                                                                0),
                                                            child: Image
                                                                .asset(
                                                              'assets/images/Mediamodifier-Design-Template.png',
                                                              width: 20,
                                                              height:
                                                              20,
                                                              fit: BoxFit
                                                                  .cover,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                        MainAxisSize
                                                            .min,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        children: [
                                                          Text(
                                                            getJsonField(
                                                                lastFrame,
                                                                r'''$.redTeam.participants[0].creepScore''')
                                                                .toString(),
                                                            style: FlutterFlowTheme.of(
                                                                context)
                                                                .bodyMedium,
                                                          ),
                                                          Padding(
                                                            padding: EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                0,
                                                                0,
                                                                5,
                                                                0),
                                                            child: Image
                                                                .asset(
                                                              'assets/images/Mediamodifier-Design-Template_(1).png',
                                                              width: 20,
                                                              height:
                                                              20,
                                                              fit: BoxFit
                                                                  .cover,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                        MainAxisSize
                                                            .min,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        children: [
                                                          Text(
                                                            NumberFormat.compact().format(getJsonField(
                                                                lastFrame,
                                                                r'''$.redTeam.participants[0].totalGold''')
                                                                .toDouble()),
                                                            style: FlutterFlowTheme.of(
                                                                context)
                                                                .bodyMedium,
                                                          ),
                                                          Padding(
                                                            padding: EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                0,
                                                                0,
                                                                5,
                                                                0),
                                                            child: Image
                                                                .asset(
                                                              'assets/images/Mediamodifier-Design-Template_(2).png',
                                                              width: 20,
                                                              height:
                                                              20,
                                                              fit: BoxFit
                                                                  .cover,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(0,
                                                      0, 5, 0),
                                                  child: Image.network(
                                                    "https://opgg-static.akamaized.net/images/lol/champion/" +
                                                        getJsonField(
                                                            getGameCallResponse
                                                                .jsonBody,
                                                            r"$.gameMetadata.redTeamMetadata.participantMetadata[0].championId") +
                                                        ".png",
                                                    width: 70,
                                                    height: 70,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            // 두번째 Row
                                            Row(
                                              mainAxisSize:
                                              MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Align(
                                                    alignment:
                                                    AlignmentDirectional(
                                                        -0.95, -1),
                                                    child: Text(
                                                      getJsonField(
                                                        getGameCallResponse
                                                            .jsonBody,
                                                        r"$.gameMetadata.blueTeamMetadata.participantMetadata[1].summonerName",
                                                      ),
                                                      style: FlutterFlowTheme
                                                          .of(context)
                                                          .bodyMedium,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Align(
                                                    alignment:
                                                    AlignmentDirectional(
                                                        0.95, -1),
                                                    child: Text(
                                                      getJsonField(
                                                        getGameCallResponse
                                                            .jsonBody,
                                                        r"$.gameMetadata.redTeamMetadata.participantMetadata[1].summonerName",
                                                      ),
                                                      style: FlutterFlowTheme
                                                          .of(context)
                                                          .bodyMedium,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize:
                                              MainAxisSize.max,
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceEvenly,
                                              children: [
                                                Padding(
                                                  padding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(5,
                                                      0, 0, 0),
                                                  child: Image.network(
                                                    "https://opgg-static.akamaized.net/images/lol/champion/" +
                                                        getJsonField(
                                                            getGameCallResponse
                                                                .jsonBody,
                                                            r"$.gameMetadata.blueTeamMetadata.participantMetadata[1].championId") +
                                                        ".png",
                                                    width: 70,
                                                    height: 70,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                    MainAxisSize
                                                        .min,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                        MainAxisSize
                                                            .min,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        children: [
                                                          Padding(
                                                            padding: EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                0,
                                                                0,
                                                                5,
                                                                0),
                                                            child: Image
                                                                .asset(
                                                              'assets/images/Mediamodifier-Design-Template.png',
                                                              width: 20,
                                                              height:
                                                              20,
                                                              fit: BoxFit
                                                                  .cover,
                                                            ),
                                                          ),
                                                          Text(
                                                            getJsonField(lastFrame, r'''$.blueTeam.participants[1].kills''').toString() +
                                                                '/' +
                                                                getJsonField(lastFrame,
                                                                    r'''$.blueTeam.participants[1].deaths''')
                                                                    .toString() +
                                                                '/' +
                                                                getJsonField(lastFrame,
                                                                    r'''$.blueTeam.participants[1].assists''')
                                                                    .toString(),
                                                            style: FlutterFlowTheme.of(
                                                                context)
                                                                .bodyMedium,
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                        MainAxisSize
                                                            .min,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        children: [
                                                          Padding(
                                                            padding: EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                0,
                                                                0,
                                                                5,
                                                                0),
                                                            child: Image
                                                                .asset(
                                                              'assets/images/Mediamodifier-Design-Template_(1).png',
                                                              width: 20,
                                                              height:
                                                              20,
                                                              fit: BoxFit
                                                                  .cover,
                                                            ),
                                                          ),
                                                          Text(
                                                            getJsonField(
                                                                lastFrame,
                                                                r'''$.blueTeam.participants[1].creepScore''')
                                                                .toString(),
                                                            style: FlutterFlowTheme.of(
                                                                context)
                                                                .bodyMedium,
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                        MainAxisSize
                                                            .min,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        children: [
                                                          Padding(
                                                            padding: EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                0,
                                                                0,
                                                                5,
                                                                0),
                                                            child: Image
                                                                .asset(
                                                              'assets/images/Mediamodifier-Design-Template_(2).png',
                                                              width: 20,
                                                              height:
                                                              20,
                                                              fit: BoxFit
                                                                  .cover,
                                                            ),
                                                          ),
                                                          Text(
                                                            NumberFormat.compact().format(getJsonField(
                                                                lastFrame,
                                                                r'''$.blueTeam.participants[1].totalGold''')
                                                                .toDouble()),
                                                            style: FlutterFlowTheme.of(
                                                                context)
                                                                .bodyMedium,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                    MainAxisSize
                                                        .min,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .end,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                        MainAxisSize
                                                            .min,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        children: [
                                                          Text(
                                                            getJsonField(lastFrame, r'''$.redTeam.participants[1].kills''').toString() +
                                                                '/' +
                                                                getJsonField(lastFrame,
                                                                    r'''$.redTeam.participants[1].deaths''')
                                                                    .toString() +
                                                                '/' +
                                                                getJsonField(lastFrame,
                                                                    r'''$.redTeam.participants[1].assists''')
                                                                    .toString(),
                                                            style: FlutterFlowTheme.of(
                                                                context)
                                                                .bodyMedium,
                                                          ),
                                                          Padding(
                                                            padding: EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                0,
                                                                0,
                                                                5,
                                                                0),
                                                            child: Image
                                                                .asset(
                                                              'assets/images/Mediamodifier-Design-Template.png',
                                                              width: 20,
                                                              height:
                                                              20,
                                                              fit: BoxFit
                                                                  .cover,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                        MainAxisSize
                                                            .min,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        children: [
                                                          Text(
                                                            getJsonField(
                                                                lastFrame,
                                                                r'''$.redTeam.participants[1].creepScore''')
                                                                .toString(),
                                                            style: FlutterFlowTheme.of(
                                                                context)
                                                                .bodyMedium,
                                                          ),
                                                          Padding(
                                                            padding: EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                0,
                                                                0,
                                                                5,
                                                                0),
                                                            child: Image
                                                                .asset(
                                                              'assets/images/Mediamodifier-Design-Template_(1).png',
                                                              width: 20,
                                                              height:
                                                              20,
                                                              fit: BoxFit
                                                                  .cover,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                        MainAxisSize
                                                            .min,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        children: [
                                                          Text(
                                                            NumberFormat.compact().format(getJsonField(
                                                                lastFrame,
                                                                r'''$.redTeam.participants[1].totalGold''')
                                                                .toDouble()),
                                                            style: FlutterFlowTheme.of(
                                                                context)
                                                                .bodyMedium,
                                                          ),
                                                          Padding(
                                                            padding: EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                0,
                                                                0,
                                                                5,
                                                                0),
                                                            child: Image
                                                                .asset(
                                                              'assets/images/Mediamodifier-Design-Template_(2).png',
                                                              width: 20,
                                                              height:
                                                              20,
                                                              fit: BoxFit
                                                                  .cover,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(0,
                                                      0, 5, 0),
                                                  child: Image.network(
                                                    "https://opgg-static.akamaized.net/images/lol/champion/" +
                                                        getJsonField(
                                                            getGameCallResponse
                                                                .jsonBody,
                                                            r"$.gameMetadata.redTeamMetadata.participantMetadata[1].championId") +
                                                        ".png",
                                                    width: 70,
                                                    height: 70,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            // 세번째 Row
                                            Row(
                                              mainAxisSize:
                                              MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Align(
                                                    alignment:
                                                    AlignmentDirectional(
                                                        -0.95, -1),
                                                    child: Text(
                                                      getJsonField(
                                                        getGameCallResponse
                                                            .jsonBody,
                                                        r"$.gameMetadata.blueTeamMetadata.participantMetadata[2].summonerName",
                                                      ),
                                                      style: FlutterFlowTheme
                                                          .of(context)
                                                          .bodyMedium,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Align(
                                                    alignment:
                                                    AlignmentDirectional(
                                                        0.95, -1),
                                                    child: Text(
                                                      getJsonField(
                                                        getGameCallResponse
                                                            .jsonBody,
                                                        r"$.gameMetadata.redTeamMetadata.participantMetadata[2].summonerName",
                                                      ),
                                                      style: FlutterFlowTheme
                                                          .of(context)
                                                          .bodyMedium,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize:
                                              MainAxisSize.max,
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceEvenly,
                                              children: [
                                                Padding(
                                                  padding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(5,
                                                      0, 0, 0),
                                                  child: Image.network(
                                                    "https://opgg-static.akamaized.net/images/lol/champion/" +
                                                        getJsonField(
                                                            getGameCallResponse
                                                                .jsonBody,
                                                            r"$.gameMetadata.blueTeamMetadata.participantMetadata[2].championId") +
                                                        ".png",
                                                    width: 70,
                                                    height: 70,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                    MainAxisSize
                                                        .min,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                        MainAxisSize
                                                            .min,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        children: [
                                                          Padding(
                                                            padding: EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                0,
                                                                0,
                                                                5,
                                                                0),
                                                            child: Image
                                                                .asset(
                                                              'assets/images/Mediamodifier-Design-Template.png',
                                                              width: 20,
                                                              height:
                                                              20,
                                                              fit: BoxFit
                                                                  .cover,
                                                            ),
                                                          ),
                                                          Text(
                                                            getJsonField(lastFrame, r'''$.blueTeam.participants[2].kills''').toString() +
                                                                '/' +
                                                                getJsonField(lastFrame,
                                                                    r'''$.blueTeam.participants[2].deaths''')
                                                                    .toString() +
                                                                '/' +
                                                                getJsonField(lastFrame,
                                                                    r'''$.blueTeam.participants[2].assists''')
                                                                    .toString(),
                                                            style: FlutterFlowTheme.of(
                                                                context)
                                                                .bodyMedium,
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                        MainAxisSize
                                                            .min,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        children: [
                                                          Padding(
                                                            padding: EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                0,
                                                                0,
                                                                5,
                                                                0),
                                                            child: Image
                                                                .asset(
                                                              'assets/images/Mediamodifier-Design-Template_(1).png',
                                                              width: 20,
                                                              height:
                                                              20,
                                                              fit: BoxFit
                                                                  .cover,
                                                            ),
                                                          ),
                                                          Text(
                                                            getJsonField(
                                                                lastFrame,
                                                                r'''$.blueTeam.participants[2].creepScore''')
                                                                .toString(),
                                                            style: FlutterFlowTheme.of(
                                                                context)
                                                                .bodyMedium,
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                        MainAxisSize
                                                            .min,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        children: [
                                                          Padding(
                                                            padding: EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                0,
                                                                0,
                                                                5,
                                                                0),
                                                            child: Image
                                                                .asset(
                                                              'assets/images/Mediamodifier-Design-Template_(2).png',
                                                              width: 20,
                                                              height:
                                                              20,
                                                              fit: BoxFit
                                                                  .cover,
                                                            ),
                                                          ),
                                                          Text(
                                                            NumberFormat.compact().format(getJsonField(
                                                                lastFrame,
                                                                r'''$.blueTeam.participants[2].totalGold''')
                                                                .toDouble()),
                                                            style: FlutterFlowTheme.of(
                                                                context)
                                                                .bodyMedium,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                    MainAxisSize
                                                        .min,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .end,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                        MainAxisSize
                                                            .min,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        children: [
                                                          Text(
                                                            getJsonField(lastFrame, r'''$.redTeam.participants[2].kills''').toString() +
                                                                '/' +
                                                                getJsonField(lastFrame,
                                                                    r'''$.redTeam.participants[2].deaths''')
                                                                    .toString() +
                                                                '/' +
                                                                getJsonField(lastFrame,
                                                                    r'''$.redTeam.participants[2].assists''')
                                                                    .toString(),
                                                            style: FlutterFlowTheme.of(
                                                                context)
                                                                .bodyMedium,
                                                          ),
                                                          Padding(
                                                            padding: EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                0,
                                                                0,
                                                                5,
                                                                0),
                                                            child: Image
                                                                .asset(
                                                              'assets/images/Mediamodifier-Design-Template.png',
                                                              width: 20,
                                                              height:
                                                              20,
                                                              fit: BoxFit
                                                                  .cover,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                        MainAxisSize
                                                            .min,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        children: [
                                                          Text(
                                                            getJsonField(
                                                                lastFrame,
                                                                r'''$.redTeam.participants[2].creepScore''')
                                                                .toString(),
                                                            style: FlutterFlowTheme.of(
                                                                context)
                                                                .bodyMedium,
                                                          ),
                                                          Padding(
                                                            padding: EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                0,
                                                                0,
                                                                5,
                                                                0),
                                                            child: Image
                                                                .asset(
                                                              'assets/images/Mediamodifier-Design-Template_(1).png',
                                                              width: 20,
                                                              height:
                                                              20,
                                                              fit: BoxFit
                                                                  .cover,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                        MainAxisSize
                                                            .min,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        children: [
                                                          Text(
                                                            NumberFormat.compact().format(getJsonField(
                                                                lastFrame,
                                                                r'''$.redTeam.participants[2].totalGold''')
                                                                .toDouble()),
                                                            style: FlutterFlowTheme.of(
                                                                context)
                                                                .bodyMedium,
                                                          ),
                                                          Padding(
                                                            padding: EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                0,
                                                                0,
                                                                5,
                                                                0),
                                                            child: Image
                                                                .asset(
                                                              'assets/images/Mediamodifier-Design-Template_(2).png',
                                                              width: 20,
                                                              height:
                                                              20,
                                                              fit: BoxFit
                                                                  .cover,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(0,
                                                      0, 5, 0),
                                                  child: Image.network(
                                                    "https://opgg-static.akamaized.net/images/lol/champion/" +
                                                        getJsonField(
                                                            getGameCallResponse
                                                                .jsonBody,
                                                            r"$.gameMetadata.redTeamMetadata.participantMetadata[2].championId") +
                                                        ".png",
                                                    width: 70,
                                                    height: 70,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            // 네번째 Row
                                            Row(
                                              mainAxisSize:
                                              MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Align(
                                                    alignment:
                                                    AlignmentDirectional(
                                                        -0.95, -1),
                                                    child: Text(
                                                      getJsonField(
                                                        getGameCallResponse
                                                            .jsonBody,
                                                        r"$.gameMetadata.blueTeamMetadata.participantMetadata[3].summonerName",
                                                      ),
                                                      style: FlutterFlowTheme
                                                          .of(context)
                                                          .bodyMedium,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Align(
                                                    alignment:
                                                    AlignmentDirectional(
                                                        0.95, -1),
                                                    child: Text(
                                                      getJsonField(
                                                        getGameCallResponse
                                                            .jsonBody,
                                                        r"$.gameMetadata.redTeamMetadata.participantMetadata[3].summonerName",
                                                      ),
                                                      style: FlutterFlowTheme
                                                          .of(context)
                                                          .bodyMedium,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize:
                                              MainAxisSize.max,
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceEvenly,
                                              children: [
                                                Padding(
                                                  padding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(5,
                                                      0, 0, 0),
                                                  child: Image.network(
                                                    "https://opgg-static.akamaized.net/images/lol/champion/" +
                                                        getJsonField(
                                                            getGameCallResponse
                                                                .jsonBody,
                                                            r"$.gameMetadata.blueTeamMetadata.participantMetadata[3].championId") +
                                                        ".png",
                                                    width: 70,
                                                    height: 70,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                    MainAxisSize
                                                        .min,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                        MainAxisSize
                                                            .min,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        children: [
                                                          Padding(
                                                            padding: EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                0,
                                                                0,
                                                                5,
                                                                0),
                                                            child: Image
                                                                .asset(
                                                              'assets/images/Mediamodifier-Design-Template.png',
                                                              width: 20,
                                                              height:
                                                              20,
                                                              fit: BoxFit
                                                                  .cover,
                                                            ),
                                                          ),
                                                          Text(
                                                            getJsonField(lastFrame, r'''$.blueTeam.participants[3].kills''').toString() +
                                                                '/' +
                                                                getJsonField(lastFrame,
                                                                    r'''$.blueTeam.participants[3].deaths''')
                                                                    .toString() +
                                                                '/' +
                                                                getJsonField(lastFrame,
                                                                    r'''$.blueTeam.participants[3].assists''')
                                                                    .toString(),
                                                            style: FlutterFlowTheme.of(
                                                                context)
                                                                .bodyMedium,
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                        MainAxisSize
                                                            .min,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        children: [
                                                          Padding(
                                                            padding: EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                0,
                                                                0,
                                                                5,
                                                                0),
                                                            child: Image
                                                                .asset(
                                                              'assets/images/Mediamodifier-Design-Template_(1).png',
                                                              width: 20,
                                                              height:
                                                              20,
                                                              fit: BoxFit
                                                                  .cover,
                                                            ),
                                                          ),
                                                          Text(
                                                            getJsonField(
                                                                lastFrame,
                                                                r'''$.blueTeam.participants[3].creepScore''')
                                                                .toString(),
                                                            style: FlutterFlowTheme.of(
                                                                context)
                                                                .bodyMedium,
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                        MainAxisSize
                                                            .min,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        children: [
                                                          Padding(
                                                            padding: EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                0,
                                                                0,
                                                                5,
                                                                0),
                                                            child: Image
                                                                .asset(
                                                              'assets/images/Mediamodifier-Design-Template_(2).png',
                                                              width: 20,
                                                              height:
                                                              20,
                                                              fit: BoxFit
                                                                  .cover,
                                                            ),
                                                          ),
                                                          Text(
                                                            NumberFormat.compact().format(getJsonField(
                                                                lastFrame,
                                                                r'''$.blueTeam.participants[3].totalGold''')
                                                                .toDouble()),
                                                            style: FlutterFlowTheme.of(
                                                                context)
                                                                .bodyMedium,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                    MainAxisSize
                                                        .min,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .end,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                        MainAxisSize
                                                            .min,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        children: [
                                                          Text(
                                                            getJsonField(lastFrame, r'''$.redTeam.participants[3].kills''').toString() +
                                                                '/' +
                                                                getJsonField(lastFrame,
                                                                    r'''$.redTeam.participants[3].deaths''')
                                                                    .toString() +
                                                                '/' +
                                                                getJsonField(lastFrame,
                                                                    r'''$.redTeam.participants[3].assists''')
                                                                    .toString(),
                                                            style: FlutterFlowTheme.of(
                                                                context)
                                                                .bodyMedium,
                                                          ),
                                                          Padding(
                                                            padding: EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                0,
                                                                0,
                                                                5,
                                                                0),
                                                            child: Image
                                                                .asset(
                                                              'assets/images/Mediamodifier-Design-Template.png',
                                                              width: 20,
                                                              height:
                                                              20,
                                                              fit: BoxFit
                                                                  .cover,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                        MainAxisSize
                                                            .min,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        children: [
                                                          Text(
                                                            getJsonField(
                                                                lastFrame,
                                                                r'''$.redTeam.participants[3].creepScore''')
                                                                .toString(),
                                                            style: FlutterFlowTheme.of(
                                                                context)
                                                                .bodyMedium,
                                                          ),
                                                          Padding(
                                                            padding: EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                0,
                                                                0,
                                                                5,
                                                                0),
                                                            child: Image
                                                                .asset(
                                                              'assets/images/Mediamodifier-Design-Template_(1).png',
                                                              width: 20,
                                                              height:
                                                              20,
                                                              fit: BoxFit
                                                                  .cover,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                        MainAxisSize
                                                            .min,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        children: [
                                                          Text(
                                                            NumberFormat.compact().format(getJsonField(
                                                                lastFrame,
                                                                r'''$.redTeam.participants[3].totalGold''')
                                                                .toDouble()),
                                                            style: FlutterFlowTheme.of(
                                                                context)
                                                                .bodyMedium,
                                                          ),
                                                          Padding(
                                                            padding: EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                0,
                                                                0,
                                                                5,
                                                                0),
                                                            child: Image
                                                                .asset(
                                                              'assets/images/Mediamodifier-Design-Template_(2).png',
                                                              width: 20,
                                                              height:
                                                              20,
                                                              fit: BoxFit
                                                                  .cover,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(0,
                                                      0, 5, 0),
                                                  child: Image.network(
                                                    "https://opgg-static.akamaized.net/images/lol/champion/" +
                                                        getJsonField(
                                                            getGameCallResponse
                                                                .jsonBody,
                                                            r"$.gameMetadata.redTeamMetadata.participantMetadata[3].championId") +
                                                        ".png",
                                                    width: 70,
                                                    height: 70,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            // 다섯번째 Row
                                            Row(
                                              mainAxisSize:
                                              MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Align(
                                                    alignment:
                                                    AlignmentDirectional(
                                                        -0.95, -1),
                                                    child: Text(
                                                      getJsonField(
                                                        getGameCallResponse
                                                            .jsonBody,
                                                        r"$.gameMetadata.blueTeamMetadata.participantMetadata[4].summonerName",
                                                      ),
                                                      style: FlutterFlowTheme
                                                          .of(context)
                                                          .bodyMedium,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Align(
                                                    alignment:
                                                    AlignmentDirectional(
                                                        0.95, -1),
                                                    child: Text(
                                                      getJsonField(
                                                        getGameCallResponse
                                                            .jsonBody,
                                                        r"$.gameMetadata.redTeamMetadata.participantMetadata[4].summonerName",
                                                      ),
                                                      style: FlutterFlowTheme
                                                          .of(context)
                                                          .bodyMedium,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize:
                                              MainAxisSize.max,
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceEvenly,
                                              children: [
                                                Padding(
                                                  padding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(5,
                                                      0, 0, 0),
                                                  child: Image.network(
                                                    "https://opgg-static.akamaized.net/images/lol/champion/" +
                                                        getJsonField(
                                                            getGameCallResponse
                                                                .jsonBody,
                                                            r"$.gameMetadata.blueTeamMetadata.participantMetadata[4].championId") +
                                                        ".png",
                                                    width: 70,
                                                    height: 70,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                    MainAxisSize
                                                        .min,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                        MainAxisSize
                                                            .min,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        children: [
                                                          Padding(
                                                            padding: EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                0,
                                                                0,
                                                                5,
                                                                0),
                                                            child: Image
                                                                .asset(
                                                              'assets/images/Mediamodifier-Design-Template.png',
                                                              width: 20,
                                                              height:
                                                              20,
                                                              fit: BoxFit
                                                                  .cover,
                                                            ),
                                                          ),
                                                          Text(
                                                            getJsonField(lastFrame, r'''$.blueTeam.participants[4].kills''').toString() +
                                                                '/' +
                                                                getJsonField(lastFrame,
                                                                    r'''$.blueTeam.participants[4].deaths''')
                                                                    .toString() +
                                                                '/' +
                                                                getJsonField(lastFrame,
                                                                    r'''$.blueTeam.participants[4].assists''')
                                                                    .toString(),
                                                            style: FlutterFlowTheme.of(
                                                                context)
                                                                .bodyMedium,
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                        MainAxisSize
                                                            .min,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        children: [
                                                          Padding(
                                                            padding: EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                0,
                                                                0,
                                                                5,
                                                                0),
                                                            child: Image
                                                                .asset(
                                                              'assets/images/Mediamodifier-Design-Template_(1).png',
                                                              width: 20,
                                                              height:
                                                              20,
                                                              fit: BoxFit
                                                                  .cover,
                                                            ),
                                                          ),
                                                          Text(
                                                            getJsonField(
                                                                lastFrame,
                                                                r'''$.blueTeam.participants[4].creepScore''')
                                                                .toString(),
                                                            style: FlutterFlowTheme.of(
                                                                context)
                                                                .bodyMedium,
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                        MainAxisSize
                                                            .min,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        children: [
                                                          Padding(
                                                            padding: EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                0,
                                                                0,
                                                                5,
                                                                0),
                                                            child: Image
                                                                .asset(
                                                              'assets/images/Mediamodifier-Design-Template_(2).png',
                                                              width: 20,
                                                              height:
                                                              20,
                                                              fit: BoxFit
                                                                  .cover,
                                                            ),
                                                          ),
                                                          Text(
                                                            NumberFormat.compact().format(getJsonField(
                                                                lastFrame,
                                                                r'''$.blueTeam.participants[4].totalGold''')
                                                                .toDouble()),
                                                            style: FlutterFlowTheme.of(
                                                                context)
                                                                .bodyMedium,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                    MainAxisSize
                                                        .min,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .end,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                        MainAxisSize
                                                            .min,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        children: [
                                                          Text(
                                                            getJsonField(lastFrame, r'''$.redTeam.participants[4].kills''').toString() +
                                                                '/' +
                                                                getJsonField(lastFrame,
                                                                    r'''$.redTeam.participants[4].deaths''')
                                                                    .toString() +
                                                                '/' +
                                                                getJsonField(lastFrame,
                                                                    r'''$.redTeam.participants[4].assists''')
                                                                    .toString(),
                                                            style: FlutterFlowTheme.of(
                                                                context)
                                                                .bodyMedium,
                                                          ),
                                                          Padding(
                                                            padding: EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                0,
                                                                0,
                                                                5,
                                                                0),
                                                            child: Image
                                                                .asset(
                                                              'assets/images/Mediamodifier-Design-Template.png',
                                                              width: 20,
                                                              height:
                                                              20,
                                                              fit: BoxFit
                                                                  .cover,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                        MainAxisSize
                                                            .min,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        children: [
                                                          Text(
                                                            getJsonField(
                                                                lastFrame,
                                                                r'''$.redTeam.participants[4].creepScore''')
                                                                .toString(),
                                                            style: FlutterFlowTheme.of(
                                                                context)
                                                                .bodyMedium,
                                                          ),
                                                          Padding(
                                                            padding: EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                0,
                                                                0,
                                                                5,
                                                                0),
                                                            child: Image
                                                                .asset(
                                                              'assets/images/Mediamodifier-Design-Template_(1).png',
                                                              width: 20,
                                                              height:
                                                              20,
                                                              fit: BoxFit
                                                                  .cover,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                        MainAxisSize
                                                            .min,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        children: [
                                                          Text(
                                                            NumberFormat.compact().format(getJsonField(
                                                                lastFrame,
                                                                r'''$.redTeam.participants[4].totalGold''')
                                                                .toDouble()),
                                                            style: FlutterFlowTheme.of(
                                                                context)
                                                                .bodyMedium,
                                                          ),
                                                          Padding(
                                                            padding: EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                0,
                                                                0,
                                                                5,
                                                                0),
                                                            child: Image
                                                                .asset(
                                                              'assets/images/Mediamodifier-Design-Template_(2).png',
                                                              width: 20,
                                                              height:
                                                              20,
                                                              fit: BoxFit
                                                                  .cover,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(0,
                                                      0, 5, 0),
                                                  child: Image.network(
                                                    "https://opgg-static.akamaized.net/images/lol/champion/" +
                                                        getJsonField(
                                                            getGameCallResponse
                                                                .jsonBody,
                                                            r"$.gameMetadata.redTeamMetadata.participantMetadata[4].championId") +
                                                        ".png",
                                                    width: 70,
                                                    height: 70,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            })),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
