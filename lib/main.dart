import 'package:flutter/material.dart';
import 'package:flutter5/MODULES/AUTH/DELETE_ACCOUNT/delete_account_logic/delete_account_bloc.dart';
import 'package:flutter5/MODULES/AUTH/sp_user/sp_user_logic/sp_user_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'API_HELPER/api_services/shared_preferences_helper.dart';
import 'MODULES/AUTH/LOGIN/logic/cubit/my_login_cubit.dart';
import 'MODULES/AUTH/LOGIN/logic/login_button_logic/login_button_bloc.dart';
import 'MODULES/AUTH/REGISTER/logic/cubit/my_register_cubit.dart';
import 'MODULES/AUTH/REGISTER/logic/register_button_logic/register_button_bloc.dart';
import 'MODULES/AUTH/auth_tab_bar/auth_tab_bar_logic/auth_tab_bar_bloc.dart';
import 'MODULES/AUTH/sp_user/sp_user_logic/sp_user_bloc.dart';
import 'MODULES/BOTTOM_BAR1/bottom_bar1_logic/bottom_bar1_bloc.dart';
import 'MODULES/CREATE_PROFILE/edit_profile_logic/edit_profile_bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:firebase_core/firebase_core.dart';

/* -------------------------------------------------------------------------- */
/*                                  //! main                                  */
/* -------------------------------------------------------------------------- */

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();

  // UserSpRepo.instance.remove_user();
  // ProfileSpRepo.instance.remove_profile();

  runApp(const MyApp());
}

/* -------------------------------------------------------------------------- */
/*                            //! Root widget                                 */
/* -------------------------------------------------------------------------- */

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
/* -------------------------------------------------------------------------- */
/*                             //! Bloc Providers                             */
/* -------------------------------------------------------------------------- */

    return MultiBlocProvider(
      providers: [
        // //@ CUBITS
        BlocProvider<MyRegisterCubit>(create: (context) => MyRegisterCubit()),
        BlocProvider<MyLoginCubit>(create: (context) => MyLoginCubit()),

        //@ BLOCS

        BlocProvider(
          create: (context) => SpUserBloc(),
        ),
        BlocProvider<LoginButtonBloc>(
          create: (context) => LoginButtonBloc(),
        ),
        BlocProvider<RegisterButtonBloc>(
          create: (context) => RegisterButtonBloc(),
        ),
        BlocProvider<AuthTabBarBloc>(
          create: (context) => AuthTabBarBloc(),
        ),
        BlocProvider<SpUserBloc>(
          create: (context) => SpUserBloc(),
        ),

        BlocProvider(
          create: (context) => EditProfileBloc(),
        ),
        BlocProvider(
          create: (context) => BottomBar1Bloc(),
        ),

        BlocProvider(
          create: (context) => DeleteAccountBloc(),
        ),
      ],

/* -------------------------------------------------------------------------- */
/*                              //@ Material app                              */
/* -------------------------------------------------------------------------- */

      child: MaterialApp(
          title: 'Flutter app',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const SpUserWidget(isStartUp: true)),
    );
  }
}
