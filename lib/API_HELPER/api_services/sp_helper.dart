// import 'package:shared_preferences/shared_preferences.dart';

// class SpHelper {
//   static late SharedPreferences sharedPreferences;

//   static init() async {
//     sharedPreferences = await SharedPreferences.getInstance();
//   }

// /* -------------------------------------------------------------------------- */
// /*                           //! making it singleton                          */
// /* -------------------------------------------------------------------------- */

//   SpHelper._internal() {
//     init();
//   }
//   static final instance = SpHelper._internal();

// /* -------------------------------- //@ Note -------------------------------- */

// // make sure to initialize sp in main.dart's main() function
//   // await SpHelper.init();
// }
