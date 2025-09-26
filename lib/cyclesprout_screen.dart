import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart'; // url_launcher をインポート

class CycleSproutScreen extends StatefulWidget {
  // StatefulWidget に変更
  const CycleSproutScreen({super.key});

  @override
  State<CycleSproutScreen> createState() => _CycleSproutScreenState();
}

class _CycleSproutScreenState extends State<CycleSproutScreen> {
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
          _getText(context, 'ポモドの草', 'Cycle Sprout'),
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
                      Image.asset('assets/cycleSprout_logo.png', scale: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _getText(context, 'ポモドの草', 'Cycle Sprout'),
                            style: GoogleFonts.anton(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            _getText(
                              context,
                              'ポモドーロテクニックと\n進捗カレンダーが\nくっついた\nアラームアプリ',
                              'An alarm app\nthat combines the Pomodoro Technique\nand a heat map calendar',
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
                        'https://www.apple.com/jp/app-store/',
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
                      'ポモドーロテクニックで、あなたの集中力と生産性を最大限に引き出す「ポモドの草」',
                      '“Cycle Sprout” maximizes your focus and productivity using the Pomodoro Technique.',
                    ),
                    style: GoogleFonts.anton(
                      fontSize: 14,
                      fontWeight: FontWeight.w100,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    _getText(
                      context,
                      'ポモドーロテクニックとは、25分間の作業（ポモドーロ）と短い休憩を繰り返す時間管理術です。\nこのシンプルなサイクルが、集中力を維持し、効率を向上させることで世界中で活用されています。',
                      '“Cycle Sprout” maximizes your focus and productivity using the Pomodoro Technique.',
                    ),
                    style: GoogleFonts.anton(
                      fontSize: 14,
                      fontWeight: FontWeight.w100,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    _getText(
                      context,
                      '「ポモドの草」は、このポモドーロテクニックの理念に基づき、カスタマイズ可能なタイマーを通じて、作業と休憩の時間を効果的に管理し、日々のタスクを効率的にこなすための最適なツールです。\nシンプルで直感的なインターフェースで、どなたでも簡単に生産性向上を実感できます。\n私たちは、現代社会において集中力を維持することの難しさを理解しています。\nそのため、「ポモドの草」は、余計な機能を排除し、あなたの「集中」を最優先に設計されました。\n短い時間集中し、短い時間休憩するというサイクルを繰り返すことで、疲労を最小限に抑えながら、タスクへの深い集中力を維持できるようになります。\n独自のヒートマップ機能は、あなたの毎日の努力を「草」として視覚的に表現します。\nどれだけ作業時間を積み重ねたか、目標達成度はどのくらいか一目で確認でき、それがモチベーションとなり継続的な学習や作業の習慣化を強力にサポートします。\n日々の成長を視覚的に捉えることで、達成感を得ながら、自然と良い習慣を身につけることができるでしょう。',
                      '“CycleSprout” is an optimal tool based on the philosophy of the Pomodoro Technique, allowing you to effectively manage your work and break times through a fully customizable timer, and efficiently complete your daily tasks.\nWith a simple and intuitive interface, anyone can easily experience improved productivity.\nWe understand how challenging it is to maintain focus in today’s world.\nThat’s why “CycleSprout” is designed with a focus-first mindset, eliminating unnecessary features so you can concentrate on what truly matters.\nBy repeating short cycles of focused work and brief breaks, you can maintain deep concentration on tasks while minimizing fatigue.\nOur unique heat map feature visually represents your daily efforts as growing “grass.”\nYou can instantly see how much time you’ve accumulated and how close you are to your goals — boosting motivation and helping you build consistent habits for study and work.\nBy visualizing your daily growth, you’ll gain a sense of achievement and naturally develop positive, productive habits over time.',
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
                      '作業と休憩の時間を自由に設定しヒートマップで日々の進捗を視覚的に把握',
                      'Set your work and break times freely, and visualize your daily progress with a heat map.',
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
                      'モチベーションを維持しながら目標達成と効率的な良い習慣の定着を力強くサポートします',
                      'It powerfully supports you in staying motivated, achieving your goals, and building efficient, positive habits.',
                    ),
                    style: GoogleFonts.anton(fontSize: 14, color: Colors.black),
                  ),

                  SizedBox(height: 20),
                  // キャッチフレーズ
                  Text(
                    _getText(
                      context,
                      '今すぐダウンロードして、あなたの「集中」を「草」として育て、\n日々の目標達成と自己成長を実感してください!!\nデジタルデトックスにもおすすめです!!',
                      'Download now and grow your “focus” like a plant,\nwhile achieving your daily goals and feeling your personal growth!,',
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
                                    _showImageDialog(context, 'assets/cs1.png'),
                                child: Image.asset(
                                  'assets/cs1.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 140,
                              child: GestureDetector(
                                onTap: () =>
                                    _showImageDialog(context, 'assets/cs2.png'),
                                child: Image.asset(
                                  'assets/cs2.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 140,
                              child: GestureDetector(
                                onTap: () =>
                                    _showImageDialog(context, 'assets/cs3.png'),
                                child: Image.asset(
                                  'assets/cs3.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 140,
                              child: GestureDetector(
                                onTap: () =>
                                    _showImageDialog(context, 'assets/cs4.png'),
                                child: Image.asset(
                                  'assets/cs4.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 140,
                              child: GestureDetector(
                                onTap: () =>
                                    _showImageDialog(context, 'assets/cs5.png'),
                                child: Image.asset(
                                  'assets/cs5.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 140,
                              child: GestureDetector(
                                onTap: () =>
                                    _showImageDialog(context, 'assets/cs6.png'),
                                child: Image.asset(
                                  'assets/cs6.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 140,
                              child: GestureDetector(
                                onTap: () =>
                                    _showImageDialog(context, 'assets/cs7.png'),
                                child: Image.asset(
                                  'assets/cs7.png',
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
                    _getText(context, '【主な特徴】', '【Main Features】'),
                    style: GoogleFonts.anton(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    _getText(
                      context,
                      '直感的なUI: シンプルで使いやすいデザインにより、余計な操作なくすぐにポモドーロセッションを開始できます。\n進捗ヒートマップ: 日々の作業時間や目標達成度を、視覚的なヒートマップ（草の成長）で確認。モチベーションを維持し、継続的な習慣化をサポートします。\n目標設定と達成度評価: 日ごとの作業目標を設定し、実績に対する達成度を評価。自己成長を実感できます。\n通知音のカスタマイズ: 作業フェーズ、休憩フェーズ、セッション完了時に鳴る通知音を豊富なサウンドから選択できます。\n中断からの復帰: アプリを閉じたり、他のアプリを開いたりしても、タイマーの状態を保持。再開時に中断した時点からタイマーが再スタートします。\n多言語対応: 日本語と英語に対応しており、より多くのユーザーにご利用いただけます。',
                      'Intuitive UI: A simple and easy-to-use design allows you to start a Pomodoro session right away without unnecessary operations.\n Progress Heat Map: Visualize your daily working hours and goal achievements with a heat map that represents the growth of your “grass.” It helps you stay motivated and build consistent habits.\n Goal Setting & Achievement Tracking: Set daily work goals and evaluate your achievement level based on your actual results, helping you feel your personal growth.\n Customizable Notifications: Choose from a variety of sounds for each phase — work, break, and session completion.\n• Resume from Interruption: Even if you close the app or switch to another one, the timer state is saved, and it resumes right where you left off.\n• Multi-language Support: Available in both Japanese and English, making it accessible to a wider range of users.',
                    ),
                    style: GoogleFonts.anton(fontSize: 14, color: Colors.black),
                  ),
                  SizedBox(height: 10),
                  Text(
                    _getText(context, '[こんな方におすすめ]', '[Recommended for]'),
                    style: GoogleFonts.anton(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    _getText(
                      context,
                      '「ポモドの草」は、学生、フリーランサー、クリエイター、そして集中力を高めて日々の生産性を向上させたいと願うすべての人にとって理想的なパートナーです。',
                      '“CycleSprout” is the ideal partner for students, freelancers, creators, and anyone who wants to improve their focus and boost daily productivity.',
                    ),
                    style: GoogleFonts.anton(fontSize: 14, color: Colors.black),
                  ),
                  SizedBox(height: 10),
                  Text(
                    _getText(context, '[細かな詳細]', '[Detailed Information]'),
                    style: GoogleFonts.anton(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    _getText(
                      context,
                      '・ポモドーロセッション中は、集中維持のため他アプリの使用は避けてください\n・別アプリを開いた/強制終了時はタイマー停止。復帰時は停止時点から再スタート\n・評価は total% ベースの5段階表示（0=空）\n・起点日より前はグレー、未来日は空表示\n・日付またぎ: 0時を越えた実績は翌日に計上。前日の評価はその時点の total%\n・セッションをまたいで自動分割はしません\n・例）23:50→00:10 の20分作業は、完了が 00:10 なら翌日に20分を計上\n・途中保存（停止/終了など）の場合は、その時刻の日付に部分加算\n・未完了日のセルはオレンジ表示\n・Total Time は 残り/設定（例: 118/120min）で表示\n・プリセット適用でタイマーはリセット。実績は保持し、進行中の時間も保存。カレンダー評価にも反映\n・縦向き固定\n・フェーズ切替時は通知（通知音/表示は端末設定に準拠）\n・達成率(%) = 実績秒 ÷ 目標秒 × 100（目標秒 =（作業分＋休憩分）×60×サイクル数）\n・ヒートマップは total% を 0〜5段階にマッピング\n・5段階の目安: 0%=0, (0,20)%=1, [20,40)%=2, [40,60)%=3, [60,80)%=4, [80,100]%=5\n・例: 4サイクル目標で実績が50%なら、その日の評価は3',
                      '• During a Pomodoro session, please avoid using other apps to maintain focus.\n• If another app is opened or the app is forcibly closed, the timer will stop. When reopened, the timer will resume from the stopped time.\n• Progress is displayed in 5 levels based on the total percentage (0 = empty).\n• Dates before the start date are shown in gray, and future dates are left blank.\n• Crossing midnight: any session completed after 00:00 is counted toward the next day. The previous day'
                          's evaluation is based on the total% at that time.\n• Sessions are not automatically split across days.\n• Example: A 20-minute session from 23:50 to 00:10 will count 20 minutes toward the next day if completed at 00:10.\n• If saved midway (e.g., stop or end), the elapsed time will be partially added to that day.\n• Incomplete days are highlighted in orange.\n• “Total Time” is displayed as Remaining / Target (e.g., 118 / 120 min).\n• Applying a preset resets the timer. Records are preserved, progress is saved, and reflected in calendar evaluations.\n• Portrait orientation only.\n• Notifications are sent at phase transitions (sound and display follow device settings).\n• Achievement Rate (%) = Actual Seconds ÷ Target Seconds × 100 (Target Seconds = (Work Minutes + Break Minutes) × 60 × Number of Cycles)\n• The heat map maps total% into 5 levels.\n• 5-level scale: 0% = 0, (0,20)% = 1, [20,40)% = 2, [40,60)% = 3, [60,80)% = 4, [80,100]% = 5\n• Example: If your target is 4 cycles and your progress is 50%, the day’s rating is 3.',
                    ),
                    style: GoogleFonts.anton(fontSize: 14, color: Colors.black),
                  ),
                  SizedBox(height: 10),
                  Text(
                    _getText(context, '[プライバシーポリシー]', '[Privacy Policy]'),
                    style: GoogleFonts.anton(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
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
                      '1. はじめに\n  ポモドの草（以下「本アプリ」）は、ユーザーのプライバシーを尊重し、個人情報の保護に努めています。\n\n2. 収集する情報\n  ・アラーム設定情報（時刻）\n  ・アプリの使用状況データ（クラッシュレポート）\n\n3. 情報の使用方法\n   ・アプリの改善とバグ修正\n  ・ユーザーサポートの提供\n\n4. データの保存\n  アラーム設定情報は、デバイス内にのみ保存され、クラウドには保存されません。\n\n5. 権限の使用\n  ・通知権限：アラーム通知の送信\n\n6. お問い合わせ\n  jieihal090310@gmail.com\n\n7. 変更履歴\n  2024年9月28日：初版作成',
                      '1. Introduction\n  Cycle Sprout respects user privacy and strives to protect personal information.\n\n2. Information We Collect\n  ・Alarm settings (time)\n  ・App usage data (crash reports)\n\n3. How We Use Information\n   ・App improvement and bug fixes\n  ・User support\n\n4. Data Storage\n  Alarm settings are stored only on device, not in the cloud.\n\n5. Permissions Used\n  ・Notification permission: for alarm notifications\n\n6. Contact\n  jieihal090310@gmail.com\n\n7. Revision History\n  March 28, 2024: Initial version created',
                    ),
                    style: GoogleFonts.anton(
                      fontSize: 12,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    _getText(
                      context,
                      'あなたの「集中」を「草」として育て、日々の目標達成と自己成長を実感してください。',
                      'Nurture your “focus” like a plant, and experience daily goal achievement and personal growth.',
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
