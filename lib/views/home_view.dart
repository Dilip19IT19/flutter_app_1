import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Material(
        child: Container(
          color:Colors.deepOrange,
          child: const Center(child: Text("Hello World I am Dilip Choudhary"
          ,style: TextStyle(
            fontSize: 20,
            color: Color.fromARGB(255, 248, 248, 248),
            fontWeight: FontWeight.bold,
                
          ),)),
        ),
      );
  }
}