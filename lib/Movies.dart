import 'package:flutter/material.dart';
import 'main.dart';


class Movies extends StatelessWidget {
  const Movies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Colors.black87,
        appBar:AppBar(
          backgroundColor: Colors.redAccent,
          title:Text('Movies'),),
          body:Center(
            child: Text('Movies Page',
              style:TextStyle(color:Colors.red,
                  fontSize:33.0),),),
            );

  }
}
