import 'package:dangdang_v2/app/theme/app_radius.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BloodGlucoseChart extends StatelessWidget {
  const BloodGlucoseChart({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    const dates = ['8/1', '8/2', '8/3', '8/4', '8/5', '8/6', '8/7'];

    return Container(
      width: double.infinity,
      height: 250,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: AppRadius.large,
        border: Border.all(color: colorScheme.outlineVariant, width: 1),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withValues(alpha: 0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: 6,
          minY: 50,
          maxY: 260,

          // 가로 점선
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            horizontalInterval: 50,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: colorScheme.outlineVariant,
                strokeWidth: 1,
                dashArray: [5, 5],
              );
            },
          ),

          // 그래프 외곽선
          borderData: FlBorderData(show: false),

          // X축 / Y축
          titlesData: FlTitlesData(
            // 위쪽 숫자 제거
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),

            // 오른쪽 숫자 제거
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),

            // X축 날짜
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                reservedSize: 30,
                getTitlesWidget: (value, meta) {
                  final index = value.toInt();

                  if (index < 0 || index >= dates.length) {
                    return const SizedBox.shrink();
                  }

                  return Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(dates[index], style: textTheme.labelSmall),
                  );
                },
              ),
            ),

            // Y축 혈당 수치
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 50,
                reservedSize: 40,
                getTitlesWidget: (value, meta) {
                  if (value == 50 ||
                      value == 100 ||
                      value == 150 ||
                      value == 200 ||
                      value == 250) {
                    return Text(
                      value.toInt().toString(),
                      style: textTheme.labelSmall,
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),
            ),
          ),

          // 혈당 그래프
          lineBarsData: [
            LineChartBarData(
              // UI 확인용 임시 데이터
              spots: const [
                FlSpot(0, 100),
                FlSpot(1, 125),
                FlSpot(2, 110),
                FlSpot(3, 150),
                FlSpot(4, 130),
                FlSpot(5, 175),
                FlSpot(6, 140),
              ],

              // 곡선
              isCurved: true,

              // 선 색상
              color: colorScheme.primary,

              // 선 두께
              barWidth: 3,

              // 각 혈당값의 점
              dotData: FlDotData(
                show: true,
                getDotPainter: (spot, percent, barData, index) {
                  return FlDotCirclePainter(
                    radius: 4,
                    color: colorScheme.primary,
                    strokeWidth: 2,
                    strokeColor: colorScheme.surface,
                  );
                },
              ),

              // 그래프 아래 영역
              belowBarData: BarAreaData(
                show: true,
                color: colorScheme.primary.withValues(alpha: 0.08),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
