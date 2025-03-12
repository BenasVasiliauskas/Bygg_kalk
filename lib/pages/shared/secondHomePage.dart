import 'package:cost_calculator/pages/shared/bathroom_section_page.dart';
import 'package:cost_calculator/pages/shared/home_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // For FontAwesome icons

class SecondHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Home Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // First Square
                  _buildSquare(
                    context,
                    icon: FontAwesomeIcons.houseChimney,
                    title: 'Stalio darbai',
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => homePage()),
                      );
                    },
                  ),
                  // Second Square
                  _buildSquare(
                    context,
                    icon: FontAwesomeIcons.book,
                    title: 'Vonios kambario darbai',
                    onTap: () {
                      // Add navigation logic for the second square
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BathroomSectionPage()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build a styled square
  Widget _buildSquare(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        child: Container(
          color: Theme.of(context).appBarTheme.backgroundColor,
          height: 120.0,
          width: 120.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: FaIcon(icon),
                color: Colors.white,
                onPressed: onTap,
              ),
              Text(
                textAlign: TextAlign.center,
                title,
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
