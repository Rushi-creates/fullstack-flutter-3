import 'package:flutter/material.dart';
import 'package:flutter5/SERIALIZERS/models/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../COMMON/WIDGETS/loader_widget.dart';
import '../../sp_user/sp_user_logic/sp_user_bloc.dart';
import '../logic/cubit/my_register_cubit.dart';
import '../logic/register_button_logic/register_button_bloc.dart';

class RegisterButtonWidget extends StatelessWidget {
  const RegisterButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return buttonStates();
  }

/* -------------------------------------------------------------------------- */
/*                                 //@ States                                 */
/* -------------------------------------------------------------------------- */

  buttonStates() {
    return BlocConsumer<RegisterButtonBloc, RegisterButtonState>(
      listener: (context, state) {
        if (state is RegisterButtonSuccessState) {
          callAuthSessionEvent(context, state);
          // SnackBarWidget(context, 'Register successful');
        }
      },
      builder: (context, state) {
        if (state is RegisterButtonLoadingState) {
          return customLoading();
        } else if (state is RegisterButtonUnknownErrorState) {
          return errorWidget(context, state.error);
        } else if (state is RegisterButtonAccountDontExistErrorState) {
          return errorWidget(context, state.msg);
        }
        return registerButton(context);
      },
    );
  }

/* -------------------------------------------------------------------------- */
/*                                 //@ Widgets                                */
/* -------------------------------------------------------------------------- */

  registerButton(context) {
    return TextButton(
        style: TextButton.styleFrom(backgroundColor: Colors.deepPurple),
        onPressed: () async => registerFunc(context),
        child: const Text(
          "Register",
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
          registerButton(context),
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

  registerFunc(context) {
    //

    var myState = BlocProvider.of<MyRegisterCubit>(context).state;

    User user = User(
        email: myState.emailController.text,
        number: int.tryParse(myState.numberController.text),
        password: myState.passwordController.text);

    if (myState.createFormKey.currentState!.validate()) {
      BlocProvider.of<RegisterButtonBloc>(context)
          .add(RegisterButtonPressedEvent(user));
    }
  }

  callAuthSessionEvent(context, state) {
    BlocProvider.of<SpUserBloc>(context)
        .add(StoreUserSessionEvent(state.loggedIn));
  }
}
