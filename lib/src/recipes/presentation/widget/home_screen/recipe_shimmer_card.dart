// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class RecipeShimmerCard extends StatelessWidget {
  final BoxConstraints constraints;
  const RecipeShimmerCard({
    Key? key,
    required this.constraints,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: constraints.maxHeight * 0.24,
      margin: const EdgeInsets.fromLTRB(10, 15, 10, 0),
      decoration: BoxDecoration(
          color: const Color(0xff182032),
          borderRadius: BorderRadius.circular(20)),
      child: LayoutBuilder(builder: (context, columnCons) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Shimmer.fromColors(
              baseColor: Colors.white12,
              highlightColor: Colors.white30,
              child: Container(
                  height: constraints.maxHeight * 0.2,
                  width: constraints.maxWidth * 0.4,
                  margin: EdgeInsets.only(
                    left: columnCons.maxWidth * 0.05,
                    top: columnCons.maxHeight * 0.1,
                  ),
                  child: const Icon(
                    Icons.restaurant,
                    size: 60,
                  )),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.only(
                        top: columnCons.maxHeight * 0.2,
                        left: columnCons.maxWidth * 0.04),
                    child: Shimmer.fromColors(
                      baseColor: Colors.white12,
                      highlightColor: Colors.white30,
                      child: Text(
                        " 0cal\t\t\t\t0g protein",
                        style: TextStyle(
                            fontSize: 12, color: Colors.amberAccent[100]),
                      ),
                    )),
                Container(
                    width: constraints.maxWidth * 0.4,
                    padding: EdgeInsets.only(
                        top: 10, left: columnCons.maxWidth * 0.04),
                    child: Shimmer.fromColors(
                      baseColor: Colors.white12,
                      highlightColor: Colors.white30,
                      child: const Text(
                        "Name",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        softWrap: true,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    )),
                Expanded(
                  child: Container(
                      width: constraints.maxWidth * 0.4,
                      padding: EdgeInsets.only(
                          top: 10,
                          left: columnCons.maxWidth * 0.04,
                          bottom: 10),
                      child: Shimmer.fromColors(
                        baseColor: Colors.white12,
                        highlightColor: Colors.white30,
                        child: const Text(
                          "Description",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                          softWrap: true,
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white60,
                              fontWeight: FontWeight.w400),
                        ),
                      )),
                ),
              ],
            )
          ],
        );
      }),
    );
  }
}
