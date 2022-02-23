import 'package:flutter/material.dart';
import 'package:ubung_4/screens/welcome_screen/activities.dart';
import 'package:ubung_4/screens/welcome_screen/home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String routeName = "/home_screen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {


  late TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 0);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title:  Text("Home"),
        centerTitle: true,

        actions: [
          IconButton(onPressed: null, icon: Icon(Icons.search)),
          PopupMenuButton<String>(
            onSelected: (value) {
              print(value);
            },
            color: Colors.red,
            iconSize: 30,
            itemBuilder: (BuildContext context) {
              return const [
                PopupMenuItem(
                  child: Text("New group"),
                  value: "New group",
                ),
                PopupMenuItem(
                  child: Text("New broadcast"),
                  value: "New broadcast",
                ),
                PopupMenuItem(
                  child: Text("Whatsapp Web"),
                  value: "Whatsapp Web",
                ),
                PopupMenuItem(
                  child: Text("Starred messages"),
                  value: "Starred messages",
                ),
                PopupMenuItem(
                  child: Text("Settings"),
                  value: "Settings",
                ),
              ];
            },
          )
        ],
      ),
      body: TabBarView(
        controller: _controller,
        children: const [
          Home(),
          Activities(),
          Text("STATUS"),
          Text("Calls"),
        ],
      ),
      // body: CustomScrollView(
      //   slivers: <Widget> [
      //     const SliverAppBar(
      //       actions: [
      //         IconButton(onPressed: null, icon: Icon(Icons.search)),
      //         IconButton(onPressed: null, icon: Icon(Icons.search)),
      //
      //       ],
      //       pinned: true,
      //       snap: false,
      //       floating: false,
      //       expandedHeight: 160.0,
      //       flexibleSpace: FlexibleSpaceBar(
      //         title: Text('MateFit'),
      //         background: FlutterLogo(),
      //       ),
      //     ),
      //     const SliverToBoxAdapter(
      //       child: SizedBox(
      //         height: 20,
      //         child: Center(
      //           child: Text('Scroll to see the SliverAppBar in effect.'),
      //         ),
      //       ),
      //     ),
      //     SliverList(
      //       delegate: SliverChildBuilderDelegate(
      //             (BuildContext context, int index) {
      //           return Container(
      //             color: index.isOdd ? Colors.white : Colors.black12,
      //             height: 100.0,
      //             child: Center(
      //               child: Text('$index', textScaleFactor: 5),
      //             ),
      //           );
      //         },
      //         childCount: 10,
      //       ),
      //     ),
      //   ],
      // ),
      bottomNavigationBar: TabBar(
        controller: _controller,
        indicatorColor: Colors.purple,
        unselectedLabelColor: Colors.black,
        labelColor: Colors.purple,
        tabs: const [
          Tab(
            icon: Icon(Icons.home),
          ),
          Tab(
            icon: Icon(Icons.groups),
          ),
          Tab(
            icon: Icon(Icons.message),
          ),
          Tab(
            icon: Icon(Icons.account_circle),
          ),
        ],
      ),
    );
  }
}
