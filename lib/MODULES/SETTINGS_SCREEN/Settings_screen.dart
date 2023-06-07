import 'package:flutter5/MODULES/AUTH/DELETE_ACCOUNT/delete_account_widget.dart';
import 'package:flutter5/MODULES/SETTINGS_SCREEN/display_account_info.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../AUTH/sp_user/sp_user_logic/sp_user_bloc.dart';
import '../AUTH/sp_user/states_widgets/sp_user_removed_widget.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // resizeToAvoidBottomInset: false,
      appBar: myHeader(),
      body: myBody(),
    );
  }

  myBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SpUserRemovedWidget(), //! listener for ending session
          const DisplayAccountInfoWidget(),
          const Divider(),
          cautionZone(),
          const Divider(),
          // seeYouSoonCard()
        ],
      ),
    );
  }

  cautionZone() {
    var dimVar = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              cautionText(),
              SizedBox(height: dimVar.height * 0.02),
              logoutTile(),
              const Divider(),
              const DeleteAccountWidget(),
              // caution_tile_DeleteAccount(),
            ],
          ),
        ),
      ),
    );
  }

  cautionText() {
    return Text(
      "CAUTION ZONE !",
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
        fontSize: 25.0,
      ),
    );
  }

  logoutTile() {
    return ListTile(
      title: Text("Sign out of app"),
      subtitle: Text("Temporarily log out of app"),
      onTap: () {
        BlocProvider.of<SpUserBloc>(context)
            .add(RemoveProfileSessionEvent()); //!
        BlocProvider.of<SpUserBloc>(context).add(RemoveUserSessionEvent()); //!
      },
    );
  }

  AppBar myHeader() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          }),
      title: Text(
        'Settings', //give here appBar title
        style: TextStyle(color: Colors.black
            // fontWeight: FontWeight.bold
            // fontSize: 15,
            ),
      ),
    );
  }

/* -------------------------------------------------------------------------- */
/*                                 //@ STATES                                 */
/* -------------------------------------------------------------------------- */
}
