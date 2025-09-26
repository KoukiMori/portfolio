import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart'; // url_launcher をインポート

class DailyNotifJPScreen extends StatefulWidget {
  // StatefulWidget に変更
  const DailyNotifJPScreen({super.key});

  @override
  State<DailyNotifJPScreen> createState() => _DailyNotifJPScreenState();
}

class _DailyNotifJPScreenState extends State<DailyNotifJPScreen> {
  // 外部ブラウザでURLを開く（Webは新規タブ）
  Future<void> _openUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
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
              Row(
                spacing: 20,
                mainAxisAlignment: MainAxisAlignment.start,
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
                            'シンプルで使いやすい\nアラームアプリ',
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
                      'appstorelogo.png',
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
                    '起きてやることをリストし通知をグループ化したシンプルな通知アプリ。\n進行が遅れているか進んでいるかにも使える',
                    style: GoogleFonts.anton(
                      fontSize: 14,
                      fontWeight: FontWeight.w100,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 10),

                  // ターゲットユーザー
                  Text(
                    '看護師、介護士、シフト勤務者、不規則な生活リズムを持つ方',
                    style: GoogleFonts.anton(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    '朝の準備や出勤時間に追われている方のための通知アプリです。',
                    style: GoogleFonts.anton(fontSize: 14, color: Colors.black),
                  ),
                  Text(
                    '複数の生活パターンに対応し、平日と休日で異なるスケジュールを持つ方に最適です。',
                    style: GoogleFonts.anton(fontSize: 14, color: Colors.black),
                  ),
                  Text(
                    '起きやるリスト通知は、朝の起床時やシフト勤務の予定に合わせて通知をグループ化できるアプリです。',
                    style: GoogleFonts.anton(fontSize: 14, color: Colors.black),
                  ),
                  Text(
                    '介護職・看護師・夜勤勤務者など、不規則なスケジュールを持つ方に最適！',
                    style: GoogleFonts.anton(fontSize: 14, color: Colors.black),
                  ),
                  Text(
                    '事前に設定した通知グループをカレンダーに反映することが出来ます！！',
                    style: GoogleFonts.anton(fontSize: 14, color: Colors.black),
                  ),
                  Text(
                    'シフト確認にも役立ちます。',
                    style: GoogleFonts.anton(fontSize: 14, color: Colors.black),
                  ),
                  Text(
                    '予め設定した時刻に通知を送り、進捗情報として確認利用することもあり！！',
                    style: GoogleFonts.anton(fontSize: 14, color: Colors.black),
                  ),
                  Text(
                    '起きてスマホやテレビを未過ぎて、ついついやる事を忘れて遅刻しない？？',
                    style: GoogleFonts.anton(fontSize: 14, color: Colors.black),
                  ),
                  Text(
                    '事前に時間を設定すれば、iPhoneやApple Watch、Mac等から通知してくれる。',
                    style: GoogleFonts.anton(fontSize: 14, color: Colors.black),
                  ),
                  SizedBox(height: 20),
                  // 主な特徴のタイトル
                  Text(
                    '主な特徴',
                    style: GoogleFonts.anton(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  // 各特徴をTextSpanで箇条書き風に
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '• ルーティーンをグループ化して一括管理\n',
                          style: GoogleFonts.anton(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: '• シンプルで直感的な操作と画面\n',
                          style: GoogleFonts.anton(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: '• カレンダー機能追加\n',
                          style: GoogleFonts.anton(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // キャッチフレーズ
                  Text(
                    '大切な予定をカンタン管理しましょう！！',
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
              Row(
                spacing: 20,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '主な機能',
                    style: GoogleFonts.anton(
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'よくある質問',
                    style: GoogleFonts.anton(
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'プライバシーポリシー',
                    style: GoogleFonts.anton(
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '【主な機能】',
                    style: GoogleFonts.anton(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '• ルーティーンをグループ化して一括管理\n',
                          style: GoogleFonts.anton(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: '  - 平日用、休日用、仕事用など、目的別にグループを作成可能\n',
                          style: GoogleFonts.anton(
                            fontSize: 12,
                            color: Colors.black87,
                          ),
                        ),
                        TextSpan(
                          text: '  - 各グループ内で複数のアラームを設定可能\n',
                          style: GoogleFonts.anton(
                            fontSize: 12,
                            color: Colors.black87,
                          ),
                        ),
                        TextSpan(
                          text: '  - グループごとに一括でON/OFF切り替えが可能\n',
                          style: GoogleFonts.anton(
                            fontSize: 12,
                            color: Colors.black87,
                          ),
                        ),
                        TextSpan(
                          text: '• シンプルで直感的な操作感\n',
                          style: GoogleFonts.anton(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: '  - スワイプで編集・削除が可能\n',
                          style: GoogleFonts.anton(
                            fontSize: 12,
                            color: Colors.black87,
                          ),
                        ),
                        TextSpan(
                          text: '  - グループの追加は「+」ボタンで簡単に\n',
                          style: GoogleFonts.anton(
                            fontSize: 12,
                            color: Colors.black87,
                          ),
                        ),
                        TextSpan(
                          text: '  - アラームの追加も直感的な操作で設定可能\n',
                          style: GoogleFonts.anton(
                            fontSize: 12,
                            color: Colors.black87,
                          ),
                        ),
                        TextSpan(
                          text: '• わかりやすいUI\n',
                          style: GoogleFonts.anton(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: '  - ダークモードで目に優しいデザイン\n',
                          style: GoogleFonts.anton(
                            fontSize: 12,
                            color: Colors.black87,
                          ),
                        ),
                        TextSpan(
                          text: '  - グループごとに視覚的に分かりやすい表示\n',
                          style: GoogleFonts.anton(
                            fontSize: 12,
                            color: Colors.black87,
                          ),
                        ),
                        TextSpan(
                          text: '  - アラームの状態が一目で分かる表示\n',
                          style: GoogleFonts.anton(
                            fontSize: 12,
                            color: Colors.black87,
                          ),
                        ),
                        TextSpan(
                          text: '• Apple Watch対応\n',
                          style: GoogleFonts.anton(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: '  - iPhoneと連携してApple Watchにも通知を送信\n',
                          style: GoogleFonts.anton(
                            fontSize: 12,
                            color: Colors.black87,
                          ),
                        ),
                        TextSpan(
                          text: '  - 腕時計でアラームを確認可能\n',
                          style: GoogleFonts.anton(
                            fontSize: 12,
                            color: Colors.black87,
                          ),
                        ),
                        TextSpan(
                          text: '  - 通知の管理がより便利に\n',
                          style: GoogleFonts.anton(
                            fontSize: 12,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '-こんな方におすすめ-',
                    style: GoogleFonts.anton(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '• 朝の準備時間に追われている方\n',
                          style: GoogleFonts.anton(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: '• 出勤時間に間に合わないことがある方\n',
                          style: GoogleFonts.anton(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: '• 平日と休日で異なるスケジュールを持つ方\n',
                          style: GoogleFonts.anton(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: '• 仕事とプライベートで別々のルーティーンを持つ方\n',
                          style: GoogleFonts.anton(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: '• 複数の生活パターンを管理したい方\n',
                          style: GoogleFonts.anton(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: '• Apple Watchユーザー\n',
                          style: GoogleFonts.anton(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Text(
                    '-プライバシーへの配慮-',
                    style: GoogleFonts.anton(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '• データは端末内にのみ保存\n',
                          style: GoogleFonts.anton(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: '• クラウドへのデータ送信なし\n',
                          style: GoogleFonts.anton(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: '• 必要最小限の権限のみを使用\n',
                          style: GoogleFonts.anton(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '【よくある質問（FAQ）】',
                    style: GoogleFonts.anton(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Q: アラームが鳴らない場合はどうすればいいですか？\n',
                          style: GoogleFonts.anton(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: '  A: デバイスの設定で通知が有効になっているかご確認ください。\n',
                          style: GoogleFonts.anton(
                            fontSize: 12,
                            color: Colors.black87,
                          ),
                        ),
                        TextSpan(
                          text: 'Q: Apple Watchでの通知はどのように機能しますか？\n',
                          style: GoogleFonts.anton(
                            fontSize: 12,
                            color: Colors.black87,
                          ),
                        ),
                        TextSpan(
                          text: '  A: 通知はペアリングされたApple Watchに自動的に送信されます。\n',
                          style: GoogleFonts.anton(
                            fontSize: 12,
                            color: Colors.black87,
                          ),
                        ),
                        TextSpan(
                          text: 'Q: グループはどのように管理しますか？\n',
                          style: GoogleFonts.anton(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text:
                              '  A: 左にスワイプして編集、右にスワイプしてグループを削除します。また、グループをまとめてオン/オフを切り替えることもできます。\n',
                          style: GoogleFonts.anton(
                            fontSize: 12,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '【プライバシーポリシー】',
                    style: GoogleFonts.anton(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '1. はじめに\n',
                          style: GoogleFonts.anton(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text:
                              '  Daily Notif（以下「本アプリ」）は、ユーザーのプライバシーを尊重し、個人情報の保護に努めています。本プライバシーポリシーでは、本アプリの利用に関して収集される情報とその使用方法について説明します。\n',
                          style: GoogleFonts.anton(
                            fontSize: 12,
                            color: Colors.black87,
                          ),
                        ),
                        TextSpan(
                          text: '2. 収集する情報\n',
                          style: GoogleFonts.anton(
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                        TextSpan(
                          text: '  本アプリでは、以下の情報を収集します：\n',
                          style: GoogleFonts.anton(
                            fontSize: 12,
                            color: Colors.black87,
                          ),
                        ),
                        TextSpan(
                          text: '   ・アラーム設定情報（時刻、タイトル）\n',
                          style: GoogleFonts.anton(
                            fontSize: 12,
                            color: Colors.black87,
                          ),
                        ),
                        TextSpan(
                          text: '   ・アプリの使用状況データ（クラッシュレポート、パフォーマンスデータ）\n',
                          style: GoogleFonts.anton(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: '3. 情報の使用方法\n',
                          style: GoogleFonts.anton(
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                        TextSpan(
                          text: '  収集した情報は以下の目的で使用されます：\n',
                          style: GoogleFonts.anton(
                            fontSize: 12,
                            color: Colors.black87,
                          ),
                        ),
                        TextSpan(
                          text: '   ・アラーム機能の提供\n',
                          style: GoogleFonts.anton(
                            fontSize: 12,
                            color: Colors.black87,
                          ),
                        ),
                        TextSpan(
                          text: '   ・アプリの改善とバグ修正\n',
                          style: GoogleFonts.anton(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: '   ・ユーザーサポートの提供\n',
                          style: GoogleFonts.anton(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: '4. 情報の共有\n',
                          style: GoogleFonts.anton(
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                        TextSpan(
                          text: '  本アプリは、以下の場合を除き、収集した情報を第三者と共有することはありません：\n',
                          style: GoogleFonts.anton(
                            fontSize: 12,
                            color: Colors.black87,
                          ),
                        ),
                        TextSpan(
                          text: '   ・法的要請がある場合\n',
                          style: GoogleFonts.anton(
                            fontSize: 12,
                            color: Colors.black87,
                          ),
                        ),
                        TextSpan(
                          text: '   ・ユーザーの同意がある場合\n',
                          style: GoogleFonts.anton(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: '   ・アプリの改善のために必要な場合（匿名化された統計データとして）\n',
                          style: GoogleFonts.anton(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: '5. データの保存\n',
                          style: GoogleFonts.anton(
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                        TextSpan(
                          text: '  アラーム設定情報は、デバイス内にのみ保存され、クラウドには保存されません。\n',
                          style: GoogleFonts.anton(
                            fontSize: 12,
                            color: Colors.black87,
                          ),
                        ),
                        TextSpan(
                          text: '6. 権限の使用\n',
                          style: GoogleFonts.anton(
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                        TextSpan(
                          text: '  本アプリは以下の権限を使用します：\n',
                          style: GoogleFonts.anton(
                            fontSize: 12,
                            color: Colors.black87,
                          ),
                        ),
                        TextSpan(
                          text: '   ・通知権限：アラーム通知の送信\n',
                          style: GoogleFonts.anton(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: '7. お問い合わせ\n',
                          style: GoogleFonts.anton(
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                        TextSpan(
                          text:
                              '  プライバシーポリシーに関するお問い合わせは、以下のメールアドレスまでご連絡ください：\n',
                          style: GoogleFonts.anton(
                            fontSize: 12,
                            color: Colors.black87,
                          ),
                        ),
                        TextSpan(
                          text: '   ・jieihal090310@gmail.com\n',
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                        TextSpan(
                          text: '8. 変更履歴\n',
                          style: GoogleFonts.anton(
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                        TextSpan(
                          text: '  2024年3月24日：初版作成\n',
                          style: GoogleFonts.anton(
                            fontSize: 12,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '大切な予定を見逃さないように、Daily Notifで毎日を管理しましょう。',
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
