import 'dart:developer';

import 'package:card_app/constants/ApiConstants.dart';
import 'package:card_app/models/ApiResponse.dart';
import 'package:card_app/models/HcGroupModel.dart';
import 'package:card_app/services/ApiService.dart';


class HcGroupsService {
  ApiService apiService = ApiService();

  Future<List<HcGroup>> getHcGroups() async {
    List<HcGroup> hcGroupsList = [];
    try {
      ApiResponse response =
          await apiService.get(API.baseURL);

      // Checking if the response contains data and parse it
      for (var item in response.hcGroups) {
        hcGroupsList.add(item);
      }
    } catch (e) {
      log(e.toString());
    }
    return hcGroupsList;
  }
}
