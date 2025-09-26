import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/dailynotif_screen.dart';
import 'package:portfolio/cyclesprout_screen.dart';
import 'package:url_launcher/url_launcher.dart'; // url_launcher をインポート

class DailyNotifScreen extends StatefulWidget {
  // StatefulWidget に変更
  const DailyNotifScreen({super.key});

  @override
  State<DailyNotifScreen> createState() => _DailyNotifScreenState();
}

class _DailyNotifScreenState extends State<DailyNotifScreen> {
  // 言語判定メソッド（日本語かどうかを判定 - Web環境でも対応）
  bool _isJapanese(BuildContext context) {
    final locale = Localizations.localeOf(context);
    return locale.languageCode == 'ja' || locale.toString().startsWith('ja');
  }

  // テキスト取得メソッド（言語に応じて適切なテキストを返す）
  String _getText(BuildContext context, String japanese, String english) {
    return _isJapanese(context) ? japanese : english;
  }

  // 外部ブラウザでURLを開く（Webは新規タブ）
  Future<void> _openUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  // 画像拡大ダイアログを表示（タップで拡大表示）
  void _showImageDialog(BuildContext context, String imagePath) {
    showDialog(
      context: context,
      barrierDismissible: true, // 背景タップで閉じる
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(), // タップで閉じる
            child: Container(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.8,
                maxWidth: MediaQuery.of(context).size.width * 0.9,
              ),
              child: InteractiveViewer(
                // 拡大画像内でピンチズーム可能
                child: Image.asset(imagePath, fit: BoxFit.contain),
              ),
            ),
          ),
        );
      },
    );
  }

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
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.symmetric(horizontal: screenSize.width * .15),
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                spacing: 20,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    spacing: 10,
                    children: [
                      Image.asset('assets/dayliNotif_logo.png', scale: 10),
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
                            _getText(
                              context,
                              'シンプルで使いやすい\nアラームアプリ',
                              'Simple and Easy-to-Use\nAlarm App',
                            ),
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

                  GestureDetector(
                    onTap: () {
                      _openUrl(
                        'https://apps.apple.com/jp/app/%E8%B5%B7%E3%81%8D%E3%82%84%E3%82%8B%E3%82%B7%E3%83%95%E3%83%88%E9%80%9A%E7%9F%A5-daily-notif/id6743959744',
                      ); // アクセスしたいURLに置き換えてください
                    },
                    child: Image.asset(
                      'assets/appstorelogo.png',
                      scale: 5,
                    ), // assets/ プレフィックスを追加
                  ),
                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // メインの説明
                  Text(
                    _getText(
                      context,
                      '起きてやることをリストし通知をグループ化したシンプルな通知アプリ。\n進行が遅れているか進んでいるかにも使える',
                      'A simple notification app that lists tasks and groups notifications.\nAlso useful for tracking progress.',
                    ),
                    style: GoogleFonts.anton(
                      fontSize: 14,
                      fontWeight: FontWeight.w100,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 10),

                  // ターゲットユーザー
                  Text(
                    _getText(
                      context,
                      '看護師、介護士、シフト勤務者、不規則な生活リズムを持つ方',
                      'For nurses, caregivers, shift workers, and those with irregular schedules',
                    ),
                    style: GoogleFonts.anton(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    _getText(
                      context,
                      '朝の準備や出勤時間に追われている方のための通知アプリです。',
                      'A notification app for those who are pressed for time with morning preparations and commuting.',
                    ),
                    style: GoogleFonts.anton(fontSize: 14, color: Colors.black),
                  ),
                  Text(
                    _getText(
                      context,
                      '複数の生活パターンに対応し、平日と休日で異なるスケジュールを持つ方に最適です。',
                      'Perfect for those with multiple lifestyle patterns and different schedules for weekdays and weekends.',
                    ),
                    style: GoogleFonts.anton(fontSize: 14, color: Colors.black),
                  ),
                  Text(
                    _getText(
                      context,
                      '起きやるリスト通知は、朝の起床時やシフト勤務の予定に合わせて通知をグループ化できるアプリです。',
                      'Wake-up list notifications can group notifications according to morning wake-up times and shift work schedules.',
                    ),
                    style: GoogleFonts.anton(fontSize: 14, color: Colors.black),
                  ),
                  Text(
                    _getText(
                      context,
                      '介護職・看護師・夜勤勤務者など、不規則なスケジュールを持つ方に最適！',
                      'Perfect for caregivers, nurses, night shift workers, and others with irregular schedules!',
                    ),
                    style: GoogleFonts.anton(fontSize: 14, color: Colors.black),
                  ),
                  Text(
                    _getText(
                      context,
                      '事前に設定した通知グループをカレンダーに反映することが出来ます！！',
                      'You can reflect pre-set notification groups on your calendar!!',
                    ),
                    style: GoogleFonts.anton(fontSize: 14, color: Colors.black),
                  ),
                  Text(
                    _getText(
                      context,
                      'シフト確認にも役立ちます。',
                      'Also useful for shift confirmation.',
                    ),
                    style: GoogleFonts.anton(fontSize: 14, color: Colors.black),
                  ),
                  Text(
                    _getText(
                      context,
                      '予め設定した時刻に通知を送り、進捗情報として確認利用することもあり！！',
                      'Send notifications at pre-set times and use them as progress information!!',
                    ),
                    style: GoogleFonts.anton(fontSize: 14, color: Colors.black),
                  ),
                  Text(
                    _getText(
                      context,
                      '起きてスマホやテレビを未過ぎて、ついついやる事を忘れて遅刻しない？？',
                      'Do you get caught up with your phone or TV and forget things to do and end up being late??',
                    ),
                    style: GoogleFonts.anton(fontSize: 14, color: Colors.black),
                  ),
                  Text(
                    _getText(
                      context,
                      '事前に時間を設定すれば、iPhoneやApple Watch、Mac等から通知してくれる。',
                      'Set the time in advance and get notifications from iPhone, Apple Watch, Mac, etc.',
                    ),
                    style: GoogleFonts.anton(fontSize: 14, color: Colors.black),
                  ),
                  SizedBox(height: 20),
                  // キャッチフレーズ
                  Text(
                    _getText(
                      context,
                      '大切な予定をカンタン管理しましょう！！',
                      'Easily manage your important schedules!!',
                    ),
                    style: GoogleFonts.anton(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                  SizedBox(height: 20), // スクリーンショットとの間隔
                  // ここからDailyNotif ScreenShotのテキストとInteractiveViewerが続く
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
                            // 各画像に固定幅を設定（タップで拡大表示）
                            SizedBox(
                              width: 140,
                              child: GestureDetector(
                                onTap: () =>
                                    _showImageDialog(context, 'assets/dn1.PNG'),
                                child: Image.asset(
                                  'assets/dn1.PNG',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 140,
                              child: GestureDetector(
                                onTap: () =>
                                    _showImageDialog(context, 'assets/dn2.PNG'),
                                child: Image.asset(
                                  'assets/dn2.PNG',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 140,
                              child: GestureDetector(
                                onTap: () =>
                                    _showImageDialog(context, 'assets/dn3.PNG'),
                                child: Image.asset(
                                  'assets/dn3.PNG',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 140,
                              child: GestureDetector(
                                onTap: () =>
                                    _showImageDialog(context, 'assets/dn4.PNG'),
                                child: Image.asset(
                                  'assets/dn4.PNG',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 140,
                              child: GestureDetector(
                                onTap: () =>
                                    _showImageDialog(context, 'assets/dn5.PNG'),
                                child: Image.asset(
                                  'assets/dn5.PNG',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 140,
                              child: GestureDetector(
                                onTap: () =>
                                    _showImageDialog(context, 'assets/dn6.jpg'),
                                child: Image.asset(
                                  'assets/dn6.jpg',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _getText(context, '【主な機能】', '【Main Features】'),
                    style: GoogleFonts.anton(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    _getText(
                      context,
                      '• ルーティーンをグループ化して一括管理\n  - 平日用、休日用、仕事用など、目的別にグループを作成可能\n  - 各グループ内で複数のアラームを設定可能\n  - グループごとに一括でON/OFF切り替えが可能\n\n• シンプルで直感的な操作感\n  - スワイプで編集・削除が可能\n  - グループの追加は「+」ボタンで簡単に\n  - アラームの追加も直感的な操作で設定可能\n\n• わかりやすいUI\n  - ダークモードで目に優しいデザイン\n  - グループごとに視覚的に分かりやすい表示\n  - アラームの状態が一目で分かる表示\n\n• Apple Watch対応\n  - iPhoneと連携してApple Watchにも通知を送信\n  - 腕時計でアラームを確認可能\n  - 通知の管理がより便利に',
                      '• Group routines for batch management\n  - Create purpose-specific groups (weekdays, weekends, work, etc.)\n  - Set multiple alarms within each group\n  - Batch ON/OFF switching per group\n\n• Simple and intuitive operation\n  - Swipe to edit and delete\n  - Add groups easily with "+" button\n  - Intuitive alarm setting operations\n\n• Clear and understandable UI\n  - Eye-friendly dark mode design\n  - Visually clear group displays\n  - Alarm status visible at a glance\n\n• Apple Watch compatible\n  - Send notifications to Apple Watch via iPhone integration\n  - Check alarms on your wrist\n  - More convenient notification management',
                    ),
                    style: GoogleFonts.anton(fontSize: 14, color: Colors.black),
                  ),
                  Text(
                    _getText(context, '-こんな方におすすめ-', '-Recommended for-'),
                    style: GoogleFonts.anton(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    _getText(
                      context,
                      '• 朝の準備時間に追われている方\n• 出勤時間に間に合わないことがある方\n• 平日と休日で異なるスケジュールを持つ方\n• 仕事とプライベートで別々のルーティーンを持つ方\n• 複数の生活パターンを管理したい方\n• Apple Watchユーザー',
                      '• Those who are pressed for time with morning preparations\n• Those who sometimes don\'t make it to work on time\n• Those with different schedules for weekdays and weekends\n• Those with separate routines for work and private life\n• Those who want to manage multiple lifestyle patterns\n• Apple Watch users',
                    ),
                    style: GoogleFonts.anton(fontSize: 14, color: Colors.black),
                  ),

                  Text(
                    _getText(
                      context,
                      '-プライバシーへの配慮-',
                      '-Privacy Considerations-',
                    ),
                    style: GoogleFonts.anton(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    _getText(
                      context,
                      '• データは端末内にのみ保存\n• クラウドへのデータ送信なし\n• 必要最小限の権限のみを使用',
                      '• Data stored only on device\n• No data transmission to cloud\n• Uses only minimal necessary permissions',
                    ),
                    style: GoogleFonts.anton(fontSize: 14, color: Colors.black),
                  ),
                  Text(
                    _getText(
                      context,
                      '【よくある質問（FAQ）】',
                      '【Frequently Asked Questions (FAQ)】',
                    ),
                    style: GoogleFonts.anton(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    _getText(
                      context,
                      'Q: アラームが鳴らない場合はどうすればいいですか？\n  A: デバイスの設定で通知が有効になっているかご確認ください。\n\nQ: Apple Watchでの通知はどのように機能しますか？\n  A: 通知はペアリングされたApple Watchに自動的に送信されます。\n\nQ: グループはどのように管理しますか？\n  A: 左にスワイプして編集、右にスワイプしてグループを削除します。また、グループをまとめてオン/オフを切り替えることもできます。',
                      'Q: What should I do if the alarm doesn\'t sound?\n  A: Please check that notifications are enabled in your device settings.\n\nQ: How do Apple Watch notifications work?\n  A: Notifications are automatically sent to your paired Apple Watch.\n\nQ: How do I manage groups?\n  A: Swipe left to edit, swipe right to delete groups. You can also toggle groups on/off collectively.',
                    ),
                    style: GoogleFonts.anton(fontSize: 14, color: Colors.black),
                  ),
                  Text(
                    _getText(context, '【プライバシーポリシー】', '【Privacy Policy】'),
                    style: GoogleFonts.anton(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    _getText(
                      context,
                      '1. はじめに\n  Daily Notif（以下「本アプリ」）は、ユーザーのプライバシーを尊重し、個人情報の保護に努めています。\n\n2. 収集する情報\n  ・アラーム設定情報（時刻、タイトル）\n  ・アプリの使用状況データ（クラッシュレポート）\n\n3. 情報の使用方法\n  ・アラーム機能の提供\n  ・アプリの改善とバグ修正\n  ・ユーザーサポートの提供\n\n4. データの保存\n  アラーム設定情報は、デバイス内にのみ保存され、クラウドには保存されません。\n\n5. 権限の使用\n  ・通知権限：アラーム通知の送信\n\n6. お問い合わせ\n  jieihal090310@gmail.com\n\n7. 変更履歴\n  2024年3月24日：初版作成',
                      '1. Introduction\n  Daily Notif respects user privacy and strives to protect personal information.\n\n2. Information We Collect\n  ・Alarm settings (time, title)\n  ・App usage data (crash reports)\n\n3. How We Use Information\n  ・Provide alarm functionality\n  ・App improvement and bug fixes\n  ・User support\n\n4. Data Storage\n  Alarm settings are stored only on device, not in the cloud.\n\n5. Permissions Used\n  ・Notification permission: for alarm notifications\n\n6. Contact\n  jieihal090310@gmail.com\n\n7. Revision History\n  March 24, 2024: Initial version created',
                    ),
                    style: GoogleFonts.anton(
                      fontSize: 12,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    _getText(
                      context,
                      '大切な予定を見逃さないように、Daily Notifで毎日を管理しましょう。',
                      'Manage your daily schedule with Daily Notif so you don\'t miss important appointments.',
                    ),
                    style: GoogleFonts.anton(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
