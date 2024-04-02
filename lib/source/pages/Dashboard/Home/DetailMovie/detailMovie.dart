import 'package:flickflix/source/Env/env.dart';
import 'package:flickflix/source/service/movie/cubit/movie_detail_cubit.dart';
import 'package:flickflix/source/service/movie/cubit/videomovie_cubit.dart';
import 'package:flickflix/source/widget/loadingBox.dart';
import 'package:flickflix/source/widget/loadingMovieDetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailMovieScreen extends StatefulWidget {
  const DetailMovieScreen({super.key});

  @override
  State<DetailMovieScreen> createState() => _DetailMovieScreenState();
}

class _DetailMovieScreenState extends State<DetailMovieScreen> {
  @override
  Widget build(BuildContext context) {
    final routes = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    print(routes['movie_id']);
    BlocProvider.of<MovieDetailCubit>(context).movieDetail(routes['movie_id']);
    BlocProvider.of<VideomovieCubit>(context).videoMovide(routes['movie_id']);
    return Scaffold(
        // appBar: AppBar(),
        body: BlocBuilder<MovieDetailCubit, MovieDetailState>(
      builder: (context, state) {
        if (state is MovieDetailLoading) {
          return LoadingMovieDetail();
        }
        var data = (state as MovieDetailLoaded).movieDetail;
        return ListView(
          shrinkWrap: true,
          children: [
            Stack(
              children: [
                Image.network("$baseUrlImage/${data!.backdropPath}"),
                Positioned(
                  top: 20.0,
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
                          child: Icon(Icons.navigate_before, size: 30)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PhysicalModel(
                    color: Colors.transparent,
                    elevation: 6,
                    shadowColor: Color(0XFF124076),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Image.network(
                        "${baseUrlImage}/${data.posterPath}",
                        scale: 1.0,
                        height: 200,
                        width: 140,
                        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) return child;
                          return LoadingBox();
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Flexible(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          data.title!,
                          style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          data.tagline!,
                          style: GoogleFonts.montserrat(fontSize: 14),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(Icons.watch_later_outlined, color: Color(0XFF124076), size: 16),
                                const SizedBox(width: 4),
                                Text("${data.runtime!} min")
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(Icons.star, color: Color(0XFFFDBF60)),
                                const SizedBox(width: 4),
                                Text("(${data.popularity!.toStringAsFixed(0)})")
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 6.0, right: 6.0),
                              child: Text("Release Date", style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.bold)),
                            ),
                            const SizedBox(height: 6),
                            Padding(
                              padding: const EdgeInsets.only(left: 6.0, right: 6.0),
                              child: Text(data.releaseDate!, style: GoogleFonts.poppins(fontSize: 14)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 6.0, right: 6.0),
                    child: Text("Synopsis", style: GoogleFonts.lato(fontSize: 22, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 6),
                  Padding(
                    padding: const EdgeInsets.only(left: 6.0, right: 6.0),
                    child: Text(data.overview!, style: GoogleFonts.lato(fontSize: 15)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 6.0, right: 6.0),
                    child: Text("Genre", style: GoogleFonts.lato(fontSize: 22, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 6),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SizedBox(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: data!.genres!.map((e) {
                          return Container(
                            padding: const EdgeInsets.all(4.0),
                            margin: const EdgeInsets.only(left: 4.0, right: 4.0),
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Color(0XFF124076)),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            child: Text(e.name!, style: GoogleFonts.lato(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0XFF124076))),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.share)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.download)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.bookmark_border_outlined)),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 6.0, right: 6.0),
                    child: Text("Videos", style: GoogleFonts.lato(fontSize: 22, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 6),
                  BlocBuilder<VideomovieCubit, VideomovieState>(
                    builder: (context, state) {
                      if (state is VideomovieLoading) {
                        return Container();
                      }
                      var data = (state as VideomovieLoaded).movieDetailVideo;
                      return Container(
                        color: Colors.black,
                          child: Column(
                        children: data!.results!.take(4).map((a) {
                          return Container(
                            margin: const EdgeInsets.all(8.0),
                            child: YoutubePlayer(
                              controller: YoutubePlayerController(
                                initialVideoId: a.key!,
                                flags: const YoutubePlayerFlags(autoPlay: false, mute: false),
                              ),
                              showVideoProgressIndicator: true,
                              progressIndicatorColor: Colors.amber,
                              progressColors: const ProgressBarColors(
                                playedColor: Colors.amber,
                                handleColor: Colors.amberAccent,
                              ),
                            ),
                          );
                        }).toList(),
                      ));
                    },
                  )
                ],
              ),
            ),
            const SizedBox(height: 18),
          ],
        );
      },
    ));
  }
}
