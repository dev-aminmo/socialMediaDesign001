import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Screens extends StatelessWidget {
  Screens(this.color);
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      height: 400,
      width: double.infinity,
    );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Design 001',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  List<Widget> children = [
    Screens(Colors.redAccent),
    Screens(Colors.blue),
    Container(),
    Screens(Colors.tealAccent),
    Screens(Colors.amber)
  ];

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: children[_currentIndex],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        width: 58,
        height: 58,
        child: FloatingActionButton(
          backgroundColor: Color(0xff6533f8),
          onPressed: () {},
          child: Icon(
            Icons.dashboard,
            size: 28,
          ),
        ),
      ),

      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 4,
        clipBehavior: Clip.antiAlias,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16),
            topLeft: Radius.circular(16),
          ),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            selectedFontSize: 0,
            unselectedFontSize: 0,
            unselectedItemColor: Color(0xffcacaca),
            fixedColor: Color.fromRGBO(103, 49, 248, 1),
            type: BottomNavigationBarType.fixed,
            backgroundColor: Color(0xff1f1f1f),
            onTap: _selectItem,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text(""),
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), title: Text("")),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.bookmark,
                    size: 0,
                    color: Colors.transparent,
                  ),
                  title: Text('')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.bookmark), title: Text("")),
              BottomNavigationBarItem(
                  icon: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.asset(
                      'assets/profile.jpg',
                      height: 35,
                      width: 35,
                    ),
                  ),
                  title: Text("")),
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _selectItem(int value) {
    setState(() {
      _currentIndex = value;
    });
  }
}
