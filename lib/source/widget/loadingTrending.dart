import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingTrending extends StatelessWidget {
  const LoadingTrending({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400.0,
      height: 200.0,
      child: Shimmer.fromColors(
          baseColor: Color(0XFFEEEDEB),
          highlightColor: Color(0XFFDCF2F1),
          child: Container(
            color: Colors.grey,
          )),
    );
  }
}
