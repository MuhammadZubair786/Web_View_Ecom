// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:treand_app/webView.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double opacityLevel = 0.0;
  double _scale = 0.5;

  void changeOpacity() {
    setState((){
       _scale += 0.2;
       opacityLevel += 0.2;
    } );
  }

  @override
  void initState() {
    super.initState();
    changeOpacity();
    Future.delayed(Duration(seconds: 1), () {
      changeOpacity();
    });
    _loadDataAndNavigate();
  }

  void _loadDataAndNavigate() async {
    // Load data or perform any async tasks

    // After loading, navigate to the next screen
    Future.delayed(Duration(seconds: 12), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WebViewPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.black,
          // appBar: AppBar(
          //   title: Text('My Widget'),
          // ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Center(
                      child: AnimatedOpacity(
                    opacity: opacityLevel,
                      curve: Curves.bounceIn,
                    duration: Duration(seconds: 8),
                    child: Transform.scale(
                       scale: _scale,
                      child: Image.asset(
                        "assets/img/main logo.PNG",
                        // fit: BoxFit.cover,
                      ),
                    ),
                  )))
              //  Center(
              //   child: AnimatedOpacity(
              //       opacity: opacityLevel,
              //       duration: Duration(seconds: 12),
              //       child: Image.asset(
              //         "assets/img/main logo.PNG",
              //         // fit: BoxFit.cover,
              //       )),
              // ),
            ],
          )),
    );
  }
}
