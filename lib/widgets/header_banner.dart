import 'package:flutter/material.dart';

class HeaderBanner extends StatelessWidget {
  final VoidCallback onToggleTheme;
  final bool isDark;

  const HeaderBanner({
    super.key,
    required this.onToggleTheme,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return SizedBox(
      height: 196,
      child: Stack(
        children: [
          // Khối nền chuyển màu gradient 150dp
          Container(
            height: 150,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [scheme.primary, scheme.tertiary],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(24),
              ),
            ),
            padding: const EdgeInsets.fromLTRB(20, 36, 12, 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'INT4211 – LẬP TRÌNH DI ĐỘNG',
                      style: TextStyle(
                        color: scheme.onPrimary,
                        fontSize: 12,
                        letterSpacing: 1.5,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Cổng thực hành LTDD',
                      style: TextStyle(
                        color: scheme.onPrimary,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                // Nút chuyển chế độ Sáng / Tối (Bài nâng cao NC1)
                IconButton(
                  tooltip: 'Chuyển Theme Sáng/Tối',
                  onPressed: onToggleTheme,
                  icon: Icon(
                    isDark ? Icons.light_mode : Icons.dark_mode,
                    color: scheme.onPrimary,
                  ),
                ),
              ],
            ),
          ),
          // Avatar tròn 92x92 đè mép đáy
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Center(
              child: CircleAvatar(
                radius: 46,
                backgroundColor: scheme.surface,
                child: CircleAvatar(
                  radius: 42,
                  backgroundColor: scheme.primaryContainer,
                  child: Text(
                    'LT',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: scheme.onPrimaryContainer,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
