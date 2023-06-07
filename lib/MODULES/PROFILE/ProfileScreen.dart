import '../../SERIALIZERS/models/profile.dart';
import '../../SERIALIZERS/repositories/profile_repo.dart';
import '/MODULES/CREATE_PROFILE/CreateProfileScreen.dart';
import '/MODULES/SETTINGS_SCREEN/Settings_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
    return SafeArea(
        child: Container(
            child: Column(
      children: [
        displayProfileDetailsCard(),
        // SizedBox(height: 2),
        editProfileButton()
      ],
    )));
  }

  displayProfileDetailsCard() {
    // UserAcc user =  User_sp_repo.get_user()!;
    Profile profile = ProfileSpRepo.instance.get_profile()!;
    return Padding(
      // padding: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
      child: SizedBox(
        width: double.infinity,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 45, 0, 53),
                Color.fromARGB(255, 102, 0, 161),
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  displayProfileText('Username : ${profile.username}'),
                  displayProfileText('Bio : ${profile.bio}'),
                  displayProfileText('Role : ${profile.role}'),
                  displayProfileText(
                      'Qualifications : ${profile.qualifications}'),
                  displayProfileText('Skills : ${profile.skills}'),
                ]),
          ),
        ),
      ),
    );
  }

  editProfileButton() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
            gradient: const LinearGradient(colors: [
              // Color.fromARGB(255, 45, 0, 53),
              // Color.fromARGB(255, 102, 0, 161),
              Color.fromARGB(255, 212, 93, 1),
              Color.fromARGB(255, 255, 111, 0),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: TextButton(
          onPressed: () {
            // Add your onPressed function here
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const CreateProfileScreen.fromProfileScreen(
                isFromProfileScreen: true,
              );
            }));
          },
          style: TextButton.styleFrom(
            // backgroundColor: Color.fromARGB(255, 233, 101, 0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12),
          ),
          child: Text(
            'Edit Profile',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  displayProfileText(text) {
    return Padding(
      padding: const EdgeInsets.all(6),
      // padding: const EdgeInsets.only(left: 20, bottom: 2, top: 2),
      child: Text(
        text,
        // maxLines: 2,
        // overflow: TextOverflow.ellipsis,
        // textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          // decoration: TextDecoration.none,
          // fontStyle: FontStyle.italic,
          // fontFamily: "FontNameHere" ,
          fontWeight: FontWeight.bold,
          // fontWeight: FontWeight.w300,
          fontSize: 14.0,
        ),
      ),
    );
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
        'Profile', //give here appBar title
        style: TextStyle(color: Colors.black
            // fontWeight: FontWeight.bold
            // fontSize: 15,
            ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SettingScreen();
                }));
              },
              icon: Icon(
                Icons.settings,
                color: Colors.black,
              )),
        )
      ],
    );
  }
}
