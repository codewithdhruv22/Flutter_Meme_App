import 'package:flutter/material.dart';

class splashScreen extends StatelessWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            width : MediaQuery.of(context).size.width,
              height : 300,
              "https://raw.githubusercontent.com/codewithdhruv22/CodeWithDhruv/main/applogo.png"),
          SizedBox(height: 30,),
        Text("UnSad App" , style: TextStyle(fontSize: 35 , fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}
