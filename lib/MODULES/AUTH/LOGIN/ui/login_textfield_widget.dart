import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../COMMON/WIDGETS/textfield_widget.dart';
import '../logic/cubit/my_login_cubit.dart';

class LoginTextfieldWidget extends StatelessWidget {
  const LoginTextfieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: BlocProvider.of<MyLoginCubit>(context).state.createFormKey,
      child: Column(
        children: [
          TextFieldWidget(
            child: emailTextField(
                context,
                BlocProvider.of<MyLoginCubit>(context).state.emailController,
                'Enter email'),
          ),
          TextFieldWidget(
            child: passwordTextField(
                context,
                BlocProvider.of<MyLoginCubit>(context).state.passwordController,
                'Enter password'),
          ),
        ],
      ),
    );
  }

/* -------------------------------------------------------------------------- */
/*                                 //! Widgets                                */
/* -------------------------------------------------------------------------- */

  emailTextField(
      BuildContext context, TextEditingController controller, String label) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: label,
      ),
      validator: (value) {
        return BlocProvider.of<MyLoginCubit>(context)
            .state
            .emailValidator(value);
      },
      onChanged: (value) {
        BlocProvider.of<MyLoginCubit>(context)
            .state
            .createFormKey
            .currentState!
            .validate();
        BlocProvider.of<MyLoginCubit>(context)
            .state
            .createFormKey
            .currentState!
            .validate();
      },
    );
  }

  passwordTextField(
      BuildContext context, TextEditingController controller, String label) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: label, //hint text here
      ),
      validator: (value) {
        return BlocProvider.of<MyLoginCubit>(context)
            .state
            .passwordValidator(value);
      },
      onChanged: (value) {
        BlocProvider.of<MyLoginCubit>(context)
            .state
            .createFormKey
            .currentState!
            .validate();
      },
    );
  }
}
