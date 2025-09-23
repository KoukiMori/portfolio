import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DailynotifPage extends StatelessWidget {
  const DailynotifPage({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Despriction'),
          Container(
            color: Colors.green,
            width: double.infinity,
            height: 340,
            // margin: EdgeInsets.all(12),
            // InteractiveViewerでドラッグ操作による横スクロールを実現
            child: InteractiveViewer(
              minScale: 1.0,
              maxScale: 3.0,
              constrained: false, // 子ウィジェットのサイズ制限を解除
              child: SizedBox(
                width: 1100, // 十分に大きな幅を設定
                height: 300,
                child: Row(
                  children: [
                    // 各画像に固定幅を設定
                    Container(
                      width: 160,
                      margin: EdgeInsets.only(right: 16),
                      child: Image.asset(
                        'dayliNotifImage/1.PNG',
                        fit: BoxFit.contain,
                      ),
                    ),
                    Container(
                      width: 160,
                      margin: EdgeInsets.only(right: 16),
                      child: Image.asset(
                        'dayliNotifImage/2.PNG',
                        fit: BoxFit.contain,
                      ),
                    ),
                    Container(
                      width: 160,
                      margin: EdgeInsets.only(right: 16),
                      child: Image.asset(
                        'dayliNotifImage/3.PNG',
                        fit: BoxFit.contain,
                      ),
                    ),
                    Container(
                      width: 160,
                      margin: EdgeInsets.only(right: 16),
                      child: Image.asset(
                        'dayliNotifImage/4.PNG',
                        fit: BoxFit.contain,
                      ),
                    ),
                    Container(
                      width: 160,
                      margin: EdgeInsets.only(right: 16),
                      child: Image.asset(
                        'dayliNotifImage/5.PNG',
                        fit: BoxFit.contain,
                      ),
                    ),
                    Container(
                      width: 160,
                      margin: EdgeInsets.only(right: 0),
                      child: Image.asset(
                        'dayliNotifImage/6.jpg',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
