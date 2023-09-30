// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:timelines/timelines.dart';

class TimeLineWidget extends StatelessWidget {
  final List<String> steps;
  const TimeLineWidget({
    Key? key,
    required this.steps,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Timeline.tileBuilder(
      shrinkWrap: true,
      builder: TimelineTileBuilder.fromStyle(
          contentsAlign: ContentsAlign.basic,
          indicatorStyle: IndicatorStyle.outlined,
          connectorStyle: ConnectorStyle.dashedLine,
          nodePositionBuilder: (context, index) => 0.05,
          endConnectorStyle: ConnectorStyle.dashedLine,
          contentsBuilder: (context, index) => Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Text(
                  steps[index],
                  softWrap: true,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              )
                  .animate(delay: 2700.ms)
                  .fadeIn(delay: (300 * index).ms)
                  .slideY(begin: 0.3, end: 0),
          itemCount: steps.length),
    )
        .animate(delay: 2400.ms)
        .fadeIn(delay: (300).ms)
        .slideY(begin: 0.2, end: 0);
  }
}
