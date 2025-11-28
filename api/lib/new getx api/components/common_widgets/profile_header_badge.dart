import 'package:flutter/material.dart';
import '../../../../../src/controller/components/black-text.dart';

class ProfileHeaderBadge extends StatelessWidget {
  final IconData icon;
  final String text;

  const ProfileHeaderBadge({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.25),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.4)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: Colors.white),
          SizedBox(width: 4),
          Blacktext(text: text, fontSize: 12, color: Colors.white),
        ],
      ),
    );
  }
}
