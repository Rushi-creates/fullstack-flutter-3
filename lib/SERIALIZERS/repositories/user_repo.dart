import '../../API_HELPER/api_services/django_helper.dart';
import '../../API_HELPER/api_services/shared_preferences_helper.dart';
import '../../CONSTANTS/api_endpoints/django_api_endpoints.dart';
import '../models/user.dart';

class UserRepo {
  //

  //@singleton
  UserRepo._();
  static final instance = UserRepo._();

/* -------------------------------------------------------------------------- */
/*                                     //!                                    */
/* -------------------------------------------------------------------------- */
  // create_verifyUserEmail_SendOtp(model) async {
  //   // var rawData = await DjangoHelper.instance.add(
  //   //     DjangoEndpoints.userAcc_verify_userEmail_beforeRegister, model);

  //   // rawData can either have  OTP 1234 ||  String 'Account already exists, try to login'

  //   // return rawData;
  //   return 1234; //TODO : change this static otp later
  // }

/* -------------------------------------------------------------------------- */
/*                          //! register without otp                          */
/* -------------------------------------------------------------------------- */

  createNoOtpRegister(model) async {
    var rawData = await DjangoHelper.instance
        .add(DjangoEndpoints.userAccNoOtpRegister, model);

    // rawData can either have  user json ||  String 'Account already exists, try to login'
    if (rawData is String) {
      return rawData;

      // Single Json map of logged in user
    } else if (rawData is Map<String, dynamic> ||
        rawData is Map<String, List>) {
      User response = User.fromMap(rawData);
      return response;
    }
  }

/* -------------------------------------------------------------------------- */
/*                                  //! Login                                 */
/* -------------------------------------------------------------------------- */

  createLoginUser(model) async {
    // rawData can have 2 values:
    var rawData =
        await DjangoHelper.instance.add(DjangoEndpoints.userAcc_login, model);

    // String - "This account doesn't exist, enter correct details or try to register."
    if (rawData is String) {
      return rawData;

      // Single Json map of logged in user
    } else if (rawData is Map<String, dynamic> ||
        rawData is Map<String, List>) {
      User response = User.fromMap(rawData);
      return response;

      //Todo : do this func , in bloc ( use func , from below)
      // //Storing reponse (User obj) to SP
      // await CacheHelper.set('Current_UserAcc_obj', response);

      // return 1; //Bloc flag = logged in success
    }
  }

/* -------------------------------------------------------------------------- */
/*                         //! Check Otp and Register                         */
/* -------------------------------------------------------------------------- */

  //Todo: make sure to write otp check logic in bloc
  // createUserRegister(model) async {
  //   print(model);
  //   var rawData = await DjangoHelper.instance
  //       .add(DjangoEndpoints.userAcc_register, model);
  //   print(rawData);
  //   print(User.fromMap(rawData));
  //   return User.fromMap(rawData);
  // }

/* -------------------------------------------------------------------------- */
/*                                //! Fetch All                               */
/* -------------------------------------------------------------------------- */
  // fetchAll(int counter) async {
  //   var rawData = await DjangoHelper.instance.fetchAll(
  //       url: DjangoEndpoints.someUrl, pageNum: counter);

  //   return User.fromMapList(rawData);
  // }

/* -------------------------------------------------------------------------- */
/*                              //! Fetch by Prop                             */
/* -------------------------------------------------------------------------- */

  //  filterFetch(int counter) async {
  //   var rawData = await DjangoHelper.instance.filterFetch(
  //     url: DjangoEndpoints.someUrl,
  //     pageNum: counter,
  //     customSearch: ,
  //     );

  //   return User.fromMapList(rawData);
  // }

/* -------------------------------------------------------------------------- */
/*                               //! Fetch by id                              */
/* -------------------------------------------------------------------------- */
  // fetchById(jsonPk) async {
  //   var rawData = await DjangoHelper.instance.singleFetch(DjangoEndpoints.someUrl, jsonPk);

  //   return User.fromMap(rawData);
  // }

/* -------------------------------------------------------------------------- */
/*                                 //! Create                                 */
/* -------------------------------------------------------------------------- */
  // create(model) async {
  //    var rawData = await DjangoHelper.instance.add(DjangoEndpoints.someUrl, model);
  //   return User.fromMap(rawData);
  // }

/* -------------------------------------------------------------------------- */
/*                                 //! Update                                 */
/* -------------------------------------------------------------------------- */
  //  update(model, jsonPk) async {
  //    var rawData =
  //       await DjangoHelper.instance.update(DjangoEndpoints.someUrl, model, jsonPk,);

  //   return User.fromMap(rawData);
  // }

/* -------------------------------------------------------------------------- */
/*                                 //! Delete                                 */
/* -------------------------------------------------------------------------- */
  // as api returns string, not a map. So can't use User.fromJson

  deleteUser_account(jsonPk) async {
    var rawData = await DjangoHelper.instance
        .delete(DjangoEndpoints.userAcc_delete, jsonPk);
    return rawData;
  }
}

/* -------------------------------------------------------------------------- */
/*                          //@ SP Repo class                                 */
/* -------------------------------------------------------------------------- */

class UserSpRepo {
  //

  //@singleton
  UserSpRepo._();
  static final instance = UserSpRepo._();

/* -------------------------------------------------------------------------- */
/*                                     //@                                    */
/* -------------------------------------------------------------------------- */
  set_user(value) async {
    // await SpHelper.sharedPreferences.setString('user', value);
    return await CacheHelper.set('user', value);
  }

  User? get_user() {
    // await not required in getModel
    var jsonMap = CacheHelper.getModel('user');

    if (jsonMap == null)
      return null;
    else
      return User.fromJson(jsonMap);
  }

  remove_user() async {
    return await CacheHelper.remove('user');
  }
}
