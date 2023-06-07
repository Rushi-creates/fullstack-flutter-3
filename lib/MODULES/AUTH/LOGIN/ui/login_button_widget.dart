import 'package:flutter/material.dart';
import 'package:flutter5/SERIALIZERS/models/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../COMMON/WIDGETS/loader_widget.dart';
import '../../sp_user/sp_user_logic/sp_user_bloc.dart';
import '../logic/cubit/my_login_cubit.dart';
import '../logic/login_button_logic/login_button_bloc.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return buttonStates();
  }

/* -------------------------------------------------------------------------- */
/*                                 //@ States                                 */
/* -------------------------------------------------------------------------- */

  buttonStates() {
    return BlocConsumer<LoginButtonBloc, LoginButtonState>(
      listener: (context, state) {
        if (state is LoginButtonSuccessState) {
          callAuthSessionEvent(context, state);
        }
      },
      builder: (context, state) {
        if (state is LoginButtonLoadingState) {
          return customLoading();
        } else if (state is LoginButtonUnknownErrorState) {
          return errorWidget(context, state.error);
        } else if (state is LoginButtonAccountDontExistErrorState) {
          return errorWidget(context, state.msg);
        }
        return loginButton(context);
      },
    );
  }

  // authSessionStates() {
  //   return BlocListener<SpUserBloc, SpUserState>(
  //     listener: (context, state) {
  //       if (state is UserSessionStoredState) {
  //         NavigateToSplash(context);
  //         // SnackBarWidget(context, 'Login successful');
  //       }
  //     },
  //     child: Container(),
  //   );
  // }

/* -------------------------------------------------------------------------- */
/*                                 //@ Widgets                                */
/* -------------------------------------------------------------------------- */

  loginButton(context) {
    return TextButton(
        style: TextButton.styleFrom(backgroundColor: Colors.deepPurple),
        onPressed: () async => loginFunc(context),
        child: const Text(
          "Login",
          style: TextStyle(color: Colors.white),
        ));
  }

  customLoading() {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          LoaderWidget(),
          Text('Please wait ...'),
        ],
      ),
    );
  }

  errorWidget(context, text) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          loginButton(context),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Error : $text',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

/* -------------------------------------------------------------------------- */
/*                             //@ Functionalities                            */
/* -------------------------------------------------------------------------- */

  loginFunc(context) {
    //

    var myState = BlocProvider.of<MyLoginCubit>(context).state;

    User user = User(
        email: myState.emailController.text,
        password: myState.passwordController.text);

    if (myState.createFormKey.currentState!.validate()) {
      BlocProvider.of<LoginButtonBloc>(context)
          .add(LoginButtonPressedEvent(user));
    }
  }

  callAuthSessionEvent(context, state) {
    BlocProvider.of<SpUserBloc>(context)
        .add(StoreUserSessionEvent(state.loggedIn));
  }
}
