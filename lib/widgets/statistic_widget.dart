import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import '../data/statistic_data.dart';
import '../util/responsive.dart';

class StatisticWidget extends StatefulWidget {
  // final String title;
  // final double price;
  // final String percentage;
  final IconData icon;
  final Color color;
  final bool isPrice;
  const StatisticWidget({
    super.key,
    // required this.title,
    // required this.price,
    // required this.percentage,
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

    _animation = Tween<double>(begin: 0, end: 100)
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
    bool isMobile = Responsive.isMobile(context);
    return GridView.builder(
      itemCount: StatisticData.statisticItems.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isMobile ? 2 : 4,
        crossAxisSpacing: 15,
        mainAxisSpacing: 1.0,
        mainAxisExtent: 150.h,
      ),
      itemBuilder: (context, index) {
        var statisticItems = StatisticData.statisticItems;
        return Container(
          width: 280.w,
          height: 150.h,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(8.r),
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
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 16.h,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  statisticItems[index].title,
                  style: AppTextStyles.body,
                ),
                Text(
                  widget.isPrice
                      ? '\$${_animation.value.toStringAsFixed(2)}'
                      : _animation.value.toStringAsFixed(2), // animated value
                  style: AppTextStyles.title.copyWith(
                    fontSize: 30.sp,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 30.h,
                      decoration: BoxDecoration(
                        color: widget.color.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: TextButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          widget.icon,
                          size: 14.sp,
                          color: widget.color,
                        ),
                        label: Text(
                          statisticItems[index].percentage,
                          style: AppTextStyles.body.copyWith(
                            color: widget.color,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Flexible(
                      child: Text(
                        'Compared to last month',
                        style: AppTextStyles.body.copyWith(
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
