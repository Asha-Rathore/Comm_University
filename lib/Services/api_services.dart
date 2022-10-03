import 'package:communiversity/App_Widgets/custom_snackbar.dart';
import 'package:communiversity/App_Widgets/loader.dart';
import 'package:communiversity/Services/connectivity_manager.dart';
import 'package:communiversity/Utils/network_strings.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class ApiService {
  //------------------Making Client for Http Request----------------------
  static final client = http.Client();
  //-----------------------------API URL----------------------------------
  static Uri _buildUrl(String endpoint) {
    final apiPath = NetworkStrings.apiBaseUrl + endpoint;
    return Uri.parse(apiPath);
  }
  //-------------------------Post Api Function----------------------------
  static Future<http.Response?> post(
      String endpoint, var body, bool header) async {
    showLoading();
    //-----------------InterNet Connectivity Check------------------------
    ConnectivityManager connectivityManager = ConnectivityManager();
    if (await connectivityManager.isInternetConnected() == true) {
      //----------------------With Bearer Token---------------------------
      if (header == true) {
        final box = GetStorage();
        var token = box.read("token");
        var response = await client.post(_buildUrl(endpoint),
            body: body, headers: {"Authorization": 'Bearer $token'});
        stopLoading();
        return response;
      } else {
        //-------------------WithOut Bearer Token-------------------------
        var response = await client.post(_buildUrl(endpoint), body: body);
        stopLoading();
        return response;
      }
    } else {
      stopLoading();
      CustomSnackBar("NO_INTERNET_CONNECTION");
      return null;
    }
  }
  //-------------------------Get Api Function----------------------------
  static Future<http.Response?> get(String endpoint, bool header) async {
    showLoading();
    //-----------------InterNet Connectivity Check------------------------
    ConnectivityManager connectivityManager = ConnectivityManager();
    if (await connectivityManager.isInternetConnected() == true) {
      //----------------------With Bearer Token---------------------------
      if (header == true) {
        final box = GetStorage();
        var token = box.read("token");
        var response = await client.get(_buildUrl(endpoint),
            headers: {"Authorization": 'Bearer $token'});
        stopLoading();
        return response;
      } else {
        //-------------------WithOut Bearer Token-------------------------
        var response = await client.get(_buildUrl(endpoint));
        stopLoading();
        return response;
      }
    } else {
      stopLoading();
      CustomSnackBar("NO_INTERNET_CONNECTION");
      return null;
    }
  }
  //-------------------------Put Api Function----------------------------
  static Future<http.Response?> put(
      String endpoint, var body, bool header) async {
    showLoading();
    //-----------------InterNet Connectivity Check------------------------
    ConnectivityManager connectivityManager = ConnectivityManager();
    if (await connectivityManager.isInternetConnected() == true) {
      //----------------------With Bearer Token---------------------------
      if (header == true) {
        final box = GetStorage();
        var token = box.read("token");
        var response = await client.put(_buildUrl(endpoint),
            body: body, headers: {"Authorization": 'Bearer $token'});
        stopLoading();
        return response;
      } else {
        //-------------------WithOut Bearer Token-------------------------
        var response = await client.put(_buildUrl(endpoint), body: body);
        stopLoading();
        return response;
      }
    } else {
      stopLoading();
      CustomSnackBar("NO_INTERNET_CONNECTION");
      return null;
    }
  }
}