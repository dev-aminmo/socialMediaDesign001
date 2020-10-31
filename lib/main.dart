import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            ClipPath(
              clipper: Customclip(),
              child: Container(
                height: 200,
                width: 200,
                color: Colors.pink,
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        width: 58,
        height: 58,
        child: FloatingActionButton(
          backgroundColor: Color(0xff6533f8),
          onPressed: _incrementCounter,
          tooltip: 'Increment',
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
                  icon: Icon(Icons.sentiment_satisfied), title: Text("")),
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _selectItem(int value) {
    print(value);
    if (value == 4) {
      return Container(
        height: 300,
        width: 100,
        color: Colors.yellow,
      );
    }
  }
}

class Customclip extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width / 2 - 36, 0);
    path.quadraticBezierTo(
        size.width / 2, size.height * 1.2, size.width / 2 + 36, 0);

    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
