import 'package:flickflix/source/Env/env.dart';
import 'package:flickflix/source/router/string.dart';
import 'package:flickflix/source/service/movie/cubit/upcoming_cubit.dart';
import 'package:flickflix/source/widget/loadingBox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class UpComing extends StatelessWidget {
  const UpComing({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Up Coming", style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.bold)),
            InkWell(
                onTap: () {
                  Navigator.pushNamed(context, upComingScreen);
                },
                child: Text("See More", style: GoogleFonts.montserrat(fontSize: 18, color: Colors.blue))),
          ],
        ),
        SizedBox(height: 12),
        BlocBuilder<UpcomingCubit, UpcomingState>(
          builder: (context, state) {
            if (state is UpcomingLoading) {
              return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: List.generate(5, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 4.0, left: 4.0),
                      child: LoadingBox(),
                    );
                  }).toList()));
            }
            var data = (state as UpcomingLoaded).upComing;
            data!.results!.shuffle();
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: data!.results!.take(5).map((e) {
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, movieDetailScreen, arguments: {"movie_id": e.id});
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: PhysicalModel(
                              color: Colors.transparent,
                              elevation: 6,
                              shadowColor: Color(0XFF124076),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16.0),
                                child: Image.network(
                                  "${baseUrlImage}/${e.posterPath}",
                                  height: 200,
                                  width: 140,
                                  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return LoadingBox();
                                  },
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Padding(
                            padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                            child: SizedBox(
                              width: 140,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    e.title!,
                                    style: GoogleFonts.mulish(fontSize: 14, fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Icon(Icons.star, color: Color(0XFFFDBF60)),
                                      const SizedBox(width: 4),
                                      Text("(${e.popularity!.toStringAsFixed(0)})")
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList()),
            );
          },
        )
      ],
    );
  }
}
