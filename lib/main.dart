import 'dart:async';
<<<<<<< Updated upstream
import 'package:aking/screens/Onboarding.dart';
import 'package:flutter/material.dart';
import 'screens/auth/login.dart';
=======
import 'package:nb_utils/nb_utils.dart';
import 'package:aking/screens/Onboarding.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

>>>>>>> Stashed changes

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
<<<<<<< Updated upstream
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter TaskYK',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFEDE7DC),
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
=======
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: Center(
                child: Center(
                  child: Text('App is being initialized'),
                ),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: Center(
                child: Center(
                  child: Text('An error has been occured'),
                ),
              ),
            ),
          );
        }
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Aking',
          theme: ThemeData(
            scaffoldBackgroundColor: Color(0xFFEDE7DC),
            primarySwatch: Colors.blue,
          ),
          home: MyHomePage(),
        );
      },
>>>>>>> Stashed changes
    );
  }
  
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  startTime() async {
    var _duration = Duration(seconds: 3);
    return Timer(_duration, openOnBoard);
  }
  @override
  void initState() {
    super.initState();
    startTime();
  }

  void openOnBoard() {
    finish(context);
    onboarding().launch(context);
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Image.asset('assets/images/aking.png', height: 135)
          ],
        ),
      ),
    );
  }
}

void finish(BuildContext context, [Object? result]) {
  if (Navigator.canPop(context)) Navigator.pop(context, result);
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 3), openOnBoard);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/image/aking.png'),
            )
          ),
        ),
      ),
    );
  }
  void openOnBoard()
  {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Onboarding()));
  }
}