import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../WIDGETS/textfield_widget.dart';
import '../logic/cubit/my_register_cubit.dart';

class RegisterTextfieldWidget extends StatelessWidget {
  const RegisterTextfieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: BlocProvider.of<MyRegisterCubit>(context).state.createFormKey,
      child: Column(
        children: [
          TextFieldWidget(
            child: emailTextField(
                context,
                BlocProvider.of<MyRegisterCubit>(context).state.emailController,
                'Enter email'),
          ),
          TextFieldWidget(
            child: numberTextField(
                context,
                BlocProvider.of<MyRegisterCubit>(context)
                    .state
                    .numberController,
                'Enter number'),
          ),
          TextFieldWidget(
            child: passwordTextField(
                context,
                BlocProvider.of<MyRegisterCubit>(context)
                    .state
                    .passwordController,
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
        return BlocProvider.of<MyRegisterCubit>(context)
            .state
            .emailValidator(value);
      },
      onChanged: (value) {
        BlocProvider.of<MyRegisterCubit>(context)
            .state
            .createFormKey
            .currentState!
            .validate();
        BlocProvider.of<MyRegisterCubit>(context)
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
        return BlocProvider.of<MyRegisterCubit>(context)
            .state
            .passwordValidator(value);
      },
      onChanged: (value) {
        BlocProvider.of<MyRegisterCubit>(context)
            .state
            .createFormKey
            .currentState!
            .validate();
      },
    );
  }

  numberTextField(
      BuildContext context, TextEditingController controller, String label) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: label, //hint text here
      ),
      validator: (value) {
        return BlocProvider.of<MyRegisterCubit>(context)
            .state
            .numberValidator(value);
      },
      onChanged: (value) {
        BlocProvider.of<MyRegisterCubit>(context)
            .state
            .createFormKey
            .currentState!
            .validate();
      },
    );
  }

/* -------------------------------------------------------------------------- */
/*                             //! Functionalities                            */
/* -------------------------------------------------------------------------- */
}
