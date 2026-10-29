import 'package:flutter/material.dart';

class WidgetCard extends StatelessWidget {
  final Color? colorBackground;
  final String title;
  final String amount;
  final Color? colorIndicator;
  final Color? colorTitle;
  final Color? colorAmount;
  final double? width;
  final double? height;

  const WidgetCard({
    super.key,
    this.colorBackground,
    required this.title,
    required this.amount,
    this.colorIndicator,
    this.colorAmount,
    this.colorTitle,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 180.0,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: colorBackground,
        borderRadius: BorderRadius.circular(16),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              // expansion operator ... to draw List<Widget>
              if (colorIndicator != null) ...[
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: colorIndicator,
                    shape: BoxShape.circle,
                  ),
                ),

                const SizedBox(width: 5),
              ],

              Text(
                title,
                style: TextStyle(
                  color: colorAmount ?? Colors.grey,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),

          const SizedBox(height: 5),

          Text(
            amount,
            style: TextStyle(
              color: colorAmount ?? Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
