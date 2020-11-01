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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
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
    Screen(Color(0xff1f1f1f)),
    Screen(Colors.blue),
    Container(),
    Screen(Colors.tealAccent),
    Screen(Colors.amber)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: children[_currentIndex],
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
        color: Colors.black,
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
    );
  }

  Widget _selectItem(int value) {
    setState(() {
      _currentIndex = value;
    });
  }
}

//This widget contain an appbar and the body of the page
class Screen extends StatelessWidget {
  Screen(this.color);
  final Color color;

  List<String> categories = [
    "Deco",
    "Fashion",
    "Sport",
    "Tech",
    "Kids",
    "Music"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        backgroundColor: color,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.notifications_none),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_basket),
          ),
          SizedBox(
            width: 10,
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: SizedBox(
              width: double.infinity,
              height: 100,
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          Container(
                            height: 52,
                            width: 52,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://source.unsplash.com/random?sig=$index'),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            categories[index],
                            style: TextStyle(
                                color: Color(0xffcacaca), fontSize: 16),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 16,
                      )
                    ],
                  );
                },
                itemCount: 6,
                scrollDirection: Axis.horizontal,
              )),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: ListView(children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                          height: 52,
                          width: 52,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://source.unsplash.com/random?sig=0'),
                          )),
                      SizedBox(
                        width: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Giorgio Armani",
                              style: TextStyle(
                                  color: Color(0xffcacaca),
                                  fontSize: 18,
                                  letterSpacing: 0.8)),
                          Text(
                            "New York, United States",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                letterSpacing: 0.6),
                          )
                        ],
                      )
                    ],
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.more_vert,
                      color: Color(0xffcacaca),
                    ),
                    onPressed: () {},
                  )
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                height: 420,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(26)),
                  child: Image.network(
                    "https://source.unsplash.com/1080x1920",
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
