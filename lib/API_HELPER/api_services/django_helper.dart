import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../CONSTANTS/api_endpoints/django_api_endpoints.dart';

class DjangoHelper {
  //

  static final http.Client _client = http.Client();
/* -------------------------------------------------------------------------- */
/*                           //! making it singleton                          */
/* -------------------------------------------------------------------------- */

  /// private constructor
  DjangoHelper._();

  /// the one and only instance of this singleton
  static final instance = DjangoHelper._();

/* -------------------------------------------------------------------------- */
/*                                 //! Create                                 */
/* -------------------------------------------------------------------------- */

  add(url, model) async {
    try {
      http.Response myResponse =
          await _client.post(Uri.parse(url), body: model.toJson(), headers: {
        'authorization': DjangoEndpoints.basicAuth,
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      }).timeout(
        const Duration(seconds: 35),
      );

      return json.decode(myResponse.body);
    } catch (e) {
      print('not added to api =>  $e');
    }
  }

  rawAdd(url, toAdd) async {
    try {
      http.Response myResponse = await _client
          .post(Uri.parse(url), body: json.encode(toAdd), headers: {
        'authorization': DjangoEndpoints.basicAuth,
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      }).timeout(
        const Duration(seconds: 35),
      );

      return json.decode(myResponse.body);
    } catch (e) {
      print('not added to api =>  $e');
    }
  }

/* -------------------------------------------------------------------------- */
/*                                 //! Update                                 */
/* -------------------------------------------------------------------------- */

  update(url, model, jsonPk) async {
    try {
      http.Response myResponse = await _client.put(
          Uri.parse(url + jsonPk.toString() + "/"),
          body: model.toJson(),
          headers: {
            'authorization': DjangoEndpoints.basicAuth,
            'Content-Type': 'application/json',
            'Accept': 'application/json'
          }).timeout(
        const Duration(seconds: 35),
      );

      return json.decode(myResponse.body);
    } catch (e) {
      print('not updated to api $e');
    }
  }

/* -------------------------------------------------------------------------- */
/*                                 //! Delete                                 */
/* -------------------------------------------------------------------------- */
  delete(url, jsonPk) async {
    try {
      var myResponse = await _client
          .delete(Uri.parse(url + jsonPk.toString() + "/"), headers: {
        'authorization': DjangoEndpoints.basicAuth,
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      }).timeout(
        const Duration(seconds: 35),
      );

      return json.decode(myResponse.body);
    } catch (e) {
      print('Not deleted from api ==> $e');
    }
  }
/* -------------------------------------------------------------------------- */
/*                                //! Fetch all                               */
/* -------------------------------------------------------------------------- */

  Future fetchAll({
    required url,
    required int pageNum,
    int pageSize = 15,
  }) async {
    try {
      http.Response myResponse = await _client.get(
          Uri.parse(url + '?pagesize=$pageSize&pagenum=$pageNum'),
          headers: {
            'authorization': DjangoEndpoints.basicAuth,
            'Content-Type': 'application/json',
            'Accept': 'application/json'
          }).timeout(
        const Duration(seconds: 35),
      );

      return json.decode(myResponse.body);
    } catch (e) {
      print('not fetched  ==> $e');
    }
  }

/* -------------------------------------------------------------------------- */
/*                              //! Fetch by prop                             */
/* -------------------------------------------------------------------------- */

  // pass search String like &isAdmin=true in customSearch
  filterFetch({
    required url,
    required int pageNum,
    required String customSearch,
    int pageSize = 15,
  }) async {
    try {
      http.Response myResponse = await _client.get(
          Uri.parse(
              url + '?pagesize=$pageSize&pagenum=$pageNum' + customSearch),
          headers: {
            'authorization': DjangoEndpoints.basicAuth,
            'Content-Type': 'application/json',
            'Accept': 'application/json'
          }).timeout(
        const Duration(seconds: 35),
        //      onTimeout: () {

        //   // return http.Response('Error', 408);
        //   // throw TimeoutException('Timed out');
        // }
      );

      return json.decode(myResponse.body);
    } on TimeoutException {
      print('this should not be reached if the exception is raised');
    } catch (e) {
      print('not fetched  ==> $e');
    }
  }

/* -------------------------------------------------------------------------- */
/*                               //! Fetch by id                              */
/* -------------------------------------------------------------------------- */

  singleFetch(url, jsonPk) async {
    try {
      http.Response myResponse = await _client.get(
        Uri.parse(url + jsonPk.toString() + "/"),
        headers: {
          'authorization': DjangoEndpoints.basicAuth,
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
      ).timeout(
        const Duration(seconds: 35),
      );

      return json.decode(myResponse.body);
    } catch (e) {
      print('not fetched  ==> $e');
    }
  }
}
