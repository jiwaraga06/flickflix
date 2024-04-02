import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingMovieDetail extends StatelessWidget {
  const LoadingMovieDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200.0,
          child: Stack(
            children: [
              Shimmer.fromColors(
                  baseColor: Color(0XFFEEEDEB),
                  highlightColor: Color(0XFFDCF2F1),
                  child: Container(
                    color: Colors.grey,
                  )),
              Positioned(
                top: 40.0,
                left: 14.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(60.0),
                  child: PhysicalModel(
                    color: Colors.white,
                    elevation: 6,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(Icons.navigate_before, size: 30),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 200,
                width: 120,
                child: Shimmer.fromColors(
                    baseColor: Color(0XFFEEEDEB),
                    highlightColor: Color(0XFFDCF2F1),
                    child: Container(
                      color: Colors.grey,
                    )),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                    width: MediaQuery.of(context).size.width / 2,
                    child: Shimmer.fromColors(
                        baseColor: Color(0XFFEEEDEB),
                        highlightColor: Color(0XFFDCF2F1),
                        child: Container(
                          color: Colors.grey,
                        )),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 20,
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: Shimmer.fromColors(
                        baseColor: Color(0XFFEEEDEB),
                        highlightColor: Color(0XFFDCF2F1),
                        child: Container(
                          color: Colors.grey,
                        )),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 20,
                    width: MediaQuery.of(context).size.width / 3,
                    child: Shimmer.fromColors(
                        baseColor: Color(0XFFEEEDEB),
                        highlightColor: Color(0XFFDCF2F1),
                        child: Container(
                          color: Colors.grey,
                        )),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
