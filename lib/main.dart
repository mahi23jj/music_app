import 'package:flutter/material.dart';
import 'package:music_app/model/playlist.dart';
import 'package:music_app/pages/first.dart';
import 'package:music_app/themes/dark.dart';
import 'package:music_app/themes/light.dart';
import 'package:music_app/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => themes(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PlaylistProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: Provider.of<themes>(context).themeData,
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
