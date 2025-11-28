import 'package:flutter/material.dart';
import '../../../../../src/controller/components/black-text.dart';

class PurchaseCard extends StatelessWidget {
  final String title;
  final String category;
  final String price;
  final IconData icon;
  final bool isPaid;

  const PurchaseCard({
    super.key,
    required this.title,
    required this.category,
    required this.price,
    required this.icon,
    required this.isPaid,
  });

  @override
  Widget build(BuildContext context) {
    final color = isPaid ? Color(0xFF667eea) : Color(0xFF56ab2f);

    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color.withOpacity(0.1),
            color.withOpacity(0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: isPaid
                    ? [Color(0xFF667eea), Color(0xFF764ba2)]
                    : [Color(0xFF56ab2f), Color(0xFFa8e063)],
              ),
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: color.withOpacity(0.3),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Icon(icon, color: Colors.white, size: 28),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Blacktext(
                  text: title,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 4),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Blacktext(
                    text: category.replaceAll('_', ' '),
                    fontSize: 11,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: color.withOpacity(0.3),
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                Icon(
                  isPaid ? Icons.monetization_on : Icons.card_giftcard,
                  size: 14,
                  color: Colors.white,
                ),
                SizedBox(width: 4),
                Blacktext(
                  text: price,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
