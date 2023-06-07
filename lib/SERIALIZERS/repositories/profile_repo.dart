import '../../../API_HELPER/api_services/shared_preferences_helper.dart';
import '../../../CONSTANTS/api_endpoints/django_api_endpoints.dart';
import '../../API_HELPER/api_services/django_helper.dart';
import '../models/profile.dart';

class ProfileRepo {
  //

  //@singleton
  ProfileRepo._();
  static final instance = ProfileRepo._();

/* -------------------------------------------------------------------------- */
/*                                //! Fetch All                               */
/* -------------------------------------------------------------------------- */

  // fetchAll(int counter) async {
  //   var rawData = await DjangoHelper.instance.fetchAll(
  //     url: DjangoEndpoints.someUrl,
  //     pageNum: counter,
  //   );
  //   return Profile.fromMapList(rawData);
  // }

/* -------------------------------------------------------------------------- */
/*                              //! Fetch by Prop                             */
/* -------------------------------------------------------------------------- */

  // fetchProp(int counter) async {
  //   var rawData = await DjangoHelper.instance.filterFetch(
  //     fetchUrl: DjangoEndpoints.someUrl,
  //     pageNum: counter,
  //     customSearch: );

  //   return Profile.fromMapList(rawData);
  // }

/* -------------------------------------------------------------------------- */
/*                               //! Fetch by id                              */
/* -------------------------------------------------------------------------- */
  doesProfileExists(jsonPk) async {
    var rawData = await DjangoHelper.instance
        .singleFetch(DjangoEndpoints.profile_isExists, jsonPk);

    // var decodedJson = json.decode(rawData);
    print(rawData);
    if (rawData == false)
      return false;
    else if (rawData is Map<String, dynamic>) return Profile.fromMap(rawData);
  }

/* -------------------------------------------------------------------------- */
/*                                 //! Create                                 */
/* -------------------------------------------------------------------------- */
  // create(model) async {
  //   var rawData = await DjangoHelper.instance.add(DjangoEndpoints.addApiUrl, model);
  //   return Profile.fromMap(rawData);
  // }

  Future<Profile> add_profile(model) async {
    var rawData =
        await DjangoHelper.instance.add(DjangoEndpoints.profile_add, model);
    print(rawData);
    return Profile.fromMap(rawData);
  }

/* -------------------------------------------------------------------------- */
/*                                 //! Update                                 */
/* -------------------------------------------------------------------------- */
  Future<Profile> update_profile(model, jsonPk) async {
    var rawData = await DjangoHelper.instance
        .update(DjangoEndpoints.profile_update, model, jsonPk);
    return Profile.fromMap(rawData);
  }

/* -------------------------------------------------------------------------- */
/*                                 //! Delete                                 */
/* -------------------------------------------------------------------------- */
  // doesnt return a map, just some string ( so can't use AccountModel.fromJson)
//   delete(jsonPk) asysnc {
//     var rawData = await DjangoHelper.instance.delete(DjangoEndpoints.deleteApiUrl, jsonPk);
//     return rawData; // as api returns string, not a map
//   }
}

/* -------------------------------------------------------------------------- */
/*                          //@ SP Repo class                                 */
/* -------------------------------------------------------------------------- */

//Todo : while using sp , make sure to use await , kw , or it wont work
// CacheHelper.get('UserAcc');
// await CacheHelper.set('UserAcc');
// await CacheHelper.remove('UserAcc');

class ProfileSpRepo {
  //

  //@singleton
  ProfileSpRepo._();
  static final instance = ProfileSpRepo._();

  set_profile(value) async {
    return await CacheHelper.set('profile', value);
  }

  //! do not use await in get
  Profile? get_profile() {
    var jsonMap = CacheHelper.getModel('profile');

    if (jsonMap == null)
      return null;
    else
      return Profile.fromJson(jsonMap);
  }

  remove_profile() async {
    return await CacheHelper.remove('profile');
  }
}
