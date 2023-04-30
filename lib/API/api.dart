import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../app_constants/app_constants.dart';
import '../model/data_model.dart';

class API {
  static Future<MostPopularDataResponse> getMostPopularDataApi() {
    Completer<MostPopularDataResponse> completer = Completer();
    var url =
        'http://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=${AppConstant.apiKey}';
    http.get(Uri.parse(url)).then((response) async {
      MostPopularDataResponse mostPopularDataResponse =
          MostPopularDataResponse.fromJson(jsonDecode(response.body));
      completer.complete(mostPopularDataResponse);
    }).onError((error, stackTrace) {});
    return completer.future;
  }
}
