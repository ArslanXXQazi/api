import 'package:flutter/material.dart';
import '../../../../../src/controller/components/black-text.dart';

class InterestChip extends StatelessWidget {
  final String text;
  final List<Color>? gradientColors;

  const InterestChip({
    super.key,
    required this.text,
    this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors ?? [Color(0xFF667eea), Color(0xFF764ba2)],
        ),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: (gradientColors?[0] ?? Color(0xFF667eea)).withOpacity(0.3),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Blacktext(
        text: text,
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    );
  }
}
