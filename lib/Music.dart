import 'package:flutter/material.dart';

class Music extends StatelessWidget {
  const Music({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar:AppBar(
        backgroundColor: Colors.redAccent,
        title:Text('Music page'),
      ),
      body:Center(
      child:Text('Music Page',
        style:TextStyle(color:Colors.red,
            fontSize:33.0),
      ),
      ),
      );
   }
}
