import 'package:flutter/material.dart';
import 'package:flutter5/MODULES/WIDGETS/loader_widget.dart';
import 'package:flutter5/MODULES/WIDGETS/snackbar_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../sp_user/sp_user_logic/sp_user_bloc.dart';
import 'delete_account_logic/delete_account_bloc.dart';

class DeleteAccountWidget extends StatelessWidget {
  const DeleteAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return deleteAccountStates();
  }

  deleteAccountStates() {
    return BlocConsumer<DeleteAccountBloc, DeleteAccountState>(
      listener: (context, state) {
        if (state is DeleteAccountSuccessState) {
          BlocProvider.of<SpUserBloc>(context).add(RemoveProfileSessionEvent());
          BlocProvider.of<SpUserBloc>(context).add(RemoveUserSessionEvent());
          //
        } else if (state is DeleteAccountFailureState) {
          SnackBarWidget(
              context, 'Failed to delete account, please try again later',
              bgColor: Colors.red);
        }
      },
      builder: (context, state) {
        if (state is DeleteAccountLoadingState) {
          return const LoaderWidget();
        }
        return deleteAccountTile(context);
      },
    );
  }

  deleteAccountTile(context) {
    return ListTile(
      title: const Text(
        "Delete your Account !!!",
        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
      ),
      subtitle: const Text(
          "Your account will be deleted and all your data will be lost"),
      onTap: () {
        showDialogFunc(context);
      },
    );
  }

  showDialogFunc(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: const EdgeInsets.all(14.0),
            content: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Warning!",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                      "Are you sure you want to delete your account? This can't be undone, once deleted."),
                ),
              ],
            ),
            actions: [
              TextButton(
                child: const Text(
                  "Delete permanently",
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: () {
                  BlocProvider.of<DeleteAccountBloc>(context)
                      .add(DeleteAccountButtonPressedEvent());
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }
}
