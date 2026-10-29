import 'package:flutter/material.dart';

class WidgetGraph extends StatelessWidget {
  final List<double> values;
  final List<String> labels;

  const WidgetGraph({super.key, required this.values, required this.labels})
    : assert(
        values.length == labels.length,
        'List of labels an values must have the same amount of elements',
      );

  @override
  Widget build(BuildContext context) {
    // iterate list of values, compares current highest value with next one and choose highest
    final double maxValue = values.isEmpty
        ? 1.0
        : values.reduce((a, b) => a > b ? a : b);

    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(16.0),
        ),
        // measure available width to decide if it needs scroll or fits nicely
        child: LayoutBuilder(
          builder: (context, constraints) {
            const double barWidth = 26.0;
            const double itemWidth = barWidth + 8;
            final bool needsScroll =
                (values.length * itemWidth) > constraints.maxWidth;
            final double effectiveItemWidth = needsScroll
                ? itemWidth
                : constraints.maxWidth / values.length;

            Widget graphContent = Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 100,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: List.generate(values.length, (i) {
                      final height = maxValue == 0
                          ? 15.0
                          : (values[i] / maxValue) * 80.0; // apply min value or generate 80% rectangle

                      return SizedBox(
                        width: effectiveItemWidth,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: barWidth,
                            height: height < 15
                                ? 15
                                : height, // apply min height or custom height
                            decoration: BoxDecoration(
                              color: i == values.length - 1
                                  ? const Color(0xFF2E7D32)
                                  : const Color(0xFFC8E6C9),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),

                const SizedBox(height: 10),

                Row(
                  children: List.generate(
                    values.length,
                    (i) => SizedBox(
                      width: effectiveItemWidth,
                      child: Text(
                        labels[i],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
              ],
            );

            // if items exceed container width, enable horizontal scroll with hidden overflow
            return needsScroll
                ? SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: constraints.maxWidth,
                      ),
                      child: graphContent,
                    ),
                  )
                : graphContent;
          },
        ),
      ),
    );
  }
}
