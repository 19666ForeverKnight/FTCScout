import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_language_selector.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<EventslistRow>>(
      future: EventslistTable().queryRows(
        queryFn: (q) => q,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primary,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<EventslistRow> homeEventslistRowList = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primary,
            drawer: Drawer(
              elevation: 20.0,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 200,
                    child: Container(
                      width: double.infinity,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primary,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 50.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 0.0, 0.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50.0),
                                      child: Image.asset(
                                        'assets/images/app_logo.png',
                                        width: 100.0,
                                        height: 100.0,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  20.0, 25.0, 0.0, 20.0),
                              child: Text(
                                currentUserEmail,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color: FlutterFlowTheme.of(context).info,
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      width: double.infinity,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryText,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 550,
                    child: Container(
                      width: double.infinity,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed('updatepassword');
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Icon(
                                        Icons.password_sharp,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 30.0,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 8,
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          '8s0b8x80' /* Update Password */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  GoRouter.of(context).prepareAuthEvent();
                                  await authManager.signOut();
                                  GoRouter.of(context).clearRedirectLocation();

                                  context.goNamedAuth(
                                      'signin', context.mounted);
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Icon(
                                        Icons.input,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 28.0,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 8,
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          '9rpx4ycc' /* Sign Out */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed('about');
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Icon(
                                        Icons.info,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 28.0,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 8,
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'wkqbvcxn' /* About */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 10.0, 0.0),
                                  child: FlutterFlowLanguageSelector(
                                    width: 200.0,
                                    height: 40.0,
                                    backgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    borderColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    dropdownIconColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryText,
                                    borderRadius: 8.0,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                    hideFlags: false,
                                    flagSize: 24.0,
                                    flagTextGap: 8.0,
                                    currentLanguage: FFLocalizations.of(context)
                                        .languageCode,
                                    languages: FFLocalizations.languages(),
                                    onChanged: (lang) =>
                                        setAppLanguage(context, lang),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            body: SafeArea(
              top: true,
              child: Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Flex(
                  direction: Axis.vertical,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 50.0, 0.0, 30.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Stack(
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        20.0, 5.0, 0.0, 0.0),
                                    child: FlutterFlowIconButton(
                                      borderRadius: 8.0,
                                      buttonSize: 40.0,
                                      fillColor:
                                          FlutterFlowTheme.of(context).primary,
                                      icon: Icon(
                                        Icons.menu_outlined,
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        scaffoldKey.currentState!.openDrawer();
                                      },
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'ebu9jxiy' /* FTC Scout */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          fontSize: 40.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 15.0, 20.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(25.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Flexible(
                                              child: Align(
                                                alignment: const AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'q3s6hgqn' /* Events */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 30.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Align(
                                                alignment: const AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    if (Navigator.of(context)
                                                        .canPop()) {
                                                      context.pop();
                                                    }
                                                    context
                                                        .pushNamed('addevent');
                                                  },
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'q84bru56' /* + Add */,
                                                  ),
                                                  options: FFButtonOptions(
                                                    width: 80.0,
                                                    height: 40.0,
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    iconPadding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Inter Tight',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    elevation: 0.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Builder(
                                          builder: (context) {
                                            final myeventslist =
                                                homeEventslistRowList
                                                    .map((e) => e)
                                                    .toList();

                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: myeventslist.length,
                                              itemBuilder:
                                                  (context, myeventslistIndex) {
                                                final myeventslistItem =
                                                    myeventslist[
                                                        myeventslistIndex];
                                                return Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 10.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context.pushNamed(
                                                        'compscouthome',
                                                        queryParameters: {
                                                          'eventid':
                                                              serializeParam(
                                                            myeventslistItem.id,
                                                            ParamType.int,
                                                          ),
                                                          'eventname':
                                                              serializeParam(
                                                            myeventslistItem
                                                                .eventname,
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                    onLongPress: () async {
                                                      var confirmDialogResponse =
                                                          await showDialog<
                                                                  bool>(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return AlertDialog(
                                                                    title: const Text(
                                                                        'Delate this?'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(
                                                                            alertDialogContext,
                                                                            false),
                                                                        child: const Text(
                                                                            'Cancel'),
                                                                      ),
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(
                                                                            alertDialogContext,
                                                                            true),
                                                                        child: const Text(
                                                                            'Confirm'),
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              ) ??
                                                              false;
                                                      if (confirmDialogResponse) {
                                                        await EventslistTable()
                                                            .delete(
                                                          matchingRows:
                                                              (rows) =>
                                                                  rows.eqOrNull(
                                                            'id',
                                                            myeventslistItem.id,
                                                          ),
                                                        );
                                                        await CompscoutlistTable()
                                                            .delete(
                                                          matchingRows:
                                                              (rows) =>
                                                                  rows.eqOrNull(
                                                            'eventid',
                                                            myeventslistItem.id,
                                                          ),
                                                        );
                                                        await PitscoutlistTable()
                                                            .delete(
                                                          matchingRows:
                                                              (rows) =>
                                                                  rows.eqOrNull(
                                                            'eventid',
                                                            myeventslistItem.id,
                                                          ),
                                                        );

                                                        context.pushNamed(
                                                          'home',
                                                          extra: <String,
                                                              dynamic>{
                                                            kTransitionInfoKey:
                                                                const TransitionInfo(
                                                              hasTransition:
                                                                  true,
                                                              transitionType:
                                                                  PageTransitionType
                                                                      .fade,
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      0),
                                                            ),
                                                          },
                                                        );
                                                      }
                                                    },
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      height: 100.0,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        boxShadow: const [
                                                          BoxShadow(
                                                            blurRadius: 12.0,
                                                            color: Color(
                                                                0x34000000),
                                                            offset: Offset(
                                                              -2.0,
                                                              5.0,
                                                            ),
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    8.0,
                                                                    12.0,
                                                                    8.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              width: 4.0,
                                                              height: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: const Color(
                                                                    0xFF4B39EF),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4.0),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        myeventslistItem
                                                                            .eventname,
                                                                        'null',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Plus Jakarta Sans',
                                                                            color:
                                                                                const Color(0xFF4B39EF),
                                                                            fontSize:
                                                                                18.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          dateTimeFormat(
                                                                            "MMMMEEEEd",
                                                                            myeventslistItem.eventdate,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          ),
                                                                          'null',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .headlineSmall
                                                                            .override(
                                                                              fontFamily: 'Outfit',
                                                                              color: const Color(0xFF14181B),
                                                                              fontSize: 15.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                            6.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    myeventslistItem
                                                                        .eventcode,
                                                                    'null',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .info,
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
