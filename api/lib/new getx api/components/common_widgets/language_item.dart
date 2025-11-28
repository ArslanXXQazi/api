import 'package:flutter/material.dart';
import '../../../../../src/controller/components/black-text.dart';

class LanguageItem extends StatelessWidget {
  final String label;
  final List<String> languages;
  final Color color;

  const LanguageItem({
    super.key,
    required this.label,
    required this.languages,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            label == 'Speaking'
                ? Icons.record_voice_over
                : Icons.school_outlined,
            size: 18,
            color: color,
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Blacktext(
                text: label,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: color,
              ),
              SizedBox(height: 6),
              Wrap(
                spacing: 8,
                children: languages
                    .map(
                      (lang) => Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                        decoration: BoxDecoration(
                          color: color.withOpacity(0.08),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: color.withOpacity(0.3)),
                        ),
                        child: Blacktext(
                          text: lang,
                          fontSize: 13,
                          color: color,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
