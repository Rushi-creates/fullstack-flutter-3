import 'package:flutter/material.dart';

import '../../sp_user/states_widgets/sp_user_stored_widget.dart';
import 'login_button_widget.dart';
import 'login_textfield_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
/* -------------------------------------------------------------------------- */
/*                                  //! Build                                 */
/* -------------------------------------------------------------------------- */

  @override
  Widget build(BuildContext context) {
    return structure();

    // return Scaffold(
    //   // resizeToAvoidBottomInset: false,
    //   backgroundColor: Colors.white,
    //   appBar: myHeader(),
    //   body: structure(),
    // );
  }

/* -------------------------------------------------------------------------- */
/*                                //! Structure                               */
/* -------------------------------------------------------------------------- */

  structure() {
    return const Column(
      children: [
        LoginTextfieldWidget(),
        LoginButtonWidget(),
        SpUserStoredWidget(), //listener
      ],
    );
  }

/* -------------------------------------------------------------------------- */
/*                                 //! Widgets                                */
/* -------------------------------------------------------------------------- */

  AppBar myHeader() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      // elevation: 0.0,
      //leading: IconButton(
      //  icon: Icon(
      //   Icons.arrow_back,
      //   color: Colors.black,
      //   ),
      //   onPressed: (){
      //       Navigator.pop(context);
      //   }
      // ),
      // automaticallyImplyLeading: true,  //removes default back arrow on appbar

      title: const Text(
        'Login', //give here appBar title
        style: TextStyle(color: Colors.black
            // fontWeight: FontWeight.bold
            // fontSize: 15,
            ),
      ),
      //actions: [

      //  Padding(
      //    padding: const EdgeInsets.all(8.0),
      //   child: IconButton(
      //       onPressed: null,
      //       icon: Icon(
      //         Icons.search,
      //         color: Colors.black,
      //       )), )
      // ],
    );
  }

/* -------------------------------------------------------------------------- */
/*                             //! Functionalities                            */
/* -------------------------------------------------------------------------- */
}
