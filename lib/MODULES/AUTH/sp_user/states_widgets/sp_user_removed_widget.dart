import 'package:flutter/material.dart';
import 'package:flutter5/MODULES/COMMON/WIDGETS/navigate_to_splash.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../COMMON/WIDGETS/snackbar_widget.dart';
import '../sp_user_logic/sp_user_bloc.dart';

class SpUserRemovedWidget extends StatelessWidget {
  const SpUserRemovedWidget({super.key});

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
    return BlocListener<SpUserBloc, SpUserState>(
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
    return BlocListener<SpUserBloc, SpUserState>(
      listener: (context, state) {
        if (state is ProfileSessionRemovedState) {
          debugPrint('profile sp removed- from ams');
        }
      },
      child: Container(),
    );
  }
}
