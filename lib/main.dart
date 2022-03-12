import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:homepage_app/Movies.dart';
import 'Movies.dart';
import 'Music.dart';
import 'Shows.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
   home: HomeScreen(),
  ));

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  fetchMovies()async{
    var url;
    url=  await http.get(Uri.parse("http://www.omdbapi.com/?i=tt3896198&apikey=18089b9e&s=Movies"));
    return json.decode(url.body["results"]);
  }

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex=0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.black87,
      body:SafeArea(
      child: Column(
      children: <Widget>[
        Row(
          children:<Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:28, vertical:21 ),
              child: CircleAvatar(
                radius:26.0,
                backgroundImage: AssetImage('images/Amity.png'),

              ),
            ),

            Text(
              'Amity Blight',
              textAlign: TextAlign.right,

              style: TextStyle(
                  color:Colors.white,
                  fontSize: 18.0),
            ),
            SizedBox(
                width:60.0
            ),
            InkWell(
              child: Container(
                child:ElevatedButton.icon(
                  onPressed:(){

                }, icon: Icon(Icons.search,
                  color:Colors.grey,
                ), label:Text('Search'),
                  style:ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.grey.shade900),)

              ),
            ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder:(context)=>Movies()));
            }, child: Text('Movies'),
            style:ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.red),
            ),
            ),


            SizedBox(
                width:10.0
            ),

            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder:(context)=>Shows()));
            }, child: Text('Shows'),
                style:ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),),
            ),

            SizedBox(
                width:13.0
            ),

            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder:(context)=>Music()));

            }, child: Text('Music'),
               style:ButtonStyle(
               backgroundColor: MaterialStateProperty.all(Colors.red),
            ),
            )

          ],
    ),

           ListView(

              children: [
                Container(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Image.asset('images/Amity.png'),
                      SizedBox(
                        width:20,
                      ),
                      Image.asset('images/Amity.png'),
                      SizedBox(
                        width:20,
                      ),
                      Image.asset('images/Amity.png'),
                      SizedBox(
                        width:20,
                      ),
                      Image.asset('images/Amity.png'),
                      SizedBox(
                        width:20,
                      ),
                      Image.asset('images/Amity.png'),

                    ],
                  ),
                ),


              ],)







        ],
        ),














      ),
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(
            canvasColor: Colors.grey.shade900,
            primaryColor: Colors.red,
            textTheme: Theme
                .of(context)
                .textTheme
                .copyWith(caption: new TextStyle(color: Colors.yellow))),
        child: new BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index)=> setState(() => currentIndex= index),
          backgroundColor: Colors.black12,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.redAccent,
          showSelectedLabels:false,
          showUnselectedLabels: false,

          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
                label:'homepage'
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.star),
                label:'your fav'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark),
              label: 'Your list'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
                label:'menubar',

            ),

          ],

        ),
      ),

    );

}
}



