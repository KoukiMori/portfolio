import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DailynotifPage extends StatelessWidget {
  const DailynotifPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
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
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: screenSize.width * .15),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Despriction'),
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
                            child: Image.asset(
                              'dayliNotifImage/1.PNG',
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(
                            width: 140,

                            child: Image.asset(
                              'dayliNotifImage/2.PNG',
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(
                            width: 140,

                            child: Image.asset(
                              'dayliNotifImage/3.PNG',
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(
                            width: 140,

                            child: Image.asset(
                              'dayliNotifImage/4.PNG',
                              fit: BoxFit.contain,
                            ),
                          ),
                          Container(
                            width: 140,

                            child: Image.asset(
                              'dayliNotifImage/5.PNG',
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(
                            width: 140,

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
          ],
        ),
      ),
    );
  }
}
