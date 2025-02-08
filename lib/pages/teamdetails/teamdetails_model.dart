import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'teamdetails_widget.dart' show TeamdetailsWidget;
import 'package:flutter/material.dart';

class TeamdetailsModel extends FlutterFlowModel<TeamdetailsWidget> {
  ///  Local state fields for this page.

  String? pictureurl = '-';

  /// true = profile,.
  ///
  /// false = insight
  bool pagestate = true;

  ///  State fields for stateful widgets in this page.

  // State field(s) for teamnum widget.
  FocusNode? teamnumFocusNode;
  TextEditingController? teamnumTextController;
  String? Function(BuildContext, String?)? teamnumTextControllerValidator;
  // State field(s) for autoendgame widget.
  String? autoendgameValue;
  FormFieldController<String>? autoendgameValueController;
  // State field(s) for teleopendgame widget.
  String? teleopendgameValue;
  FormFieldController<String>? teleopendgameValueController;
  // State field(s) for comment widget.
  FocusNode? commentFocusNode;
  TextEditingController? commentTextController;
  String? Function(BuildContext, String?)? commentTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    teamnumFocusNode?.dispose();
    teamnumTextController?.dispose();

    commentFocusNode?.dispose();
    commentTextController?.dispose();
  }
}
