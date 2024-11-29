import 'package:flutter/material.dart';

import 'package:offline_map/constant/constant.dart';
import 'package:offline_map/mapbox_screen.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // String ACCESS_TOKEN = String.fromEnvironment("sk.eyJ1IjoiYXdhaXNhamFtbDIyIiwiYSI6ImNtMnUzczBjaDA5dDIya3J6NmhtcTZtcGIifQ.eW4PRjUO5XhPE0y-kAokQw");
// MapboxOptions.setAccessToken(Constant.access_token);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: S57S52MapPage(),
    );
  }
}
