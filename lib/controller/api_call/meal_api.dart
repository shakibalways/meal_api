

import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:meal_cetagories/model/meal_service_model/meal_menu_list.dart';


class MealService {
  static Future<List<Meals>> mealService() async {

    try {
      var response = await http.get(
          Uri.parse("https://themealdb.com/api/json/v1/1/filter.php?c=Seafood"));
     if(response.statusCode==200){
       var jsonData = jsonDecode(response.body);
       var data = MealListModel.fromJson(jsonData);
       return data.meals ?? [];
     }

    } catch (e) {
      log("Error: $e");
    }
    return [];
  }
}
