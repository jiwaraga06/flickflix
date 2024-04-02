import 'package:flickflix/source/pages/Auth/login.dart';
import 'package:flickflix/source/pages/Auth/register.dart';
import 'package:flickflix/source/pages/Auth/splash.dart';
import 'package:flickflix/source/pages/Dashboard/Home/DetailMovie/detailMovie.dart';
import 'package:flickflix/source/pages/Dashboard/Home/NowPlaying/nowPlayingAll.dart';
import 'package:flickflix/source/pages/Dashboard/Home/Popular/popularAll.dart';
import 'package:flickflix/source/pages/Dashboard/Home/UpComing/upComingAll.dart';
import 'package:flickflix/source/pages/Dashboard/home.dart';
import 'package:flickflix/source/router/string.dart';
import 'package:flutter/material.dart';

class RouterNavigation {
  Route? generateRoute(RouteSettings settings) {
    SlideTransition bottomToTop(context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(position: animation.drive(tween), child: child);
    }

    SlideTransition topToBottom(context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, -1.0);
      const end = Offset.zero;
      const curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(position: animation.drive(tween), child: child);
    }

    SlideTransition rightToLeft(context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);
      return SlideTransition(position: offsetAnimation, child: child);
    }

    SlideTransition leftToRight(context, animation, secondaryAnimation, child) {
      const begin = Offset(-1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);
      return SlideTransition(position: offsetAnimation, child: child);
    }

    switch (settings.name) {
      case splashScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const SplashScreen(),
          transitionsBuilder: bottomToTop,
        );
      case loginScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const LoginScreen(),
          transitionsBuilder: bottomToTop,
        );
      case registerScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const RegisterScreen(),
          transitionsBuilder: bottomToTop,
        );
      case homeScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const HomeScreen(),
          transitionsBuilder: bottomToTop,
        );
      case movieDetailScreen:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) => const DetailMovieScreen(),
          transitionsBuilder: rightToLeft,
        );
      case popularScreen:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) => const PopularScreen(),
          transitionsBuilder: bottomToTop,
        );
      case upComingScreen:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) => const UpComingScreen(),
          transitionsBuilder: bottomToTop,
        );
      case nowPlayingScreen:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) => const NowPlayingScreen(),
          transitionsBuilder: bottomToTop,
        );
      default:
        return null;
    }
  }
}
