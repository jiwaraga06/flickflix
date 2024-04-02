import 'package:carousel_slider/carousel_slider.dart';
import 'package:flickflix/source/Env/env.dart';
import 'package:flickflix/source/router/string.dart';
import 'package:flickflix/source/service/movie/cubit/trending_cubit.dart';
import 'package:flickflix/source/widget/loadingBox.dart';
import 'package:flickflix/source/widget/loadingTrending.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class Trending extends StatelessWidget {
  const Trending({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Shimmer.fromColors(
              baseColor: Colors.black,
              highlightColor: Colors.grey,
              child: Text('Trending', style: GoogleFonts.montserrat(fontSize: 25, fontWeight: FontWeight.bold)),
            ),
            Shimmer.fromColors(
              baseColor: Color(0XFFFDBF60),
              highlightColor: Colors.white,
              child: Icon(
                Icons.electric_bolt_outlined,
                size: 30,
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
        BlocBuilder<TrendingCubit, TrendingState>(
          builder: (context, state) {
            if (state is TrendingLoading) {
              return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: List.generate(5, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 4.0, left: 4.0),
                      child: LoadingTrending(),
                    );
                  }).toList()));
            }
            var data = (state as TrendingLoaded).trending;
            data!.results!.shuffle();
            return CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                scrollDirection: Axis.horizontal,
              ),
              items: data!.results!.take(5).map((e) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, movieDetailScreen, arguments: {"movie_id": e.id});
                  },
                  child: Container(
                    child: PhysicalModel(
                      color: Colors.transparent,
                      elevation: 6,
                      shadowColor: Color(0XFF124076),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Stack(
                          children: [
                            Image.network(
                              "$baseUrlImage/${e.backdropPath}",
                              fit: BoxFit.fill,
                              height: 500,
                            ),
                            Positioned(
                              bottom: 0.0,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.all(12),
                                alignment: Alignment.bottomLeft,
                                height: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [Colors.black, Colors.transparent],
                                  ),
                                ),
                                child: Text(
                                  e.title!,
                                  style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            );
            // return SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Row(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: data!.results!.take(5).map((e) {
            //         return Column(
            //           mainAxisAlignment: MainAxisAlignment.end,
            //           children: [
            //             Padding(
            //               padding: const EdgeInsets.only(right: 8.0),
            //               child: PhysicalModel(
            //                 color: Colors.transparent,
            //                 elevation: 6,
            //                 shadowColor: Color(0XFF124076),
            //                 child: ClipRRect(
            //                   borderRadius: BorderRadius.circular(16.0),
            //                   child: Image.network(
            //                     "${baseUrlImage}/${e.posterPath}",
            //                     height: 200,
            //                     width: 140,
            //                   ),
            //                 ),
            //               ),
            //             ),
            //           ],
            //         );
            //       }).toList()),
            // );
          },
        )
      ],
    );
  }
}
