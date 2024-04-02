import 'package:firebase_core/firebase_core.dart';
import 'package:flickflix/firebase_options.dart';
import 'package:flickflix/source/network/network.dart';
import 'package:flickflix/source/repository/authRepository.dart';
import 'package:flickflix/source/repository/movieRepository.dart';
import 'package:flickflix/source/router/router.dart';
import 'package:flickflix/source/service/auth/cubit/auth_cubit.dart';
import 'package:flickflix/source/service/movie/cubit/genre_cubit.dart';
import 'package:flickflix/source/service/movie/cubit/movie_detail_cubit.dart';
import 'package:flickflix/source/service/movie/cubit/nowplaying_cubit.dart';
import 'package:flickflix/source/service/movie/cubit/popular_cubit.dart';
import 'package:flickflix/source/service/movie/cubit/trending_cubit.dart';
import 'package:flickflix/source/service/movie/cubit/upcoming_cubit.dart';
import 'package:flickflix/source/service/movie/cubit/videomovie_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp(router: RouterNavigation()));
}

class MyApp extends StatelessWidget {
  final RouterNavigation? router;
  const MyApp({super.key, this.router});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => AuthRepository()),
        RepositoryProvider(create: (context) => MovieRepository(network: Network())),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AuthCubit(authRepository: AuthRepository())),
          BlocProvider(create: (context) => NowplayingCubit(movieRepository: MovieRepository(network: Network()))),
          BlocProvider(create: (context) => PopularCubit(movieRepository: MovieRepository(network: Network()))),
          BlocProvider(create: (context) => UpcomingCubit(movieRepository: MovieRepository(network: Network()))),
          BlocProvider(create: (context) => TrendingCubit(movieRepository: MovieRepository(network: Network()))),
          BlocProvider(create: (context) => GenreCubit(movieRepository: MovieRepository(network: Network()))),
          BlocProvider(create: (context) => MovieDetailCubit(movieRepository: MovieRepository(network: Network()))),
          BlocProvider(create: (context) => VideomovieCubit(movieRepository: MovieRepository(network: Network()))),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme(
              primary: Color(0XFF124076), // warna biru tua
              secondary: Colors.white, // warna putih
              surface: Colors.white, // warna putih
              background: Colors.white, // warna putih
              error: Color(0XFFD24545), // warna merah untuk kesalahan
              onPrimary: Colors.white, // warna teks pada latar belakang utama
              onSecondary: Colors.black, // warna teks pada latar belakang sekunder
              onSurface: Colors.black, // warna teks pada permukaan
              onBackground: Colors.black, // warna teks pada latar belakang
              onError: Colors.white, // warna teks untuk kesalahan
              brightness: Brightness.light, // mode terang
            ),
            useMaterial3: true,
          ),
          builder: EasyLoading.init(),
          onGenerateRoute: router!.generateRoute,
        ),
      ),
    );
  }
}
