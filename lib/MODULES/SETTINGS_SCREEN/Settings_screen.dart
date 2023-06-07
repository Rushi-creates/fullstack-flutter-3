import 'package:flutter5/MODULES/COMMON/auth_session_manager_logic/auth_session_manager_bloc.dart';
import 'package:flutter5/MODULES/COMMON/auth_session_manager_logic/auth_session_manager_removed_widget.dart';

import '../../SERIALIZERS/repositories/user_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'UserLod_logic/user_lod_bloc.dart';

//to change class name = right click on className> Rename symbol
class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
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
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const AuthSessionManagerRemovedWidget(), //! listener for ending session

            AboutProfilCard(),
            Divider(),
            cautionZone(),
            Divider(),
            // seeYouSoonCard()
          ],
        ),
      ),
    );
  }

  AboutProfilCard() {
    var dimVar = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          width: dimVar.width * 0.9,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Your Profile",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                      ),
                    ),
                    sp_userAccObj_BlocProvider_STATES(),
                  ]),
            ),
          )),
    );
  }

  cautionZone() {
    var dimVar = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: dimVar.width * 0.9,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                caution_Text(),
                SizedBox(height: dimVar.height * 0.02),
                caution_tile_logout(),
                const Divider(),
                caution_tile_DeleteAccount(),
              ],
            ),
          ),
        ),
      ),
    );
  }

//   seeYouSoonCard() {
//     var dimVar = MediaQuery.of(context).size;

// //height : dimVar.height*0.5    //to access height
// //width : dimVar.width*0.5       //acces width
//     return FittedBox(
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Card(
//           elevation: 3,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(15.0),
//                 child: Text(
//                   'New features \ncomming soon :)',
//                   // maxLines: 2,
//                   // overflow: TextOverflow.ellipsis,
//                   textAlign: TextAlign.end,
//                   style: TextStyle(
//                     color: Colors.pink,
//                     // decoration: TextDecoration.none,
//                     fontStyle: FontStyle.italic,
//                     // fontFamily: "FontNameHere" ,
//                     fontWeight: FontWeight.bold,
//                     // fontWeight: FontWeight.w300,
//                     fontSize: 17.0,
//                   ),
//                 ),
//               ),
//               Image.asset("images/waiting.jpg",
//                   height: 200, width: dimVar.width * 0.5)
//             ],
//           ),
//         ),
//       ),
//     );
//   }

  caution_Text() {
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

  caution_tile_logout() {
    return ListTile(
      title: Text("Sign out of app"),
      subtitle: Text("Temporarily log out of app"),
      onTap: () {
        BlocProvider.of<AuthSessionManagerBloc>(context)
            .add(RemoveProfileSessionEvent()); //!
        BlocProvider.of<AuthSessionManagerBloc>(context)
            .add(RemoveUserSessionEvent()); //!
      },
    );
  }

  caution_tile_DeleteAccount() {
    return BlocConsumer<UserLodBloc, UserLodState>(
      listener: (context, state) {
        if (state is UserDeleteUserAccount_Success_State) {
          Navigator.pop(context);
          BlocProvider.of<AuthSessionManagerBloc>(context)
              .add(RemoveProfileSessionEvent()); //!
          BlocProvider.of<AuthSessionManagerBloc>(context)
              .add(RemoveUserSessionEvent()); //!
        } else if (state is UserDeleteUserAccount_Failure_State) {
          Navigator.pop(context);
          Navigator.pop(context);

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green,
              content: Text(
                  "Couldn't delete account right now, please try again later"),
            ),
          );
        } else if (state is UserDeleteUserAccount_Loading_State) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        if (state is UserDeleteUserAccount_Loading_State) {
          return Center(child: CircularProgressIndicator());
        }
        return ListTile(
          // tileColor: Colors.,
          title: Text(
            "Delete your Account !!!",
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
              "Your account will be deleted and all your data will be lost"),
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    contentPadding: const EdgeInsets.all(14.0),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
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
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              "Are you sure you want to delete your account? This can't be undone, once deleted."),
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        child: Text(
                          "Delete permanently",
                          style: TextStyle(color: Colors.red),
                        ),
                        onPressed: () {
                          BlocProvider.of<UserLodBloc>(context)
                              .add(UserDeleteUserAccount_ButtonPressedEvent());
                        },
                      )
                    ],
                  );
                });
          },
        );
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

  sp_userAccObj_BlocProvider_STATES() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Your email : ${UserSpRepo.instance.get_user()!.email}'),
          Text('Your number : ${UserSpRepo.instance.get_user()!.number}'),
        ],
      ),
    );
  }
}