import 'package:flutter/material.dart';
import 'package:flutter5/MODULES/REGISTER/ui/register_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../LOGIN/ui/login_screen.dart';
import 'AuthTabBarLogic/auth_tab_bar_bloc.dart';

class AuthTabBarWidget extends StatefulWidget {
  const AuthTabBarWidget({super.key});

  @override
  State<AuthTabBarWidget> createState() => _AuthTabBarWidgetState();
}

class _AuthTabBarWidgetState extends State<AuthTabBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // resizeToAvoidBottomInset: false,
      body: myBody(),
    );
  }
/* -------------------------------------------------------------------------- */
/*                             //! Body Structure                             */
/* -------------------------------------------------------------------------- */

  myBody() {
    return SafeArea(child: interactionCard());
  }

  interactionCard() {
    var dimVar = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          myNewHeader(),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 2),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Column(children: [
                SizedBox(height: dimVar.height * 0.15),
                myFormButtonStates(),
                const SizedBox(height: 20),
                myForm_STATES(),

/* -------------------------------------------------------------------------- */
/*                  //@ auth session listener                                 */
/* -------------------------------------------------------------------------- */
                // authSessionStates()
                // AuthSessionManagerWidget(
                //   onStored: () async {
                //     debugPrint('auth session from login screen triggered');
                //     // SnackBarWidget(context, 'Logged in successfully');
                //     return await pushToHome();
                //   },
                // )
              ]),
            ),
          ),
        ],
      ),
    );
  }

  // authSessionStates() {
  //   return BlocListener<AuthSessionManagerBloc, AuthSessionManagerState>(
  //     listener: (context, state) {
  //       if (state is UserSessionStoredState) {
  //         // pushReplaceToSplash();
  //         SnackBarWidget(context, 'Logged in successfully');
  //         pushToHome();
  //       }
  //     },
  //     child: Container(),
  //   );
  // }

  // pushToHome() {
  //   Navigator.push(context, MaterialPageRoute(builder: (context) {
  //     return const Home();
  //   }));
  // }

/* -------------------------------------------------------------------------- */
/*                              //! body widgets                              */
/* -------------------------------------------------------------------------- */

  myButtons(state) {
    var dimVar =
        MediaQuery.of(context).size; //declare only this line in build()

    return Padding(
      padding: const EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 1,
              child: GestureDetector(
                onTap: () => registerSwitchFunc(),
                child: SizedBox(
                  // width: dimVar.width * 0.4,
                  // width: double. * 0.5,

                  height: dimVar.height * 0.05,
                  child: Container(
                    color: (state is SwitchedToRegister_State) ||
                            (state is AuthTabBarInitial)
                        ? Colors.pink
                        : Colors.white,
                    child: const Center(
                      child: Text(
                        'Register',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: GestureDetector(
                onTap: () => loginSwitchFunc(),
                child: SizedBox(
                  // width: double.infinity * 0.5,
                  // width: dimVar.width * 0.4,

                  height: dimVar.height * 0.05,
                  child: Container(
                    // width: double.infinity,

                    color: (state is SwitchedToLogin_State)
                        ? Colors.pink
                        : Colors.white,
                    child: const Center(
                      child: Text(
                        'Login',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

/* -------------------------------------------------------------------------- */
/*                             //! Static Widgets                             */
/* -------------------------------------------------------------------------- */

  bgDesign() {
    var dimVar = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          height: dimVar.height * 0.4,
          // color: Colors.pink,
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.red,
            Colors.pink,
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        ),
      ],
    );
  }

  proceedAsUserText() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        'Getting started',
        // maxLines: 2,
        // overflow: TextOverflow.ellipsis,
        // textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.pink[900],
          // decoration: TextDecoration.none,
          // fontStyle: FontStyle.italic,
          // fontFamily: "FontNameHere" ,
          fontWeight: FontWeight.bold,
          // fontWeight: FontWeight.w300,
          fontSize: 22.0,
        ),
      ),
    );
  }

  myNewHeader() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0.0,
      // leading: customHeader(),
      // leading: IconButton(
      //     icon: Icon(
      //       Icons.arrow_back,
      //       color: Colors.black,
      //     ),
      //     onPressed: () {
      //       Navigator.pop(context);
      //     }),
      // automaticallyImplyLeading: true, //removes default back arrow on appbar

      title: proceedAsUserText(),
      // actions: [

      //   Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: IconButton(
      //         onPressed: null,
      //         icon: Icon(
      //           Icons.mail,
      //           color: Colors.black,
      //         )),
      //   )
      // ],
    );
  }

/* -------------------------------------------------------------------------- */
/*                                 //@ STATES                                 */
/* -------------------------------------------------------------------------- */

  myForm_STATES() {
    return BlocBuilder<AuthTabBarBloc, AuthTabBarState>(
      builder: (context, state) {
        if (state is SwitchedToLogin_State)
          return LoginScreen();
        else if (state is SwitchedToRegister_State) return RegisterScreen();
        return RegisterScreen();
      },
    );
  }

/* -------------------------------------------------------------------------- */
/*                         // @ Switch button states                          */
/* -------------------------------------------------------------------------- */

  myFormButtonStates() {
    return BlocBuilder<AuthTabBarBloc, AuthTabBarState>(
      builder: (context, state) {
        return myButtons(state);
      },
    );
  }

/* -------------------------------------------------------------------------- */
/*                             //@ FUNCTIONALITIES                            */
/* -------------------------------------------------------------------------- */

  loginSwitchFunc() {
    BlocProvider.of<AuthTabBarBloc>(context).add(SwitchToLogin_Event());
  }

  registerSwitchFunc() {
    {
      BlocProvider.of<AuthTabBarBloc>(context).add(SwitchToRegister_Event());
    }
  }
}
