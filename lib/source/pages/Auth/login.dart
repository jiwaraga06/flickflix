import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flickflix/source/Env/env.dart';
import 'package:flickflix/source/router/string.dart';
import 'package:flickflix/source/service/auth/cubit/auth_cubit.dart';
import 'package:flickflix/source/widget/awesomeSnackbar.dart';
import 'package:flickflix/source/widget/customButton.dart';
import 'package:flickflix/source/widget/customfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  bool hidePassword = true;
  void hidePass() {
    setState(() {
      hidePassword = !hidePassword;
    });
  }

  void login() async {
    BlocProvider.of<AuthCubit>(context).login(controllerEmail.text, controllerPassword.text);
    // var result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: controllerEmail.text, password: controllerPassword.text);
  }

  @override
  void dispose() {
    controllerEmail.clear();
    controllerPassword.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthLoginLoading) {
              EasyLoading.show();
            }
            if (state is AuthLoginLoaded) {
              EasyLoading.dismiss();
              var user = state.user;
              if (user == null) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentMaterialBanner()
                  ..showMaterialBanner(MySnackbar.errorbanner("Opss !", messageAuthError));
              } else {
                Navigator.pushNamedAndRemoveUntil(context, homeScreen, (route) => false);
              }
            }
          },
          child: SafeArea(
            child: Center(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Login", style: GoogleFonts.secularOne(fontSize: 48)),
                            const SizedBox(height: 6),
                            Text("Account", style: GoogleFonts.secularOne(fontSize: 48)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Form(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 8),
                              Text("Email", style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold)),
                              const SizedBox(height: 8),
                              CustomField(
                                obsecuretext: false,
                                controller: controllerEmail,
                                style: GoogleFonts.poppins(fontSize: 16),
                              ),
                              const SizedBox(height: 20),
                              Text("Password", style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold)),
                              const SizedBox(height: 8),
                              CustomField(
                                obsecuretext: hidePassword,
                                controller: controllerPassword,
                                style: GoogleFonts.poppins(fontSize: 16),
                                suffixIcon: InkWell(onTap: hidePass, child: hidePassword ? Icon(Icons.visibility) : Icon(Icons.visibility_off)),
                              ),
                              const SizedBox(height: 8),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 50),
                      Padding(
                        padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: CustomButton(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                            text: "LOGIN",
                            onPressed: login,
                            textStyle: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(height: 50),
                      Padding(
                        padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Have you not got ", style: GoogleFonts.poppins(fontSize: 15)),
                                Text("an account yet?", style: GoogleFonts.poppins(fontSize: 15)),
                              ],
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, registerScreen);
                                },
                                child: Text(
                                  "CREATE ACCOUNT",
                                  style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                                )),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                      //   child: SizedBox(
                      //     width: double.infinity,
                      //     child: TextButton(
                      //         onPressed: () {
                      //           Navigator.pushNamed(context, registerScreen);
                      //         },
                      //         child: Text(
                      //           "CREATE ACCOUNT",
                      //           style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                      //         )),
                      //   ),
                      // ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
