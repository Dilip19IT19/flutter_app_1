
import 'package:flutter/material.dart';
import 'package:myapp/views/home_view.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "My Flutter",
      
      home:HomeView()
    );
  }
}