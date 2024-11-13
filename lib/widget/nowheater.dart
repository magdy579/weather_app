import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoWeather extends StatelessWidget {
  const NoWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
       child: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("No weather ",
                   style: TextStyle(
                     fontSize: 24,
                   ),
                )  ,
                Text("Searching Now 🔍",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ],
              
         ),
       ),
      );
  }
}
