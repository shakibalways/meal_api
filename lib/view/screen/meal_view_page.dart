import 'dart:async';

import 'package:flutter/material.dart';
import 'package:meal_cetagories/controller/api_call/meal_api.dart';
import 'package:meal_cetagories/model/meal_service_model/meal_menu_list.dart';

class MealViewPage extends StatefulWidget {
  const MealViewPage({super.key});

  @override
  State<MealViewPage> createState() => _MealViewPageState();
}

class _MealViewPageState extends State<MealViewPage> {
  List<Meals> data = [];
  getData() async {
    data = await MealService.mealService();
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API"),
      ),
      body: data.isNotEmpty
          ? ListView.builder(
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    height: 270,
                   decoration: BoxDecoration(
                     color: Colors.grey,
                     borderRadius: BorderRadius.circular(10)
                   ),
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          width: double.infinity,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              data[index].strMealThumb.toString(),
                              width: 200,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text(
                           "Meal:${data[index].strMeal.toString()}",
                             style: TextStyle(
                                 fontWeight: FontWeight.bold,
                                 fontSize: 16,
                                 color: Colors.white),
                           ),
                           Text("Id:${data[index].idMeal.toString()}",
                             style: TextStyle(
                                 fontWeight: FontWeight.bold,
                                 fontSize: 16,
                                 color: Colors.white),),
                         ],
                       )
                      ],
                    ),
                  ),
                );
              })
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
