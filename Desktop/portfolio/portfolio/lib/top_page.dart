import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopPage extends StatelessWidget {
  const TopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final bgColor = Color.fromARGB(255, 236, 236, 236);
    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        // 水平スクロールを有効化
        scrollDirection: Axis.horizontal,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: screenSize.width,
            maxWidth: screenSize.width,
            minHeight: screenSize.height * 0.9,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('assets/paper.png', scale: 4),
                    Padding(
                      padding: const EdgeInsets.only(right: 24.0),
                      child: Text(
                        'Update 9/28',
                        style: GoogleFonts.anton(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 20,
                      children: [
                        Image.asset('assets/MyFace.png', scale: 5),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'KOUKI\nMORI',
                              style: GoogleFonts.anton(
                                fontSize: 70,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                height: 1, // 行間を狭くする
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Indie App Developer',
                              style: GoogleFonts.anton(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                height: 1, // 行間を狭くする
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(width: 400, height: 2, color: Colors.black54),
                    SizedBox(height: 20),
                    Column(
                      children: [
                        SizedBox(
                          width: 330,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Apps",
                                style: GoogleFonts.anton(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              Row(
                                spacing: 6,
                                children: [
                                  SizedBox(width: 10),
                                  Image.asset('dailiyNotif_logo.png', scale: 3),
                                  Image.asset('cycleSprout_logo.png', scale: 3),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Column(
                      children: [
                        SizedBox(
                          width: 330,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Tool & Frameworks",
                                style: GoogleFonts.anton(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              Row(
                                spacing: 6,
                                children: [
                                  SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        spacing: 10,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'flutter_logo.png',
                                            scale: 26,
                                          ),
                                          Image.asset(
                                            'dart_logo.png',
                                            scale: 50,
                                          ),
                                          Image.asset(
                                            'html_logo.png',
                                            scale: 12,
                                          ),
                                          Image.asset(
                                            'css3_logo.png',
                                            scale: 12,
                                          ),
                                          Image.asset(
                                            'github_logo.png',
                                            scale: 10,
                                          ),
                                          Image.asset('git_logo.png', scale: 8),
                                        ],
                                      ),
                                      Row(
                                        spacing: 6,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'dailiyNotif_logo.png',
                                            scale: 3,
                                          ),
                                          Image.asset(
                                            'cycleSprout_logo.png',
                                            scale: 3,
                                          ),
                                          Image.asset(
                                            'dailiyNotif_logo.png',
                                            scale: 3,
                                          ),
                                          Image.asset(
                                            'cycleSprout_logo.png',
                                            scale: 3,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Column(
                      children: [
                        SizedBox(
                          width: 330,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Social Media",
                                style: GoogleFonts.anton(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              Row(
                                spacing: 6,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(width: 10),
                                  Image.asset('x_logo.png', scale: 12),
                                  Image.asset('instagram_icon.png', scale: 126),
                                  Image.asset('facebook_logo.png', scale: 26),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
