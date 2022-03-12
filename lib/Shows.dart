import 'package:flutter/material.dart';

class Shows extends StatelessWidget {
  const Shows({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title:Text('Show Page'),),

        body:Center(
        child:Text('Shows Page',
         style:TextStyle(color:Colors.red,
          fontSize:33),),
),
);
}}