import 'package:flutter/material.dart';
import 'package:flutter5/MODULES/AUTH/sp_user/sp_user_logic/sp_user_widget.dart';

NavigateToSplash(ctx, {bool doReplace = true}) {
  if (doReplace) {
    Navigator.pushReplacement(ctx, MaterialPageRoute(builder: (context) {
      return const SpUserWidget();
    }));

    //
  } else {
    Navigator.push(ctx, MaterialPageRoute(builder: (context) {
      return const SpUserWidget();
    }));
  }
}
