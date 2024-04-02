import 'package:firebase_auth/firebase_auth.dart';
import 'package:flickflix/source/Env/env.dart';
import 'package:flickflix/source/pages/Dashboard/Home/NowPlaying/nowPlaying.dart';
import 'package:flickflix/source/pages/Dashboard/Home/Popular/popular.dart';
import 'package:flickflix/source/pages/Dashboard/Home/Trending/trending.dart';
import 'package:flickflix/source/pages/Dashboard/Home/UpComing/upcoming.dart';
import 'package:flickflix/source/service/auth/cubit/auth_cubit.dart';
import 'package:flickflix/source/service/movie/cubit/nowplaying_cubit.dart';
import 'package:flickflix/source/service/movie/cubit/popular_cubit.dart';
import 'package:flickflix/source/service/movie/cubit/trending_cubit.dart';
import 'package:flickflix/source/service/movie/cubit/upcoming_cubit.dart';
import 'package:flickflix/source/widget/loadingBox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<NowplayingCubit>(context).nowPlaying(page);
    BlocProvider.of<PopularCubit>(context).popular(page);
    BlocProvider.of<UpcomingCubit>(context).upcoming(page);
    BlocProvider.of<TrendingCubit>(context).trending();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("flick", style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
            Text("flix", style: GoogleFonts.poppins(fontStyle: FontStyle.italic))
          ],
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.notifications_outlined)), SizedBox(width: 12)],
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.black), //BoxDecoration
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8.0)),
                accountName: Text(
                  "User",
                  style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                accountEmail: Text(user!.email!, style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black)),
                currentAccountPictureSize: Size.square(50),
                currentAccountPicture: CircleAvatar(backgroundColor: Colors.black, child: Icon(Icons.account_circle)), //circleAvatar
              ), //UserAccountDrawerHeader
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () {
                Navigator.pop(context);
                BlocProvider.of<AuthCubit>(context).logout(context);
              },
            ),
          ],
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 1));
          BlocProvider.of<NowplayingCubit>(context).nowPlaying(1);
          BlocProvider.of<PopularCubit>(context).popular(1);
          BlocProvider.of<UpcomingCubit>(context).upcoming(1);
          BlocProvider.of<TrendingCubit>(context).trending();
        },
        child: ListView(
          children: const [
            SizedBox(height: 12),
            Padding(
              padding: EdgeInsets.only(left: 18.0, right: 18.0),
              child: Trending(),
            ),
            SizedBox(height: 18),
            Padding(
              padding: EdgeInsets.only(left: 18.0, right: 18.0),
              child: NowPlaying(),
            ),
            SizedBox(height: 18),
            Padding(
              padding: EdgeInsets.only(left: 18.0, right: 18.0),
              child: Popular(),
            ),
            SizedBox(height: 18),
            Padding(
              padding: EdgeInsets.only(left: 18.0, right: 18.0),
              child: UpComing(),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
