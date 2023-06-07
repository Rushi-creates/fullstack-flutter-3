import 'package:flutter/material.dart';
import 'package:flutter5/MODULES/COMMON/WIDGETS/loader_widget.dart';
import 'package:flutter5/MODULES/COMMON/WIDGETS/snackbar_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'update_bloc.dart';

class UpdateButton_widget<T> extends StatelessWidget {
  final Future<dynamic> Function() myAddFunc;
  final formKey;
  final buttonUi;

  const UpdateButton_widget(
      {required this.myAddFunc, this.formKey, this.buttonUi});

  @override
  Widget build(BuildContext context) {
    return updateButton_STATES();
  }

/* -------------------------------------------------------------------------- */
/*                                 //@ States                                 */
/* -------------------------------------------------------------------------- */

  updateButton_STATES() {
    return BlocConsumer<UpdateBloc<T>, UpdateState<T>>(
      listener: (context, state) {
        if (state is UpdateSuccess_State<T>) {
          SnackBarWidget(context, 'Action completed');
          // Navigator.pop(context);
        }
      },
      builder: (context, state) {
        if (state is UpdateLoading_State<T>) {
          return customLoading();
        } else if (state is UpdateError_State<T>) {
          return errorWidget(context, state);
        }
        return update_Button_ui(context);
      },
    );
  }

/* -------------------------------------------------------------------------- */
/*                                 //@ Widgets                                */
/* -------------------------------------------------------------------------- */

  update_Button_ui(context) {
    return GestureDetector(
        onTap: () async => update_FUNC(context),
        child: buttonUi == null
            ? TextButton(
                child: Text(
                  "Update",
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
          update_Button_ui(context),
        ],
      ),
    );
  }

/* -------------------------------------------------------------------------- */
/*                             //@ Functionalities                            */
/* -------------------------------------------------------------------------- */

  update_FUNC(context) {
    if (formKey == null) {
      BlocProvider.of<UpdateBloc<T>>(context)
          .add(Update_ButtonPressed_Event<T>(myAddFunc));
    } else if (formKey.currentState!.validate()) {
      BlocProvider.of<UpdateBloc<T>>(context)
          .add(Update_ButtonPressed_Event<T>(myAddFunc));
    }
  }
}


/* -------------------------------------------------------------------------- */
/*                                //? TUTORIAL                                */
/* -------------------------------------------------------------------------- */

//! in main. dart
// MultiBlocProvider(
//       providers: [
//         BlocProvider<UpdateBloc<Post>>(update: (context) => UpdateBloc<Post>()),
//       ])

//! calling widget
  // myBody() {
  //   Post_api_repo post_api_repo = Post_api_repo();
  //   Post post = Post(
  //       id : 15,
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
  //     child: UpdateButton_widget<Post>(
  //       myAddFun: () => post_api_repo.update(post, post.id),
  //      // formKey : formKey
  //     ),
  //   );
  // }