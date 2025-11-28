import 'package:flutter/material.dart';
import '../../../../../src/controller/components/black-text.dart';

class StatCard extends StatelessWidget {
  final String count;
  final String label;
  final Color color;

  const StatCard({
    super.key,
    required this.count,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            label == 'Followers'
                ? Icons.people_outline
                : label == 'Following'
                    ? Icons.person_add_outlined
                    : Icons.visibility_outlined,
            color: color,
            size: 24,
          ),
        ),
        SizedBox(height: 8),
        Blacktext(
          text: count,
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
        SizedBox(height: 2),
        Blacktext(
          text: label,
          fontSize: 12,
          color: Colors.grey[600],
        ),
      ],
    );
  }
}
