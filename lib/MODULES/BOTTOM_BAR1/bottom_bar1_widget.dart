import 'package:flutter5/MODULES/BOTTOM_BAR1/bottom_bar1_logic/bottom_bar1_bloc.dart';
import 'package:flutter5/MODULES/HOME/home_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../CREATE_POST/create_post_screen.dart';
import '../PROFILE/profile_screen.dart';

class Bottombar1Widget extends StatefulWidget {
  const Bottombar1Widget({super.key});

  @override
  State<Bottombar1Widget> createState() => _Bottombar1WidgetState();
}

class _Bottombar1WidgetState extends State<Bottombar1Widget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: myBody(),
    );
  }

  myBody() {
    return Center(
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [whichTabStates(), customBottombarDesign()],
      ),
    );
  }

  customBottombarDesign() {
    var dimVar = MediaQuery.of(context).size;

    return SizedBox(
        height: dimVar.height * 0.07,
        child: Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(8),
              // borderRadius: BorderRadius.only(
              //     topLeft: Radius.circular(20),
              //     topRight: Radius.circular(20)),
              gradient: LinearGradient(colors: [
                // Colors.deepPurple,
                // Colors.deepPurpleAccent,
                // Color.fromARGB(255, 0, 27, 68),
                // Color.fromARGB(255, 8, 0, 124),
                Colors.white,
                Colors.white,
              ], end: Alignment.topCenter, begin: Alignment.bottomCenter)),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FittedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      icon: homeIconStates(),
                      onPressed: () {
                        BlocProvider.of<BottomBar1Bloc>(context)
                            .add(BottomBar1_OneCLicked_Event());
                      },
                    ),
                  ),
                ),
                VerticalDivider(
                  width: 40,
                  color: Colors.white,
                ),
                FittedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      icon: createPost_States(),
                      onPressed: () {
                        BlocProvider.of<BottomBar1Bloc>(context)
                            .add(BottomBar1_TwoCLicked_Event());
                      },
                    ),
                  ),
                ),
                VerticalDivider(
                  color: Colors.white,
                  width: 40,
                ),
                FittedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      icon: profileIconStates(),
                      onPressed: () {
                        BlocProvider.of<BottomBar1Bloc>(context)
                            .add(BottomBar1_ThreeCLicked_Event());
                      },
                    ),
                  ),
                ),
              ]),
        ));
  }

//   customBottombarDesign() {
//     var dimVar = MediaQuery.of(context).size;

// //height : dimVar.height*0.5    //to access height
// //width : dimVar.width*0.5       //acces width
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(12.0, 0, 12.0, 1),
//       child: SizedBox(
//           height: dimVar.height * 0.07,
//           child: Container(
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8),
//                 // borderRadius: BorderRadius.only(
//                 //     topLeft: Radius.circular(20),
//                 //     topRight: Radius.circular(20)),
//                 gradient: LinearGradient(colors: [
//                   // Colors.deepPurple,
//                   // Colors.deepPurpleAccent,
//                   // Color.fromARGB(255, 0, 27, 68),
//                   // Color.fromARGB(255, 8, 0, 124),

//                   Color.fromARGB(255, 6, 1, 92),
//                   Color.fromARGB(255, 0, 16, 39),
//                 ], end: Alignment.topCenter, begin: Alignment.bottomCenter)),
//             child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   FittedBox(
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: IconButton(
//                         icon: homeIconStates(),
//                         onPressed: () {
//                           BlocProvider.of<BottomBar1Bloc>(context)
//                               .add(BottomBar1_OneCLicked_Event());
//                         },
//                       ),
//                     ),
//                   ),
//                   VerticalDivider(
//                     width: 40,
//                   ),
//                   FittedBox(
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: IconButton(
//                         icon: createPost_States(),
//                         onPressed: () {
//                           BlocProvider.of<BottomBar1Bloc>(context)
//                               .add(BottomBar1_TwoCLicked_Event());
//                         },
//                       ),
//                     ),
//                   ),
//                   VerticalDivider(
//                     width: 40,
//                   ),
//                   FittedBox(
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: IconButton(
//                         icon: profileIconStates(),
//                         onPressed: () {
//                           BlocProvider.of<BottomBar1Bloc>(context)
//                               .add(BottomBar1_ThreeCLicked_Event());
//                         },
//                       ),
//                     ),
//                   ),
//                 ]),
//           )),
//     );
//   }

  homeIconStates() {
    return BlocBuilder<BottomBar1Bloc, BottomBar1State>(
        builder: (context, state) {
      if (state is BottomBar1_openOne_State) {
        return Icon(
          Icons.home,
          color: Colors.blue[900],
        );
      } else if (state is BottomBar1_openTwo_State) {
        return Icon(
          Icons.home_outlined,
          color: Colors.grey,
        );
      } else if (state is BottomBar1_openThree_State) {
        return Icon(
          Icons.home_outlined,
          color: Colors.grey,
        );
      }
      return Icon(
        Icons.home,
        color: Colors.blue[900],
      );
    });
  }

  createPost_States() {
    return BlocBuilder<BottomBar1Bloc, BottomBar1State>(
        builder: (context, state) {
      if (state is BottomBar1_openOne_State) {
        return Icon(
          Icons.edit_outlined,
          color: Colors.grey,
        );
      } else if (state is BottomBar1_openTwo_State) {
        return Icon(
          Icons.edit,
          color: Colors.blue[900],
        );
      } else if (state is BottomBar1_openThree_State) {
        return Icon(
          Icons.edit_outlined,
          color: Colors.grey,
        );
      }
      return Icon(
        Icons.edit_outlined,
        color: Colors.grey,
      );
    });
  }

  profileIconStates() {
    return BlocBuilder<BottomBar1Bloc, BottomBar1State>(
        builder: (context, state) {
      if (state is BottomBar1_openOne_State) {
        return Icon(
          Icons.person_outline,
          color: Colors.grey,
        );
      } else if (state is BottomBar1_openTwo_State) {
        return Icon(
          Icons.person_outline,
          color: Colors.grey,
        );
      } else if (state is BottomBar1_openThree_State) {
        return Icon(
          Icons.person,
          color: Colors.blue[900],
        );
      }
      return Icon(
        Icons.person_outline,
        color: Colors.grey,
      );
    });
  }

  whichTabStates() {
    return BlocBuilder<BottomBar1Bloc, BottomBar1State>(
        builder: (context, state) {
      if (state is BottomBar1_openOne_State) {
        return Home(); // first tab screen
      } else if (state is BottomBar1_openTwo_State) {
        return CreatePostScreen(); //second tab screen
      } else if (state is BottomBar1_openThree_State) {
        return ProfileScreen(); //second tab screen
      }

      // initial Screen here
      return Home();
    });
  }

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

      title: Text(
        'Home', //give here appBar title
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
}
