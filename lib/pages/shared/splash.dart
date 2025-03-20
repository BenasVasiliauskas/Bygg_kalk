import 'package:cost_calculator/pages/shared/home_page.dart';
import 'package:cost_calculator/pages/shared/secondHomePage.dart';
import 'package:flutter/material.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToSecondHome(); // Updated method name for clarity
  }

  _navigateToSecondHome() async {
    await Future.delayed(Duration(milliseconds: 1500), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => homePage()), // Navigate to SecondHomePage
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              child: Image.asset("assets/Icon.png"),
            ),
            Container(
              child: Text(
                "Tømrerarbeid  kalkyle",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
