import 'package:flutter/material.dart';
import 'package:flutter5/MODULES/COMMON/auth_session_manager_logic/auth_session_manager_stored_widget.dart';
import 'package:flutter5/MODULES/REGISTER/ui/register_button_widget.dart';
import 'package:flutter5/MODULES/REGISTER/ui/register_textfield_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
/* -------------------------------------------------------------------------- */
/*                               //! Declarations                              */
/* -------------------------------------------------------------------------- */

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
        RegisterTextfieldWidget(),
        RegisterButtonWidget(),

        AuthSessionManagerStoredWidget(), // listener
        // CreateButton_widget<GRegisterButton>(
        //   formKey:
        //       BlocProvider.of<MyRegisterCubit>(context).state.createFormKey,
        //   myAddFunc: () async {
        //     User user = User(
        //       email: BlocProvider.of<MyRegisterCubit>(context)
        //           .state
        //           .emailController
        //           .text,
        //       password: BlocProvider.of<MyRegisterCubit>(context)
        //           .state
        //           .passwordController
        //           .text,
        //       number: int.tryParse(BlocProvider.of<MyRegisterCubit>(context)
        //           .state
        //           .numberController
        //           .text),
        //     );

        //     debugPrint(user.toString());

        //     // if not returned then, repo method will directly be called here
        //     return await UserRepo.instance.createUserRegister(user);
        //   },
        //   onSuccess: () {
        //     debugPrint('onSuccess triggered');
        //     return SnackBarWidget(context, 'From on success',
        //         bgColor: Colors.orange);
        //   },
        // )
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
        'Register', //give here appBar title
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

//
}
