import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        canvasColor: Colors.grey.shade900,
        primaryColor: Colors.red,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  fetchMovies() async {
    final response = await http.get(Uri.parse(
        "http://www.omdbapi.com/?i=tt3896198&apikey=18089b9e&s=Movies"));
    return json.decode(response.body)["results"];
  }

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            _TopAppBar(),
            _TopTabBar(),
            _Page(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        backgroundColor: Colors.grey.shade900,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.redAccent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'homepage',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'your fav',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Your list',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'menubar',
          ),
        ],
      ),
    );
  }
}

class _Page extends StatelessWidget {
  const _Page({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          SizedBox(
            height: 150,
            child: _ItemSection(),
          ),
        ],
      ),
    );
  }
}

class _ItemSection extends StatelessWidget {
  const _ItemSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return _Item();
      },
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Hello world'),
        ));
      },
      child: AspectRatio(
        aspectRatio: 1 / 1.6,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: Colors.yellow,
          ),
        ),
      ),
    );
  }
}

class _TopAppBar extends StatelessWidget {
  const _TopAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 21),
          child: CircleAvatar(
            radius: 26.0,
            backgroundImage: AssetImage('images/Amity.png'),
          ),
        ),
        Text(
          'Amity Blight',
          textAlign: TextAlign.right,
          style: TextStyle(color: Colors.white, fontSize: 18.0),
        ),
        Spacer(),
        InkWell(
          child: Container(
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.grey,
              ),
              label: Text('Search'),
              style: ElevatedButton.styleFrom(
                primary: Colors.grey.shade900,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _TopTabBar extends StatelessWidget {
  const _TopTabBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedButtonStyle = ElevatedButton.styleFrom(
      primary: Colors.red,
    );
    final unSelectedButtonStyle = ElevatedButton.styleFrom(
      primary: Colors.grey,
    );
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            //
          },
          child: Text('Movies'),
          style: unSelectedButtonStyle,
        ),
        ElevatedButton(
          onPressed: () {
            //
          },
          child: Text('Shows'),
          style: selectedButtonStyle,
        ),
        ElevatedButton(
          onPressed: () {
            //
          },
          child: Text('Music'),
          style: unSelectedButtonStyle,
        )
      ],
    );
  }
}
