import 'package:flutter/material.dart';
import 'package:flutter5/MODULES/WIDGETS/loader_widget.dart';
import 'package:flutter5/MODULES/WIDGETS/snackbar_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'create_bloc.dart';

class CreateButton_widget<T> extends StatelessWidget {
  final Future<dynamic> Function() myAddFunc;
  final formKey;
  final buttonUi;
  final dynamic Function()? onSuccess;

  const CreateButton_widget(
      {required this.myAddFunc, this.formKey, this.buttonUi, this.onSuccess});
  @override
  Widget build(BuildContext context) {
    return saveButton_STATES();
  }

/* -------------------------------------------------------------------------- */
/*                                 //@ States                                 */
/* -------------------------------------------------------------------------- */

  saveButton_STATES() {
    return BlocConsumer<CreateBloc<T>, CreateState<T>>(
      listener: (context, state) {
        if (state is CreateSuccess_State<T>) {
          if (onSuccess == null) {
            SnackBarWidget(context, 'Action completed');
          } else {
            onSuccess;
          }
        }
      },
      builder: (context, state) {
        if (state is CreateLoading_State<T>) {
          return customLoading();
        } else if (state is CreateError_State<T>) {
          return errorWidget(context, state.error);
        }
        return save_Button_ui(context);
      },
    );
  }

/* -------------------------------------------------------------------------- */
/*                                 //@ Widgets                                */
/* -------------------------------------------------------------------------- */

  save_Button_ui(context) {
    return GestureDetector(
        onTap: () async => save_FUNC(context),
        child: buttonUi == null
            ? TextButton(
                child: Text(
                  "Save",
                  style: TextStyle(color: Colors.white),
                ),
                style: TextButton.styleFrom(backgroundColor: Colors.deepPurple),
                onPressed: null,
              )
            : buttonUi);
  }

/* -------------------------------------------------------------------------- */
/*                             //@ Static widgets                             */
/* -------------------------------------------------------------------------- */

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

  errorWidget(context, state) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text('Error : ${state.error}'),
          save_Button_ui(context),
        ],
      ),
    );
  }

/* -------------------------------------------------------------------------- */
/*                             //@ Functionalities                            */
/* -------------------------------------------------------------------------- */

  save_FUNC(context) {
    if (formKey == null) {
      BlocProvider.of<CreateBloc<T>>(context)
          .add(Create_ButtonPressed_Event<T>(myAddFunc));
    } else if (formKey.currentState!.validate()) {
      BlocProvider.of<CreateBloc<T>>(context)
          .add(Create_ButtonPressed_Event<T>(myAddFunc));
    }
  }
}


/* -------------------------------------------------------------------------- */
/*                                //? TUTORIAL                                */
/* -------------------------------------------------------------------------- */

//! in main. dart
// MultiBlocProvider(
//       providers: [
//         BlocProvider<CreateBloc<Post>>(create: (context) => CreateBloc<Post>()),
//       ])

//! calling widget
  // myBody() {
  //   Post_api_repo post_api_repo = Post_api_repo();
  //   Post post = Post(
  //       title: 'jkadf',
  //       description: 'alkdjfa',
  //       salary_method: 'jkadf',
  //       goals: 'lakjsfd',
  //       qualifications_req: 'jadf',
  //       skills_req: 'ljasdf',
  //       max_users: 789,
  //       isOpen: true,
  //       isCompanyRegistered: true,
  //       recordDate: 'ajkfd',
  //       post_fk: 6);

  //   return SafeArea(
  //     child: CreateButton_widget<Post>(
  //       myAddFunc: () => post_api_repo.add_post(post),
  //       //  formkey : formKey
  //     ),
  //   );
  // }


  //! other example
  
  // structure() {
  //   return Column(
  //     children: [
  //       const RegisterTextfieldWidget(),
  //       CreateButton_widget<GRegisterButton>(
  //         formKey:
  //             BlocProvider.of<MyRegisterCubit>(context).state.createFormKey,
  //         myAddFunc: () async {
  //           User user = User(
  //             email: BlocProvider.of<MyRegisterCubit>(context)
  //                 .state
  //                 .emailController
  //                 .text,
  //             password: BlocProvider.of<MyRegisterCubit>(context)
  //                 .state
  //                 .passwordController
  //                 .text,
  //             number: int.tryParse(BlocProvider.of<MyRegisterCubit>(context)
  //                 .state
  //                 .numberController
  //                 .text),
  //           );

//   //@dont forget the return kw
  //           return await UserRepo.instance.createUserRegister(user);
  //         },
  //         onSuccess: () {
  //           debugPrint('onSuccess triggered');
  //           return SnackBarWidget(context, 'From on success',
  //               bgColor: Colors.orange);
  //         },
  //       )
  //     ],
  //   );
  // }
