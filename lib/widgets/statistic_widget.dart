import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import '../util/responsive.dart';

class StatisticWidget extends StatefulWidget {
  final String title;
  final double price;
  final String percentage;
  final IconData icon;
  final Color color;
  final bool isPrice;
  const StatisticWidget({
    super.key,
    required this.title,
    required this.price,
    required this.percentage,
    required this.icon,
    required this.color,
    this.isPrice = false,
  });

  @override
  State<StatisticWidget> createState() => _StatisticWidgetState();
}

class _StatisticWidgetState extends State<StatisticWidget>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2), // duration of the animation
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: widget.price)
        .animate(_controller) // animate from 0 to 100
      ..addListener(() {
        setState(() {});
      });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: 280,
        height: 160,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColors.bodyColor.withOpacity(0.2),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: AppTextStyles.body,
                ),
                Text(
                  widget.isPrice
                      ? '\$${_animation.value.toStringAsFixed(2)}'
                      : _animation.value.toStringAsFixed(2), // animated value
                  style: AppTextStyles.title.copyWith(
                    fontSize: 30,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 30,
                      decoration: BoxDecoration(
                        color: widget.color.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          widget.icon,
                          size: 14,
                          color: widget.color,
                        ),
                        label: Text(
                          widget.percentage,
                          style: AppTextStyles.body.copyWith(
                            color: widget.color,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: Text(
                        'Compared to last month',
                        style: AppTextStyles.body.copyWith(
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
