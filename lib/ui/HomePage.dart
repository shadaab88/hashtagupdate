import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:techstagram/Login/login_screen.dart';
import 'package:techstagram/Welcome/welcome_screen.dart';
import 'package:techstagram/models/post.dart';
import 'package:techstagram/model/feed.dart';
import 'package:techstagram/views/tabs/chats.dart';
import 'package:techstagram/views/tabs/feeds.dart';
import 'package:techstagram/views/tabs/notifications.dart';
import 'package:techstagram/views/tabs/profile.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title, this.uid}) : super(key: key); //update this to include the uid in the constructor
  final String title;
  final String uid; //include this

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController taskTitleInputController;
  TextEditingController taskDescripInputController;
  FirebaseUser currentUser;

  @override
  initState() {
    taskTitleInputController = new TextEditingController();
    taskDescripInputController = new TextEditingController();
    this.getCurrentUser();
    super.initState();
  }

  void getCurrentUser() async {
    currentUser = await FirebaseAuth.instance.currentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          //  backgroundColor: Colors.white,
          leading: Padding(
            padding: EdgeInsets.only(left: 12,),
            child: IconButton(
              icon: Icon(Icons.camera_alt,color: Colors.white,),
              onPressed: () {
                print('Click leading');
              },
            ),

          ),
          title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:<Widget>[
                Text('HashTag',
                  style: TextStyle(color: Colors.white,),),
              ]
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search,color: Colors.white,),
              onPressed: () {
                print('Click search');
              },
            ),
            IconButton(
              icon: Icon(Icons.message,color: Colors.white,),
              onPressed: () {
                print('Click start');
              },
            ),
          ],

        ),
//      appBar: AppBar(
//        title: Text(widget.title),
//        actions: <Widget>[
//          FlatButton(
//            child: Text("Log Ot"),
//            textColor: Colors.white,
//            onPressed: () {
//              FirebaseAuth.instance
//                  .signOut()
//                  .then((result) =>
//                  Navigator.push(context, new MaterialPageRoute(
//                      builder: (context) =>
//                      new LoginScreen())
//                  ))
//                  .catchError((err) => print(err));
//            },
//          )
//        ],
//      ),
//
////      body: Center(
////        child: Container(
////            padding: const EdgeInsets.all(20.0),
////            child: Text("Welcome")),
////
////      ),
      body: new TabLayoutDemo(),
      
    );
  }


}

class TabLayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      color: Colors.yellow,
      home: DefaultTabController(
        length: 4,
        child: new Scaffold(
          body: TabBarView(
            children: [
              new Container(
                child: FeedsPage(),
              ),
              new Container(
                child: ChatsPage(),
              ),
              new Container(
                child: NotificationsPage(),
              ),
              new Container(
                  child: ProfilePage()
              ),
            ],
          ),
          bottomNavigationBar: new Container(
        height: 60.0,
            child: new TabBar(
              tabs: [
                Tab(
                  icon: new Icon(Icons.rss_feed,size: 30),
                ),
                Tab(
                  icon: new Icon(Icons.blur_circular,size: 30),
                ),
                Tab(
                  icon: new Icon(Icons.notifications,size: 30),
                ),
                Tab(icon: new Icon(Icons.settings,size: 30),)
              ],
              labelColor: Colors.white,
              unselectedLabelColor: Colors.purple[100],
              indicatorSize: TabBarIndicatorSize.label,
              indicatorPadding: EdgeInsets.all(5.0),
              indicatorColor: Colors.red,
            ),
          ),
          backgroundColor: Colors.purple,
        ),
      ),
    );
  }
}


//class Home extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//        height: 900,
//        width: double.infinity,
//        child: DefaultTabController(
//            length: 4,
//            child: Scaffold(
//               // bottomNavigationBar: BottomBar(),
//                appBar: AppBar(
//
//                  elevation: 0.0,
//                  backgroundColor: Colors.transparent,
//                  bottom: PreferredSize(
//                    preferredSize: Size.fromHeight(70),
//                    child: Container(
//                      color: Colors.transparent,
//                      child: SafeArea(
//                        child: Column(
//                          children: <Widget>[
//                            TabBar(
//
//                                indicator: UnderlineTabIndicator(
//                                    borderSide: BorderSide(
//                                        color: Colors.purple, width: 1.0,),
//                                    insets: EdgeInsets.fromLTRB(
//                                        30.0, 20.0, 30.0, 0.0)),
//                                indicatorWeight: 0,
//                                indicatorSize: TabBarIndicatorSize.label,
//                                labelColor: Color(0xff2d386b),
//                                labelStyle: TextStyle(
//                                    fontSize: 12,
//                                    letterSpacing: 0.5,
//                                    fontWeight: FontWeight.w500),
//                                unselectedLabelColor: Colors.black26,
//                                tabs: [
//                                  Tab(
//                                    text: "Feed",
//                                    icon: Icon(Icons.rss_feed, size: 30),
//                                  ),
//                                  Tab(
//                                    text: "Status",
//                                    icon: Icon(Icons.blur_circular, size: 30),
//                                  ),
//                                  Tab(
//                                    text: "Notification",
//                                    icon: Icon(Icons.notifications,
//                                        size: 30),
//                                  ),
//                                  Tab(
//                                    text: "Profile",
//                                    icon: Icon(Icons.account_circle,
//                                        size: 30),
//                                  ),
//                                ])
//                          ],
//                        ),
//                      ),
//                    ),
//                  ),
//                ),
//                body: TabBarView(
//                  children: <Widget>[
//                    Center(
//                      child: FeedsPage(),
//                    ),
//                    Center(
//                      child: ChatsPage(),
//                    ),
//                    Center(
//                      child: NotificationsPage(),
//                    ),
//                    Center(
//                      child: ProfilePage()
//                    ),
//                  ],
//                ))));
//  }
//}