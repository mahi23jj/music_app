import 'package:flutter/material.dart';
import 'package:music_app/model/playlist.dart';
import 'package:music_app/pages/detail.dart';
import 'package:music_app/pages/setting.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var play = Provider.of<PlaylistProvider>(context, listen: false);
    var lists = play.playlist;
    void gotosong(int? index) {
      play.currentIndex = index;
      Navigator.push(context, MaterialPageRoute(builder: (context) => detail()));
    }

    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('PLAYLIST'),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: lists.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (){
               gotosong(index);
              } ,
              child: ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                          image: AssetImage(lists[index].AlbumArt),
                          fit: BoxFit.cover)),
                ),
                title: Text(lists[index].SongName),
                subtitle: Text(lists[index].ArtistName),
              ),
            );
          },
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'Drawer Header',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.message),
                title: Text('Messages'),
                onTap: () {
                  // Handle the tap
                },
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Profile'),
                onTap: () {
                  // Handle the tap
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: () {
                  // Handle the tap
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SettingsPage()));
                },
              ),
            ],
          ),
        ));
  }
}
