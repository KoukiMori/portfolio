import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DailynotifPage extends StatelessWidget {
  const DailynotifPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size; // 画面サイズを取得
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Daily Notif',
          style: GoogleFonts.anton(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: false,
      ),
      body: Container(
        color: Colors.green,
        width: double.infinity,
        margin: EdgeInsets.all(12),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: ConstrainedBox(
            // 画面サイズに合わせて横幅・高さを制限
            constraints: BoxConstraints(
              minWidth: screenSize.width,
              maxWidth: screenSize.width,
              minHeight: screenSize.height * 0.9,
            ),
            child: Row(
              spacing: 12,
              children: [
                Image.asset('dayliNotifImage/1.PNG', scale: 8),
                Image.asset('dayliNotifImage/2.PNG', scale: 8),
                Image.asset('dayliNotifImage/3.PNG', scale: 8),
                Image.asset('dayliNotifImage/4.PNG', scale: 8),
                Image.asset('dayliNotifImage/5.PNG', scale: 8),
                Image.asset('dayliNotifImage/6.jpg', scale: 9),
              ],
            ), // 中身は横並びの行（後で子ウィジェットを追加）
          ),
        ),
      ),
    );
  }
}
