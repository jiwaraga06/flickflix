import 'package:flickflix/source/Env/env.dart';
import 'package:flickflix/source/router/string.dart';
import 'package:flickflix/source/service/movie/cubit/nowplaying_cubit.dart';
import 'package:flickflix/source/service/movie/cubit/popular_cubit.dart';
import 'package:flickflix/source/service/movie/cubit/trending_cubit.dart';
import 'package:flickflix/source/service/movie/cubit/upcoming_cubit.dart';
import 'package:flickflix/source/widget/loadingBox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class UpComingScreen extends StatefulWidget {
  const UpComingScreen({super.key});

  @override
  State<UpComingScreen> createState() => _UpComingScreenState();
}

class _UpComingScreenState extends State<UpComingScreen> {
  void pagePlus(pageLength) {
    if (page <= pageLength) {
      setState(() {
        page++;
        BlocProvider.of<UpcomingCubit>(context).upcoming(page);
      });
    }
  }

  void pageMin(pageLength) {
    if (page > 1) {
      setState(() {
        page--;
        BlocProvider.of<UpcomingCubit>(context).upcoming(page);
      });
    }
  }

  void resetPage() {
    setState(() {
      page = 1;
      BlocProvider.of<NowplayingCubit>(context).nowPlaying(page);
      BlocProvider.of<PopularCubit>(context).popular(page);
      BlocProvider.of<UpcomingCubit>(context).upcoming(page);
      BlocProvider.of<TrendingCubit>(context).trending();
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) {
        resetPage();
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Up Coming", style: GoogleFonts.montserrat(fontWeight: FontWeight.bold)),
        ),
        body: BlocBuilder<UpcomingCubit, UpcomingState>(
          builder: (context, state) {
            if (state is UpcomingLoading) {
              return SingleChildScrollView(
                  child: Column(
                      children: List.generate(5, (index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 4.0, left: 4.0, bottom: 4.0, top: 4.0),
                  child: LoadingBox(),
                );
              }).toList()));
            }
            var data = (state as UpcomingLoaded).upComing;
            data!.results!.shuffle();
            return RefreshIndicator(
              onRefresh: () async {
                await Future.delayed(const Duration(seconds: 1));
                BlocProvider.of<UpcomingCubit>(context).upcoming(page);
              },
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: data!.results!.length,
                      itemBuilder: (context, index) {
                        var e = data!.results![index];
                        return InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, movieDetailScreen, arguments: {"movie_id": e.id});
                          },
                          child: Container(
                            margin: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      PhysicalModel(
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
                                      const SizedBox(width: 8),
                                      Flexible(
                                        flex: 2,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              e.title!,
                                              style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(height: 12),
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    const Icon(Icons.star, color: Color(0XFFFDBF60)),
                                                    const SizedBox(width: 4),
                                                    Text("(${e.popularity!.toStringAsFixed(0)})")
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
                                                  child: Text(e.releaseDate!, style: GoogleFonts.poppins(fontSize: 14)),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 20),
                                            Text("Tap Here to see Detail", style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.bold))
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            pageMin(data.totalPages);
                          },
                          icon: Icon(Icons.navigate_before, size: 30)),
                      const SizedBox(width: 12),
                      Text(page.toString(), style: TextStyle(fontSize: 17)),
                      const SizedBox(width: 12),
                      IconButton(
                          onPressed: () {
                            pagePlus(data.totalPages);
                          },
                          icon: Icon(Icons.navigate_next, size: 30)),
                    ],
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}