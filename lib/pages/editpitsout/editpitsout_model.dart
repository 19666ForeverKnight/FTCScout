import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'editpitsout_widget.dart' show EditpitsoutWidget;
import 'package:flutter/material.dart';

class EditpitsoutModel extends FlutterFlowModel<EditpitsoutWidget> {
  ///  Local state fields for this page.

  String? pictureurl = '-';

  ///  State fields for stateful widgets in this page.

  // State field(s) for teamnum widget.
  FocusNode? teamnumFocusNode;
  TextEditingController? teamnumTextController;
  String? Function(BuildContext, String?)? teamnumTextControllerValidator;
  // State field(s) for autohighbasket widget.
  int? autohighbasketValue;
  // State field(s) for autolowbasket widget.
  int? autolowbasketValue;
  // State field(s) for autohighchember widget.
  int? autohighchemberValue;
  // State field(s) for autolowchember widget.
  int? autolowchemberValue;
  // State field(s) for autonet widget.
  int? autonetValue;
  // State field(s) for autoendgame widget.
  String? autoendgameValue;
  FormFieldController<String>? autoendgameValueController;
  // State field(s) for teleophighbasket widget.
  int? teleophighbasketValue;
  // State field(s) for teleoplowbasket widget.
  int? teleoplowbasketValue;
  // State field(s) for teleophighchember widget.
  int? teleophighchemberValue;
  // State field(s) for teleoplowchember widget.
  int? teleoplowchemberValue;
  // State field(s) for teleopnet widget.
  int? teleopnetValue;
  // State field(s) for teleopendgame widget.
  String? teleopendgameValue;
  FormFieldController<String>? teleopendgameValueController;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

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
