// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dribbble_challenge/src/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:timelines/timelines.dart';

// ignore: must_be_immutable
class TimeLineWidget extends StatefulWidget {
  final List<String> steps;
  List<bool> isCheckedList;
  TimeLineWidget({
    Key? key,
    required this.steps,
    required this.isCheckedList,
  }) : super(key: key);

  @override
  State<TimeLineWidget> createState() => _TimeLineWidgetState();
}

class _TimeLineWidgetState extends State<TimeLineWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
            itemCount: widget.steps.length,
            itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  setState(() {
                    widget.isCheckedList[index] = !widget.isCheckedList[index];
                  });
                },
                child: CustomTimeLineWidget(
                    isCheckedList: widget.isCheckedList,
                    index: index,
                    steps: widget.steps)))
        .animate(delay: 2400.ms)
        .fadeIn(delay: (500).ms)
        .slideY(begin: 0.2, end: 0);
  }
}

class CustomTimeLineWidget extends StatelessWidget {
  final List<bool> isCheckedList;
  final int index;
  final List<String> steps;
  const CustomTimeLineWidget({
    Key? key,
    required this.isCheckedList,
    required this.index,
    required this.steps,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const dashedLine = DashedLineConnector(
      gap: 5,
      dash: 6,
      color: AppColors.timeLineColor,
    );
    const dotIndicator = DotIndicator(
      size: 25,
      color: AppColors.timeLineColor,
      child: Icon(
        Icons.check,
        size: 15,
        color: Colors.black,
      ),
    );
    const outLinedIndicator = OutlinedDotIndicator(
      size: 25,
      color: AppColors.timeLineColor,
    );
    return SizedBox(
        child: TimelineTile(
      node: TimelineNode(
          indicatorPosition: 0.25,
          startConnector: index == 0
              ? null
              : isCheckedList[index]
                  ? const SolidLineConnector(
                      color: AppColors.timeLineColor,
                    )
                  : dashedLine,
          endConnector: index == steps.length - 1
              ? null
              : isCheckedList[index]
                  ? const SolidLineConnector(
                      color: AppColors.timeLineColor,
                    )
                  : dashedLine,
          indicator: isCheckedList[index] ? dotIndicator : outLinedIndicator),
      contents: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Step ${index + 1}",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(steps[index], style: Theme.of(context).textTheme.bodySmall),
          ],
        )
            .animate(delay: 2800.ms)
            .fadeIn(delay: (350 * index).ms)
            .slideY(begin: 0.3, end: 0),
      ),
      nodePosition: 0.03,
    ));
  }
}
