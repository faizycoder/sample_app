import 'package:flutter/cupertino.dart';
import 'package:sample_app/model/data_model.dart';

import '../API/api.dart';

class MostPopularProvider extends ChangeNotifier {
  List<Results>? results = [];
  BuildContext? context;

  initProvider(BuildContext context) {
    this.context = context;
    getMostPopularData();
  }

  getMostPopularData() {
    API.getMostPopularDataApi().then((response) {
      results = response.results;
      notifyListeners();
    });
  }
}
