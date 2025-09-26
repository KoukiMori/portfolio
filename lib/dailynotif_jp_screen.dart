import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DailyNotifJPScreen extends StatelessWidget {
  const DailyNotifJPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Daily Notif',
          style: GoogleFonts.anton(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: false,
      ),
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.symmetric(horizontal: screenSize.width * .15),
        child: Column(
          spacing: 20,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/dayliNotif_logo.png', scale: 10),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Daily Notif',
                      style: GoogleFonts.anton(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'シンプルで使いやすいアラームアプリ',
                      style: GoogleFonts.anton(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('DailyNotif ScreenShot'),
                SizedBox(
                  height: 300,

                  // InteractiveViewerでドラッグ操作による横スクロールを実現
                  child: InteractiveViewer(
                    constrained: false, // 子ウィジェットのサイズ制限を解除
                    child: SizedBox(
                      height: 300,

                      child: Row(
                        spacing: 10,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // 各画像に固定幅を設定
                          SizedBox(
                            width: 140,
                            // アセット画像を表示（assets/ プレフィックス必須）
                            child: Image.asset(
                              'assets/dn1.PNG',
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(
                            width: 140,

                            child: Image.asset(
                              'assets/dn2.PNG',
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(
                            width: 140,

                            child: Image.asset(
                              'assets/dn3.PNG',
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(
                            width: 140,

                            child: Image.asset(
                              'assets/dn4.PNG',
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(
                            width: 140,

                            child: Image.asset(
                              'assets/dn5.PNG',
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(
                            width: 140,

                            child: Image.asset(
                              'assets/dn6.jpg',
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
            Image.asset('appstorelogo.png', scale: 4),
          ],
        ),
      ),
    );
  }
}
