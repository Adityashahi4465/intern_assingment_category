import 'package:flutter/material.dart';

import '../model/catagory.dart';

class ScreenC extends StatelessWidget {
  final Category category;

  const ScreenC(this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(category.name),
      ),
      body: const Center(
        child: Text("No more child categories available"),
      ),
    );
  }
}
