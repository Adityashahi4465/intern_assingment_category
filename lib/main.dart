import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Screens/screenA.dart';
import 'model/catagory.dart';

List<Category> _categories = <Category>[];

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  Future<String> _loadCategories() async {
    final jsonString = await rootBundle.loadString('assets/data.json');
    // print(jsonString);
    return jsonString;
  }

  Future<List<Category>> loadCategories() async {
    final jsonString = await _loadCategories();
    final jsonResponse = await json.decode(jsonString) as List<dynamic>;
    _categories =
        jsonResponse.map((category) => Category.fromJson(category)).toList();
    return _categories;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: FutureBuilder<List<Category>>(
          future: loadCategories(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              _categories = snapshot.data!;
              return ScreenA(
                categories: _categories,
              );
            } else {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
        ));
  }
}
