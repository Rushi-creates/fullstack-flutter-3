import 'package:flutter/material.dart';
import 'package:flutter5/MODULES/WIDGETS/navigate_to_splash.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../sp_user_logic/sp_user_bloc.dart';

class SpUserStoredWidget extends StatelessWidget {
  const SpUserStoredWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        authSessionStates(),
        authSessionProfileStoredStates(),
      ],
    );
  }

  authSessionStates() {
    return BlocListener<SpUserBloc, SpUserState>(
      listener: (context, state) {
        if (state is UserSessionStoredState) {
          NavigateToSplash(context, doReplace: true);
        }
      },
      child: Container(),
    );
  }

  /* 
  
  Note: remove profile is already implemented.

  no need for profile states ig, that storing profile has not other 
  intention other than Storing profile. 

  Unlike userObj, which has 2 funcs
    - store in sp
    - maintain state of user(i.e logged out or not )

  but still for separation can do for setProfile too

  */

  authSessionProfileStoredStates() {
    return BlocListener<SpUserBloc, SpUserState>(
      listener: (context, state) {
        if (state is ProfileSessionStoredState) {
          NavigateToSplash(context, doReplace: true);
        }
      },
      child: Container(),
    );
  }
}
