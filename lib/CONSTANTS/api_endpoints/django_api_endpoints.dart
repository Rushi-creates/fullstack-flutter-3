import 'dart:convert';

class DjangoEndpoints {
/* -------------------------------------------------------------------------- */
/*                   //! Basic authentication credentials :                   */
/* -------------------------------------------------------------------------- */

  static const String _basicAuthUsername = 'rushi.creates';
  static const String _basicAuthPassword = 'fs@123***';

  static String basicAuth =
      'Basic ${base64Encode(utf8.encode('$_basicAuthUsername:$_basicAuthPassword'))}';

  // String basicAuth = 'Basic ' +
  //     base64Encode(utf8.encode('$_basicAuthUsername:$_basicAuthPassword'));
/* -------------------------------------------------------------------------- */
/*                                 //! Domain                                 */
/* -------------------------------------------------------------------------- */

  static const String domainUrl =
      'https://fullstack5-production.up.railway.app/';
  // 'https://bizcon3-production-644e.up.railway.app/';

  // 'https://bizcon3-production.up.railway.app/';
  // 'https://instinctive-dress-production.up.railway.app/';

/* -------------------------------------------------------------------------- */
/*                                //! Endpoints                               */
/* -------------------------------------------------------------------------- */

//@ notify next 5th queueuser by email (for his turn)
  static String notifyQu_byEmail = domainUrl + 'notifyUpcomingUserByEmail/';

//@ Super admin
  static String checkSuperAdmin = domainUrl + 'sa/checkSuperAdmin/';

//@ UserAcc
  static const String userAcc_getAll = domainUrl + 'userAcc/';
  static const String userAcc_register = domainUrl + 'userAcc/register/';
  static const String userAcc_resetAccount =
      domainUrl + 'userAcc/resetAccount/';
  static const String userAcc_delete = domainUrl + 'userAcc/delete/';

  static const String userAcc_login = domainUrl + 'userAcc/login_userAcc/';
  static const String userAcc_forgotPass =
      domainUrl + 'userAcc/forgotPasword_userAcc/';
  static const String userAcc_verify_userEmail_beforeRegister =
      domainUrl + 'userAcc/verify_userEmail_beforeRegister/';

  static const String userAccNoOtpRegister =
      domainUrl + 'userAcc/no_otp_register/';

//@ Profile

  static const String profile_getAll = domainUrl + 'profile/';
  static const String profile_add = domainUrl + 'profile/add/';
  static const String profile_update = domainUrl + 'profile/update/';
  static const String profile_delete = domainUrl + 'profile/delete/';

  static const String profile_isExists = domainUrl + 'profile/doesExists/';
}
