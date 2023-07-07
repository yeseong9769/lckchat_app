import 'package:flutter/material.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '../game_data/game_data_widget.dart';
import '/backend/api_requests/api_calls.dart';
import 'scedule_model.dart';
import 'dart:async';

class SceduleWidget extends StatefulWidget {
  const SceduleWidget({Key? key}) : super(key: key);

  @override
  _SceduleWidgetState createState() => _SceduleWidgetState();
}

class _SceduleWidgetState extends State<SceduleWidget> {
  late SceduleModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SceduleModel());
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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          title: Text(
            'E-BoT',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5.0,
                      color: Color(0x230E151B),
                      offset: Offset(0.0, 2.0),
                    )
                  ],
                ),
                child: FlutterFlowCalendar(
                  color: FlutterFlowTheme.of(context).primary,
                  iconColor: FlutterFlowTheme.of(context).secondaryText,
                  weekFormat: true,
                  weekStartsMonday: true,
                  initialDate: getCurrentTimestamp,
                  onChange: (DateTimeRange? newSelectedDate) async {
                    _model.calendarSelectedDay = newSelectedDate;
                    setState(() {
                      _model.selectedDate = _model.calendarSelectedDay?.start;
                    });
                  },
                  titleStyle: FlutterFlowTheme.of(context).titleMedium,
                  dayOfWeekStyle: FlutterFlowTheme.of(context).bodySmall,
                  dateStyle: FlutterFlowTheme.of(context).bodyMedium,
                  selectedDateStyle:
                      FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                          ),
                  inactiveDateStyle:
                      FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily: 'Poppins',
                            color: Color(0x6B57636C),
                          ),
                  locale: FFLocalizations.of(context).languageCode,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: FutureBuilder<ApiCallResponse>(
                    future: (_model.apiRequestCompleter ??=
                            Completer<ApiCallResponse>()
                              ..complete(GetScheduleCall.call()))
                        .future,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                        );
                      } else if (snapshot.hasError) {
                        final errorMessage = snapshot.error.toString();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(errorMessage),
                          ),
                        );
                      }
                      final getScheduleResponse = snapshot.data!;
                      return Builder(
                        builder: (context) {
                          List<dynamic> allSchedule = GetScheduleCall.events(
                                      getScheduleResponse.jsonBody)
                                  ?.where((e) {
                                final startTime =
                                    DateTime.parse(e['startTime']);
                                final selectedDate = _model.selectedDate;
                                return startTime.year == selectedDate?.year &&
                                    startTime.month == selectedDate?.month &&
                                    startTime.day == selectedDate?.day;
                              }).toList() ??
                              [];

                          // final firstResponseDate = DateTime.parse(getJsonField(
                          //     GetScheduleCall.events(
                          //             getScheduleResponse.jsonBody)
                          //         .first,
                          //     r'$.startTime'));
                          // final lastResponseDate = DateTime.parse(getJsonField(
                          //     GetScheduleCall.events(
                          //             getScheduleResponse.jsonBody)
                          //         .last,
                          //     r'$.startTime'));
                          // if (firstResponseDate.year ==
                          //         _model.selectedDate!.year &&
                          //     firstResponseDate.month ==
                          //         _model.selectedDate!.month &&
                          //     firstResponseDate.day ==
                          //         _model.selectedDate!.day) {
                          // } else if (firstResponseDate > _model.selectedDate!) {
                          //   final olderPageToken = getJsonField(
                          //       getScheduleResponse.jsonBody,
                          //       r'$.data.schedule.pages.older');
                          //   if (olderPageToken != null) {
                          //     GetScheduleCall.additionalCall(olderPageToken)
                          //         .then((additionalResponse) {
                          //       if (additionalResponse.jsonBody != null) {
                          //         getScheduleResponse.jsonBody =
                          //             additionalResponse.jsonBody;
                          //         // setState(() {});
                          //       }
                          //     });
                          //   }
                          // } else if (lastResponseDate < _model.selectedDate!) {
                          //   final newerPageToken = getJsonField(
                          //       getScheduleResponse.jsonBody,
                          //       r'$.data.schedule.pages.newer');
                          //   print("lastResponseDate < _model.selectedDate");
                          //   if (newerPageToken != null) {
                          //     GetScheduleCall.additionalCall(newerPageToken)
                          //         .then((additionalResponse) {
                          //       if (additionalResponse.jsonBody != null) {
                          //         getScheduleResponse.jsonBody =
                          //             additionalResponse.jsonBody;
                          //         // setState(() {});
                          //       }
                          //     });
                          //   }
                          // }
                          return RefreshIndicator(
                            onRefresh: () async {
                              setState(() => _model.apiRequestCompleter = null);
                              await _model.waitForApiRequestCompleted();
                            },
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount:
                                  allSchedule.isEmpty ? 1 : allSchedule.length,
                              itemBuilder: (context, allScheduleIndex) {
                                if (allSchedule.isEmpty) {
                                  return Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.bedtime,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 20.0,
                                        ),
                                        SizedBox(width: 8.0),
                                        Text('경기 일정 없음',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium),
                                      ],
                                    ),
                                  );
                                }
                                final allScheduleItem =
                                    allSchedule[allScheduleIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15.0, 10.0, 15.0, 10.0),
                                  child: InkWell(
                                    // splashColor: Colors.transparent,
                                    // focusColor: Colors.transparent,
                                    // hoverColor: Colors.transparent,
                                    // highlightColor: Colors.transparent,
                                    onTap: () async {
                                      final matchId = getJsonField(
                                              allScheduleItem,
                                              r'''$.match.id''')
                                          .toString();

                                      if (getJsonField(allScheduleItem,
                                              r'''$.state''') ==
                                          'completed') {
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                GameDataWidget(
                                                    matchId: matchId),
                                          ),
                                        );
                                      }
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              getJsonField(
                                                allScheduleItem,
                                                r'''$.match.teams[0].code''',
                                              ).toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 25.0,
                                                      ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 10.0, 0.0),
                                              child: Image.network(
                                                getJsonField(
                                                  allScheduleItem,
                                                  r'''$.match.teams[0].image''',
                                                ),
                                                width: 50.0,
                                                height: 50.0,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 5.0, 0.0),
                                              child: Text(
                                                getJsonField(
                                                  allScheduleItem,
                                                  r'''$.match.teams[0].result.gameWins''',
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: getJsonField(
                                                                      allScheduleItem,
                                                                      r'''$.state''') ==
                                                                  'unstarted'
                                                              ? Colors.grey
                                                              : valueOrDefault<
                                                                  Color>(
                                                                  getJsonField(
                                                                            allScheduleItem,
                                                                            r'''$.match.teams[0].result.outcome''',
                                                                          ) ==
                                                                          'loss'
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBtnText
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .warning,
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                          fontSize: 25.0,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 5.0, 0.0),
                                              child: Text(
                                                '-',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 25.0,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      5.0, 0.0, 10.0, 0.0),
                                              child: Text(
                                                getJsonField(
                                                  allScheduleItem,
                                                  r'''$.match.teams[1].result.gameWins''',
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: getJsonField(
                                                                      allScheduleItem,
                                                                      r'''$.state''') ==
                                                                  'unstarted'
                                                              ? Colors.grey
                                                              : valueOrDefault<
                                                                  Color>(
                                                                  getJsonField(
                                                                            allScheduleItem,
                                                                            r'''$.match.teams[1].result.outcome''',
                                                                          ) ==
                                                                          'loss'
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBtnText
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .warning,
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                          fontSize: 25.0,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 10.0, 0.0),
                                              child: Image.network(
                                                getJsonField(
                                                  allScheduleItem,
                                                  r'''$.match.teams[1].image''',
                                                ),
                                                width: 50.0,
                                                height: 50.0,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                            Text(
                                              getJsonField(
                                                allScheduleItem,
                                                r'''$.match.teams[1].code''',
                                              ).toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 25.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
