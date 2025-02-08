import '/flutter_flow/flutter_flow_util.dart';
import 'updatepassword_widget.dart' show UpdatepasswordWidget;
import 'package:flutter/material.dart';

class UpdatepasswordModel extends FlutterFlowModel<UpdatepasswordWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  // State field(s) for newpassword widget.
  FocusNode? newpasswordFocusNode;
  TextEditingController? newpasswordTextController;
  late bool newpasswordVisibility;
  String? Function(BuildContext, String?)? newpasswordTextControllerValidator;
  // State field(s) for retypenewpassword widget.
  FocusNode? retypenewpasswordFocusNode;
  TextEditingController? retypenewpasswordTextController;
  late bool retypenewpasswordVisibility;
  String? Function(BuildContext, String?)?
      retypenewpasswordTextControllerValidator;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
    newpasswordVisibility = false;
    retypenewpasswordVisibility = false;
  }

  @override
  void dispose() {
    passwordFocusNode?.dispose();
    passwordTextController?.dispose();

    newpasswordFocusNode?.dispose();
    newpasswordTextController?.dispose();

    retypenewpasswordFocusNode?.dispose();
    retypenewpasswordTextController?.dispose();
  }
}
