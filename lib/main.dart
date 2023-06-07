import 'package:flutter/material.dart';
import 'package:flutter5/MODULES/COMMON/auth_session_manager_logic/auth_session_manager_bloc.dart';
import 'package:flutter5/MODULES/LOGIN/logic/login_button_logic/login_button_bloc.dart';
import 'package:flutter5/MODULES/Splash_stub/SplashScreen.dart';
// import 'package:flutter5/SERIALIZERS/repositories/profile_repo.dart';
// import 'package:flutter5/SERIALIZERS/repositories/user_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'API_HELPER/api_services/shared_preferences_helper.dart';
import 'MODULES/COMMON/AuthTabBar/AuthTabBarLogic/auth_tab_bar_bloc.dart';
import 'MODULES/CREATE_PROFILE/edit_profile_logic/edit_profile_bloc.dart';
import 'MODULES/LOGIN/logic/cubit/my_login_cubit.dart';
import 'MODULES/My_BottomBar_stub/MyBottomBar_logic/my_bottom_bar_bloc.dart';
import 'MODULES/REGISTER/logic/cubit/my_register_cubit.dart';
import 'MODULES/REGISTER/logic/register_button_logic/register_button_bloc.dart';
import 'MODULES/SETTINGS_SCREEN/UserLod_logic/user_lod_bloc.dart';
import 'MODULES/Splash_stub/Splash_roles_logic/splash_roles_bloc.dart';
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
          create: (context) => SplashRolesBloc(),
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
        BlocProvider<AuthSessionManagerBloc>(
          create: (context) => AuthSessionManagerBloc(),
        ),

        BlocProvider(
          create: (context) => EditProfileBloc(),
        ),
        BlocProvider(
          create: (context) => MyBottomBarBloc(),
        ),

        BlocProvider(
          create: (context) => UserLodBloc(),
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
          home: const SplashScreen()),
    );
  }
}
