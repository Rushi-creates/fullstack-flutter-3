import 'package:flutter/material.dart';
import 'package:flutter5/MODULES/COMMON/WIDGETS/loader_widget.dart';
import 'package:flutter5/MODULES/COMMON/WIDGETS/snackbar_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'delete_bloc.dart';

class DeleteButton_widget<T> extends StatelessWidget {
  final Future<dynamic> Function() myAddFunc;
  final formKey;
  final buttonUi;

  const DeleteButton_widget(
      {required this.myAddFunc, this.formKey, this.buttonUi});

  @override
  Widget build(BuildContext context) {
    return deleteButton_STATES();
  }

/* -------------------------------------------------------------------------- */
/*                                 //@ States                                 */
/* -------------------------------------------------------------------------- */

  deleteButton_STATES() {
    return BlocConsumer<DeleteBloc<T>, DeleteState<T>>(
      listener: (context, state) {
        if (state is DeleteSuccess_State<T>) {
          SnackBarWidget(context, 'Action completed');
          // Navigator.pop(context);
        }
      },
      builder: (context, state) {
        if (state is DeleteLoading_State<T>) {
          return customLoading();
        } else if (state is DeleteError_State<T>) {
          return errorWidget(context, state);
        }
        return delete_Button_ui(context);
      },
    );
  }

/* -------------------------------------------------------------------------- */
/*                                 //@ Widgets                                */
/* -------------------------------------------------------------------------- */

  delete_Button_ui(context) {
    return GestureDetector(
        onTap: () async => delete_FUNC(context),
        child: buttonUi == null
            ? TextButton(
                child: Text(
                  "Delete",
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
          delete_Button_ui(context),
        ],
      ),
    );
  }

/* -------------------------------------------------------------------------- */
/*                             //@ Functionalities                            */
/* -------------------------------------------------------------------------- */

  delete_FUNC(context) {
    if (formKey == null) {
      BlocProvider.of<DeleteBloc<T>>(context)
          .add(Delete_ButtonPressed_Event<T>(myAddFunc));
    } else if (formKey.currentState!.validate()) {
      BlocProvider.of<DeleteBloc<T>>(context)
          .add(Delete_ButtonPressed_Event<T>(myAddFunc));
    }
    BlocProvider.of<DeleteBloc<T>>(context)
        .add(Delete_ButtonPressed_Event<T>(myAddFunc));
  }
}


/* -------------------------------------------------------------------------- */
/*                                //? TUTORIAL                                */
/* -------------------------------------------------------------------------- */

//! in main. dart
// MultiBlocProvider(
//       providers: [
//         BlocProvider<DeleteBloc<Post>>(delete: (context) => DeleteBloc<Post>()),
//       ])

//! calling widget
  // myBody() {
  //   Post_api_repo post_api_repo = Post_api_repo();
 

  //   return SafeArea(
  //     child: DeleteButton_widget<Post>(
  //       myAddFun: () => post_api_repo.delete(post.id),
  //       // formKey : formKey
  //     ),
  //   );
  // }