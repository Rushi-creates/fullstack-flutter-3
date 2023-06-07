import 'package:flutter/material.dart';
import 'package:flutter5/MODULES/WIDGETS/navigate_to_splash.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../WIDGETS/snackbar_widget.dart';
import 'auth_session_manager_bloc.dart';

class AuthSessionManagerRemovedWidget extends StatelessWidget {
  const AuthSessionManagerRemovedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        authSessionRemovedStates(),
        authSessionProfileRemovedStates(),
      ],
    );
  }

  authSessionRemovedStates() {
    return BlocListener<AuthSessionManagerBloc, AuthSessionManagerState>(
      listener: (context, state) {
        if (state is UserSessionRemovedState) {
          NavigateToSplash(context, doReplace: true);
          SnackBarWidget(context, "Signed out of app successfully");
        }
      },
      child: Container(),
    );
  }

  authSessionProfileRemovedStates() {
    return BlocListener<AuthSessionManagerBloc, AuthSessionManagerState>(
      listener: (context, state) {
        if (state is ProfileSessionRemovedState) {
          debugPrint('profile sp removed- from ams');
        }
      },
      child: Container(),
    );
  }
}
