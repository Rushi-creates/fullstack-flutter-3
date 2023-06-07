import 'package:flutter5/MODULES/AUTH/sp_user/sp_user_logic/sp_user_bloc.dart';
import 'package:flutter5/MODULES/bottom_bar1/bottom_bar1_widget.dart';

import '../../auth_tab_bar/auth_tab_bar_widget.dart';
import '/MODULES/CREATE_PROFILE/CreateProfileScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpUserWidget extends StatefulWidget {
  final bool isStartUp;

  const SpUserWidget({super.key, this.isStartUp = false});

  @override
  State<SpUserWidget> createState() => _SpUserWidgetState();
}

class _SpUserWidgetState extends State<SpUserWidget> {
  @override
  void initState() {
    super.initState();

    blocFunc();
  }

  blocFunc() {
    Future.delayed(Duration(milliseconds: widget.isStartUp ? 2000 : 0), () {
      BlocProvider.of<SpUserBloc>(context).add(CheckSpEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.isStartUp
          ? const Color.fromARGB(255, 14, 0, 143)
          : Colors.white,
      body: myStates(),
    );
  }

  myStates() {
    return BlocListener<SpUserBloc, SpUserState>(
      listener: (context, state) {
        if (state is SpErrorState) {
          debugPrint('error while loading sp');
        } else if (state is UserAndProfileInSpState) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return const Bottombar1Widget();
          }));
        } else if (state is EmptyProfileSpState) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return const CreateProfileScreen();
          }));
        } else if (state is EmptySpState) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return const AuthTabBarWidget();
          }));
        }
      },
      child: widget.isStartUp ? newDesignSplashScreenUi() : Container(),
      // child: designSplashScreenUi(),
    );
  }

  newDesignSplashScreenUi() {
    return const Center(
      child: Text(
        "Current Trends",
        // maxLines: 2,
        // overflow: TextOverflow.ellipsis,
        // textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          // decoration: TextDecoration.none,
          // fontStyle: FontStyle.italic,
          // fontFamily: "FontNameHere" ,
          // fontWeight: FontWeight.bold,
          // fontWeight: FontWeight.w300,
          fontSize: 20.0,
        ),
      ),
    );
  }
}
