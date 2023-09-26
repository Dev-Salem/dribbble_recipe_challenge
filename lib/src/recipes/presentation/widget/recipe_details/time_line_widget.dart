// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
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
      builder: TimelineTileBuilder.fromStyle(
          contentsAlign: ContentsAlign.basic,
          indicatorStyle: IndicatorStyle.outlined,
          connectorStyle: ConnectorStyle.dashedLine,
          nodePositionBuilder: (context, index) => 0.05,
          endConnectorStyle: ConnectorStyle.dashedLine,
          contentsBuilder: (context, index) => Container(
                height: 50,
                // color: Colors.blue,
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Text(
                  steps[index],
                  style: const TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 15),
                ),
              ),
          itemCount: steps.length),
    );
  }
}
