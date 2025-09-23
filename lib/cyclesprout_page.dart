import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CycleSproutPage extends StatelessWidget {
  const CycleSproutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cycle Sprout',
          style: GoogleFonts.anton(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: false,
      ),
    );
  }
}
