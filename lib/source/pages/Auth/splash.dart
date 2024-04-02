import 'package:flickflix/source/router/string.dart';
import 'package:flickflix/source/service/auth/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AuthCubit>(context).session(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) async {
          if (state is AuthLoading) {}
          if (state is AuthStatus) {
            if (state.isLogedin == true) {
              await Future.delayed(const Duration(seconds: 2));
              Navigator.pushNamedAndRemoveUntil(context, homeScreen, (route) => false);
            } else {
              await Future.delayed(const Duration(seconds: 2));
              Navigator.pushNamedAndRemoveUntil(context, loginScreen, (route) => false);
            }
          }
        },
        child: Center(
          child: Shimmer.fromColors(
            baseColor: Colors.black,
            highlightColor: Colors.grey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("flick", style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 30)),
                Text("flix", style: GoogleFonts.poppins(fontStyle: FontStyle.italic, fontSize: 30))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
