import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/cyclesprout_screen.dart';
import 'package:portfolio/dailynotif_screen.dart';
import 'package:portfolio/sototabe_screen.dart';
import 'package:url_launcher/url_launcher.dart';

/// ポートフォリオ Top（nuidiary 系の紙質トーン + PC/モバイルで同じ構成）
class TopPage extends StatelessWidget {
  const TopPage({super.key});

  static const _ink = Color(0xFF1C1410);
  static const _inkSoft = Color(0xFF4A3F38);
  static const _muted = Color(0xFF7A6E66);
  static const _paper = Color(0xFFF6F0EA);
  static const _cream = Color(0xFFFFF8F2);
  static const _accent = Color(0xFFC45C3E);
  static const _maxContent = 960.0;

  Future<void> _openUrl(String url) async {
    final uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    const updateDate = '2026/08/26';
    final width = MediaQuery.sizeOf(context).width;
    final isWide = width >= 900;
    final padH = isWide ? 40.0 : 20.0;

    return Scaffold(
      body: Container(
        // 暖色の紙っぽいグラデーション（モバイルも PC も同じ地）
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFFFE8DC),
              _paper,
              _cream,
              Color(0xFFF3EBE3),
            ],
          ),
        ),
        child: SingleChildScrollView(
          // 横スクロールは使わず、PC でも中央寄せで揃える
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: _maxContent),
              child: Padding(
                padding: EdgeInsets.fromLTRB(padH, 20, padH, 56),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildHeader(updateDate),
                    SizedBox(height: isWide ? 48 : 32),
                    _buildHero(isWide),
                    SizedBox(height: isWide ? 56 : 40),
                    _sectionLabel('APPS'),
                    const SizedBox(height: 8),
                    Text(
                      'つくっているアプリ',
                      style: GoogleFonts.zenMaruGothic(
                        fontSize: isWide ? 28 : 24,
                        fontWeight: FontWeight.w700,
                        color: _ink,
                        height: 1.3,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'タップすると紹介ページへ移動します。',
                      style: GoogleFonts.zenKakuGothicNew(
                        fontSize: 14,
                        color: _inkSoft,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildApps(context, isWide),
                    SizedBox(height: isWide ? 48 : 36),
                    _sectionLabel('TOOLS'),
                    const SizedBox(height: 8),
                    Text(
                      'Tools & Frameworks',
                      style: GoogleFonts.zenMaruGothic(
                        fontSize: isWide ? 28 : 24,
                        fontWeight: FontWeight.w700,
                        color: _ink,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildTools(),
                    SizedBox(height: isWide ? 48 : 36),
                    _sectionLabel('SOCIAL'),
                    const SizedBox(height: 8),
                    Text(
                      'Social Media',
                      style: GoogleFonts.zenMaruGothic(
                        fontSize: isWide ? 28 : 24,
                        fontWeight: FontWeight.w700,
                        color: _ink,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildSocial(),
                    const SizedBox(height: 48),
                    Divider(color: _ink.withValues(alpha: 0.12)),
                    const SizedBox(height: 16),
                    Text(
                      '© Kouki Mori · Indie App Developer',
                      style: GoogleFonts.zenKakuGothicNew(
                        fontSize: 13,
                        color: _muted,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _sectionLabel(String text) {
    return Text(
      text,
      style: GoogleFonts.zenKakuGothicNew(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        letterSpacing: 2.4,
        color: _accent,
      ),
    );
  }

  Widget _buildHeader(String updateDate) {
    return Row(
      children: [
        // 紙端の装飾
        Image.asset('assets/paper.png', height: 36),
        const Spacer(),
        Text(
          'Update: $updateDate',
          style: GoogleFonts.zenKakuGothicNew(
            fontSize: 12,
            color: _muted,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildHero(bool isWide) {
    final face = Image.asset(
      'assets/MyFace.png',
      height: isWide ? 140 : 110,
      fit: BoxFit.contain,
    );
    final nameBlock = Column(
      crossAxisAlignment:
          isWide ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        Text(
          'INDIE APP DEVELOPER',
          style: GoogleFonts.zenKakuGothicNew(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            letterSpacing: 2.2,
            color: _accent,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'KOUKI\nMORI',
          textAlign: isWide ? TextAlign.left : TextAlign.center,
          style: GoogleFonts.zenMaruGothic(
            fontSize: isWide ? 64 : 48,
            fontWeight: FontWeight.w700,
            color: _ink,
            height: 1.05,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'iOS / Android の個人アプリをつくっています。\nそとたべ・DailyNotif・CycleSprout など。',
          textAlign: isWide ? TextAlign.left : TextAlign.center,
          style: GoogleFonts.zenKakuGothicNew(
            fontSize: 15,
            height: 1.65,
            color: _inkSoft,
          ),
        ),
      ],
    );

    if (isWide) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          face,
          const SizedBox(width: 36),
          Expanded(child: nameBlock),
        ],
      );
    }

    return Column(
      children: [
        face,
        const SizedBox(height: 20),
        nameBlock,
      ],
    );
  }

  Widget _buildApps(BuildContext context, bool isWide) {
    final apps = [
      (
        'assets/dayliNotif_logo.png',
        'DailyNotif',
        'リマインダー',
        () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => DailyNotifScreen()),
        ),
      ),
      (
        'assets/cycleSprout_logo.png',
        'CycleSprout',
        'サイクル管理',
        () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => CycleSproutScreen()),
        ),
      ),
      (
        'assets/sototabe_logo.png',
        'そとたべ',
        '外食メモ',
        () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const SototabeScreen()),
        ),
      ),
    ];

    // PC は横並び、狭い画面は縦積み（見た目は同じカード）
    if (isWide) {
      return Row(
        children: [
          for (var i = 0; i < apps.length; i++) ...[
            if (i > 0) const SizedBox(width: 14),
            Expanded(
              child: _AppCard(
                asset: apps[i].$1,
                title: apps[i].$2,
                subtitle: apps[i].$3,
                onTap: apps[i].$4,
              ),
            ),
          ],
        ],
      );
    }

    return Column(
      children: [
        for (var i = 0; i < apps.length; i++) ...[
          if (i > 0) const SizedBox(height: 12),
          _AppCard(
            asset: apps[i].$1,
            title: apps[i].$2,
            subtitle: apps[i].$3,
            onTap: apps[i].$4,
          ),
        ],
      ],
    );
  }

  Widget _buildTools() {
    const tools = [
      'assets/flutter_logo.png',
      'assets/dart_logo.png',
      'assets/html_logo.png',
      'assets/css3_logo.png',
      'assets/github_logo.png',
      'assets/git_logo.png',
      'assets/cursor_logo.png',
      'assets/openai.png',
      'assets/claude_logo.png',
    ];

    return Wrap(
      spacing: 14,
      runSpacing: 14,
      children: [
        for (final path in tools)
          _IconChip(child: Image.asset(path, height: 36, fit: BoxFit.contain)),
      ],
    );
  }

  Widget _buildSocial() {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        _IconChip(
          onTap: () => _openUrl('https://x.com/kokirin_com'),
          child: Image.asset('assets/x_logo.png', height: 36),
        ),
        _IconChip(
          onTap: () => _openUrl('https://www.instagram.com/leafvlog'),
          child: Image.asset('assets/Instagram_icon.png', height: 36),
        ),
        _IconChip(
          onTap: () => _openUrl(
            'https://www.facebook.com/share/1Fyz9bL4iB/?mibextid=wwXIfr',
          ),
          child: Image.asset('assets/facebook_logo.png', height: 36),
        ),
      ],
    );
  }
}

/// アプリ紹介カード（タップで詳細へ）
class _AppCard extends StatelessWidget {
  const _AppCard({
    required this.asset,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final String asset;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white.withValues(alpha: 0.62),
      borderRadius: BorderRadius.circular(22),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(22),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: TopPage._ink.withValues(alpha: 0.1)),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.asset(
                  asset,
                  width: 56,
                  height: 56,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.zenMaruGothic(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: TopPage._ink,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: GoogleFonts.zenKakuGothicNew(
                        fontSize: 13,
                        color: TopPage._inkSoft,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 14,
                color: TopPage._muted,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _IconChip extends StatelessWidget {
  const _IconChip({required this.child, this.onTap});

  final Widget child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final box = Container(
      width: 56,
      height: 56,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.7),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: TopPage._ink.withValues(alpha: 0.08)),
      ),
      child: child,
    );

    if (onTap == null) return box;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: box,
    );
  }
}
