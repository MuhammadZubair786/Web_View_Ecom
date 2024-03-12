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
  double _scale = 0.0;

  void changeOpacity() {
    setState(() {
      _scale = _scale + 0.05;
      opacityLevel += 0.2;
    });
    print(_scale);
    if (_scale < 1) {
      Future.delayed(Duration(milliseconds: 40), () {
        changeOpacity();
      });
    } else {
      return;
    }
  }

  @override
  void initState() {
    super.initState();
    changeOpacity();
    // Future.delayed(Duration(seconds: 1), () {
    //   changeOpacity();
    // });
    // _loadDataAndNavigate();
  }

  void _loadDataAndNavigate() async {
    // Load data or perform any async tasks

    // After loading, navigate to the next screen
    Future.delayed(Duration(seconds: 7), () {
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
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 350,
              ),
              Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Center(
                      child: Transform.scale(
                    scale: _scale,
                    child: Image.asset(
                      "assets/img/main logo.PNG",
                      // fit: BoxFit.cover,
                    ),
                  ))),
              Spacer(),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      width: 3,
                      color: Colors.white,
                    )),
                width: MediaQuery.of(context).size.width * 0.9,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => WebViewPage()),
                      );
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 0, 3, 4),
                      ),
                    ),
                    child: Text("Get Started".toUpperCase(),style: TextStyle(fontSize: 25),)),
              ),
              SizedBox(
                height: 20,
              ),

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
