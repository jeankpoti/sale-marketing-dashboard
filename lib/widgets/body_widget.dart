import 'package:dashboard/constants/app_colors.dart';
import 'package:dashboard/constants/app_text_styles.dart';
import 'package:dashboard/widgets/overview_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'search_bar_widget.dart';
import 'statistic_widget.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Widget bottomTitleWidgets(double value, TitleMeta meta) {
      TextStyle style = TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 12.sp,
        color: AppColors.bodyColor.withOpacity(0.5),
      );
      Widget text;
      switch (value.toInt()) {
        case 1:
          text = Padding(
            padding: const EdgeInsets.only(left: 32.0),
            child: Text('Jan 2024', style: style),
          );
          break;
        case 2:
          text = Text('Feb 2024', style: style);
          break;
        case 3:
          text = Text('Mar 2024', style: style);
          break;
        case 4:
          text = Text('Apr 2024', style: style);
          break;
        case 5:
          text = Text('May 2024', style: style);
          break;
        case 6:
          text = Text('June 2024', style: style);
          break;
        case 7:
          text = Text('July 2024', style: style);
          break;
        case 8:
          text = Text('Aug 2024', style: style);
        default:
          text = const Text('');
          break;
      }

      return SideTitleWidget(
        axisSide: meta.axisSide,
        space: 10,
        child: text,
      );
    }

    Widget rightTitlesWidgets(double value, TitleMeta meta) {
      TextStyle style = TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 12.sp,
        color: AppColors.bodyColor.withOpacity(0.5),
      );
      Widget text;

      print('value: $value  ${meta.axisSide} ');
      switch (value.toInt()) {
        case 1.9:
          text = Text('\$0', style: style);
          break;
        case 2:
          text = Text('\$0', style: style);
          break;
        case 3:
          text = Text('\$10K', style: style);
          break;

        case 3.9:
          text = Text('\$50K', style: style);
        default:
          text = const Text('');
          break;
      }

      return SideTitleWidget(
        axisSide: meta.axisSide,
        space: 10,
        child: text,
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Search bar
        const SearchbarWidget(),
        Divider(
          color: AppColors.bodyColor.withOpacity(0.2),
        ),

        Padding(
          padding: EdgeInsets.all(16.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Overview',
                style: AppTextStyles.title,
              ),
              Row(
                children: [
                  const OverviewWidget(
                    text: 'Customize Widget',
                    icon: Icons.dashboard_outlined,
                  ),
                  SizedBox(width: 10.w),
                  const OverviewWidget(
                    text: 'Filter',
                    icon: Icons.filter_list_outlined,
                  ),
                  SizedBox(width: 10.w),
                  const OverviewWidget(
                    text: 'Share',
                    icon: Icons.share_outlined,
                  ),
                ],
              )
            ],
          ),
        ),
        Divider(
          color: AppColors.bodyColor.withOpacity(0.2),
        ),
        Padding(
          padding: EdgeInsets.all(16.h),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StatisticWidget(
                title: 'Total Revenue',
                price: '\$ 32,499.93',
                percentage: '12,95%',
                icon: Icons.arrow_upward_outlined,
                color: AppColors.secondary,
              ),
              StatisticWidget(
                title: 'Profit',
                price: '\$ 10,499.93',
                percentage: '0,33%',
                icon: Icons.arrow_downward_outlined,
                color: Colors.red,
              ),
              StatisticWidget(
                title: 'Total Views',
                price: '5,211,832',
                percentage: '0,32%',
                icon: Icons.arrow_upward_outlined,
                color: AppColors.secondary,
              ),
              StatisticWidget(
                title: 'Conversion Rate',
                price: '4,83%',
                percentage: '8,05%',
                icon: Icons.arrow_upward_outlined,
                color: AppColors.secondary,
              ),
            ],
          ),
        ),

        // Revenue Over Time
        Padding(
          padding: EdgeInsets.all(16.h),
          child: Container(
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
            width: 750.w,
            child: Padding(
              padding: EdgeInsets.all(16.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Revenue Over Time',
                        style: AppTextStyles.title,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.download_outlined,
                            color: AppColors.bodyColor.withOpacity(0.5),
                          ),
                          SizedBox(width: 10.w),
                          Icon(
                            Icons.more_horiz_outlined,
                            color: AppColors.bodyColor.withOpacity(0.5),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.circle,
                                color: AppColors.secondary,
                                size: 15.r,
                              ),
                              SizedBox(width: 10.w),
                              Text(
                                'Total Revenue',
                                style: AppTextStyles.body,
                              ),
                            ],
                          ),
                          SizedBox(height: 5.h),
                          Padding(
                            padding: EdgeInsets.only(left: 18.w),
                            child: Row(
                              children: [
                                Text(
                                  '\$ 32,839.99',
                                  style: AppTextStyles.subtitle,
                                ),
                                SizedBox(width: 10.w),
                                Icon(
                                  Icons.circle,
                                  color: AppColors.bodyColor.withOpacity(0.5),
                                  size: 10.r,
                                ),
                                SizedBox(width: 10.w),
                                Text(
                                  '55%',
                                  style: AppTextStyles.body
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 30.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.circle,
                                color: Colors.orange,
                                size: 15.r,
                              ),
                              SizedBox(width: 10.w),
                              Text(
                                'Total Revenue',
                                style: AppTextStyles.body,
                              ),
                            ],
                          ),
                          SizedBox(height: 5.h),
                          Padding(
                            padding: EdgeInsets.only(left: 18.w),
                            child: Row(
                              children: [
                                Text(
                                  '\$ 30,932.99',
                                  style: AppTextStyles.subtitle,
                                ),
                                SizedBox(width: 10.w),
                                Icon(
                                  Icons.circle,
                                  color: AppColors.bodyColor.withOpacity(0.5),
                                  size: 10.r,
                                ),
                                SizedBox(width: 10.w),
                                Text(
                                  '45%',
                                  style: AppTextStyles.body
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(
                    width: 700.w,
                    height: 200.h,
                    child: LineChart(
                      LineChartData(
                        gridData: const FlGridData(show: false),
                        titlesData: FlTitlesData(
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 32,
                              interval: 1,
                              getTitlesWidget: bottomTitleWidgets,
                            ),
                          ),
                          rightTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 28,
                              interval: 1,
                              getTitlesWidget: rightTitlesWidgets,
                            ),
                          ),
                          leftTitles: const AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: false,
                            ),
                          ),
                          topTitles: const AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: false,
                            ),
                          ),
                        ),
                        borderData: FlBorderData(
                          border: Border(
                            bottom: BorderSide(
                                color: AppColors.bodyColor.withOpacity(0.2),
                                width: 1),
                            right: BorderSide(
                              color: AppColors.bodyColor.withOpacity(0.2),
                              width: 1,
                            ),
                            top: BorderSide.none,
                            left: BorderSide.none,
                          ),
                        ),
                        lineBarsData: [
                          LineChartBarData(
                            spots: [
                              const FlSpot(1, 2),
                              const FlSpot(2, 2.8),
                              const FlSpot(3, 3.2),
                              const FlSpot(4, 2.8),
                              const FlSpot(5, 2.6),
                              const FlSpot(6, 3.9),
                              const FlSpot(7, 2.5),
                              const FlSpot(8, 2.8),
                            ],
                            isCurved: false,
                            color: Colors.orange,
                            barWidth: 2,
                            isStrokeCapRound: true,
                            dotData: const FlDotData(show: false),
                            belowBarData: BarAreaData(show: false),
                          ),
                          LineChartBarData(
                            spots: [
                              const FlSpot(1, 3),
                              const FlSpot(2, 3.8),
                              const FlSpot(3, 2.2),
                              const FlSpot(4, 3.8),
                              const FlSpot(5, 3.6),
                              const FlSpot(6, 1.9),
                              const FlSpot(7, 2),
                              const FlSpot(8, 3.8),
                            ],
                            isCurved: false,
                            color: AppColors.secondary,
                            barWidth: 2,
                            isStrokeCapRound: true,
                            dotData: const FlDotData(show: false),
                            belowBarData: BarAreaData(show: false),
                          ),
                        ],
                      ),
                      duration: const Duration(milliseconds: 150), // Optional
                      curve: Curves.linear, // Optional
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}