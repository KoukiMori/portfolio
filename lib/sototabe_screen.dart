import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

/// そとたべ紹介ページ（他アプリ紹介と同レイアウト）
class SototabeScreen extends StatefulWidget {
  const SototabeScreen({super.key});

  @override
  State<SototabeScreen> createState() => _SototabeScreenState();
}

class _SototabeScreenState extends State<SototabeScreen> {
  // ブラウザ判定（Web のロケールにも対応）
  bool _isJapanese(BuildContext context) {
    final locale = Localizations.localeOf(context);
    return locale.languageCode == 'ja' || locale.toString().startsWith('ja');
  }

  String _getText(BuildContext context, String japanese, String english) {
    return _isJapanese(context) ? japanese : english;
  }

  Future<void> _openUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  // 公開後に App Store URL を入れる（未設定なら案内のみ）
  static const String _appStoreUrl = '';

  // GitHub Pages 上の法務ページ（base-href /portfolio/ 前提）
  static const String _privacyUrl =
      'https://koukimori.github.io/portfolio/sototabe/privacy.html';
  static const String _supportUrl =
      'https://koukimori.github.io/portfolio/sototabe/support.html';

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _getText(context, 'そとたべ', 'Sototabe'),
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
          margin: const EdgeInsets.only(top: 20),
          padding: EdgeInsets.symmetric(horizontal: screenSize.width * .15),
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                spacing: 20,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    spacing: 10,
                    children: [
                      Image.asset('assets/sototabe_logo.png', scale: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _getText(context, 'そとたべ', 'Sototabe'),
                            style: GoogleFonts.anton(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            _getText(
                              context,
                              '外食お気に入りを\nジャンル・地区で\n自由に整理・記録',
                              'Organize and log\nyour favorite\nrestaurants freely',
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
                  // App Store（公開後に URL を設定）
                  if (_appStoreUrl.isNotEmpty)
                    GestureDetector(
                      onTap: () => _openUrl(_appStoreUrl),
                      child: Image.asset('assets/appstorelogo.png', scale: 5),
                    )
                  else
                    Text(
                      _getText(
                        context,
                        'App Store 公開準備中',
                        'Coming soon on the App Store',
                      ),
                      style: GoogleFonts.anton(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _getText(
                      context,
                      '「そとたべ」は、外食のお気に入り店をカテゴリ別に整理し、訪店メモ・評価・写真を蓄積できるアプリです。基本機能は無料で利用できます。',
                      'Sototabe helps you organize favorite restaurants by category and keep visit notes, ratings, and photos. Core features are free.',
                    ),
                    style: GoogleFonts.anton(
                      fontSize: 14,
                      fontWeight: FontWeight.w100,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _getText(
                      context,
                      '地図アプリの代替ではなく、「行った店」「また行きたい店」を自分用のリストとして残すためのツールです。アカウント登録は不要で、データは端末内に保存されます。',
                      'It is not a map replacement—it is a personal list for places you visited or want to revisit. No account required; data stays on your device.',
                    ),
                    style: GoogleFonts.anton(
                      fontSize: 14,
                      fontWeight: FontWeight.w100,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    _getText(context, 'こんな方におすすめ', 'Who it is for'),
                    style: GoogleFonts.anton(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _getText(
                      context,
                      '・行ったお店の名前や感想を忘れたくない方\n'
                      '・ラーメン・カフェなど、ジャンル別にお店を分けたい方\n'
                      '・渋谷・横浜など、地区・エリア別にリストを作りたい方\n'
                      '・再訪したい店の評価・予算・支払い方法をメモしておきたい方\n'
                      '・グルメアプリのように公開せず、自分だけの記録を残したい方',
                      '・People who do not want to forget restaurants or impressions\n'
                      '・Those who sort places by genre (ramen, cafe, etc.)\n'
                      '・Those who sort by area (Shibuya, Yokohama, etc.)\n'
                      '・People who note ratings, budget, and payment options\n'
                      '・Anyone who wants a private food diary, not a public feed',
                    ),
                    style: GoogleFonts.anton(
                      fontSize: 14,
                      color: Colors.grey[800],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    _getText(context, '主な機能', 'Features'),
                    style: GoogleFonts.anton(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _getText(
                      context,
                      '・カテゴリ（ジャンル / 地区 / シーン）で自由に整理\n'
                      '・訪店メモ・星評価・お会計・項目別評価\n'
                      '・写真・レシートで「何を食べたか」を履歴に残す\n'
                      '・電話・地図・公式サイトへワンタップ\n'
                      '・お店情報の共有ファイル（.sototabe）送受信',
                      '・Organize by category (genre / area / occasion)\n'
                      '・Visit notes, star ratings, bills, and item scores\n'
                      '・Photos and receipts to remember what you ate\n'
                      '・One-tap phone, maps, and official site links\n'
                      '・Share store info via .sototabe files',
                    ),
                    style: GoogleFonts.anton(
                      fontSize: 14,
                      color: Colors.grey[800],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    _getText(context, '無料とプレミアム', 'Free & Premium'),
                    style: GoogleFonts.anton(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _getText(
                      context,
                      '・無料版: 主要機能すべて + バナー広告 + カテゴリ最大3個 + お店情報の受信\n'
                      '・プレミアム（¥600・買い切り）: 広告なし + カテゴリ最大16個 + お店情報の送信',
                      '・Free: all core features + banner ads + up to 3 categories + receive shared stores\n'
                      '・Premium (¥600 one-time): no ads + up to 16 categories + send shared stores',
                    ),
                    style: GoogleFonts.anton(
                      fontSize: 14,
                      color: Colors.grey[800],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    _getText(
                      context,
                      '今すぐ、自分だけの外食メモを始めましょう。',
                      'Start your own dining notes today.',
                    ),
                    style: GoogleFonts.anton(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFFE53935),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // 法務・サポート（App Store Connect 用 URL と同じ）
                  Text(
                    _getText(context, 'サポート・法務', 'Support & Legal'),
                    style: GoogleFonts.anton(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 16,
                    runSpacing: 8,
                    children: [
                      TextButton(
                        onPressed: () => _openUrl(_supportUrl),
                        child: Text(
                          _getText(context, 'サポート', 'Support'),
                          style: GoogleFonts.anton(fontSize: 14),
                        ),
                      ),
                      TextButton(
                        onPressed: () => _openUrl(_privacyUrl),
                        child: Text(
                          _getText(context, 'プライバシーポリシー', 'Privacy Policy'),
                          style: GoogleFonts.anton(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
