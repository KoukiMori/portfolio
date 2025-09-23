import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/dailynotif_page.dart';
import 'package:portfolio/cyclesprout_page.dart';
import 'package:url_launcher/url_launcher.dart';

class TopPage extends StatelessWidget {
  const TopPage({super.key});

  // 外部ブラウザでURLを開く（Webは新規タブ）
  Future<void> _openUrl(String url) async {
    final uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    final String updateDate = '2025/09/29';
    final screenSize = MediaQuery.of(context).size;
    final bgColor = Color.fromARGB(255, 236, 236, 236);
    final double imageScale = 22;
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
                        'Update:$updateDate',
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
                      spacing: 16,
                      children: [
                        Image.asset('assets/MyFace.png', scale: 6),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'KOUKI\nMORI',
                              style: GoogleFonts.anton(
                                fontSize: 48,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                height: 1, // 行間を狭くする
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Indie\nApp Developer',
                              style: GoogleFonts.anton(
                                fontSize: 18,
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
                              SizedBox(height: 6),
                              Row(
                                children: [
                                  SizedBox(width: 16),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              DailynotifPage(),
                                        ),
                                      );
                                    },
                                    child: Image.asset(
                                      'assets/dayliNotif_logo.png',
                                      scale: imageScale,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              CycleSproutPage(),
                                        ),
                                      );
                                    },
                                    child: Image.asset(
                                      'assets/cycleSprout_logo.png',
                                      scale: imageScale,
                                    ),
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
                              SizedBox(height: 6),
                              Row(
                                spacing: 6,
                                children: [
                                  SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        spacing: 12,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/flutter_logo.png',
                                            scale: imageScale,
                                          ),
                                          Image.asset(
                                            'assets/dart_logo.png',
                                            scale: imageScale,
                                          ),
                                          Image.asset(
                                            'assets/html_logo.png',
                                            scale: imageScale,
                                          ),
                                          Image.asset(
                                            'assets/css3_logo.png',
                                            scale: imageScale,
                                          ),
                                          Image.asset(
                                            'assets/github_logo.png',
                                            scale: imageScale,
                                          ),
                                          Image.asset(
                                            'assets/git_logo.png',
                                            scale: imageScale,
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        spacing: 12,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/cursor_logo.png',
                                            scale: imageScale,
                                          ),
                                          Image.asset(
                                            'assets/openai.png',
                                            scale: imageScale,
                                          ),
                                          Image.asset(
                                            'assets/claude_logo.png',
                                            scale: imageScale,
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
                              SizedBox(height: 6),
                              Row(
                                spacing: 12,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(width: 4),
                                  GestureDetector(
                                    onTap: () => _openUrl(
                                      'https://x.com/kokirin_com',
                                    ), // TODO: あなたのID
                                    child: Image.asset(
                                      'assets/x_logo.png',
                                      scale: imageScale,
                                    ),
                                  ),
                                  // Instagram（ファイル名に注意）
                                  GestureDetector(
                                    onTap: () => _openUrl(
                                      'https://www.instagram.com/leafvlog',
                                    ),
                                    child: Image.asset(
                                      'assets/Instagram_icon.png',
                                      scale: imageScale,
                                    ),
                                  ),
                                  // Facebook
                                  GestureDetector(
                                    onTap: () => _openUrl(
                                      'https://www.facebook.com/share/1Fyz9bL4iB/?mibextid=wwXIfr',
                                    ),
                                    child: Image.asset(
                                      'assets/facebook_logo.png',
                                      scale: imageScale,
                                    ),
                                  ),
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
