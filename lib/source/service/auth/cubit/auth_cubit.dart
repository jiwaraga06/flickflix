import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flickflix/source/repository/authRepository.dart';
import 'package:flickflix/source/router/string.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository? authRepository;
  AuthCubit({this.authRepository}) : super(AuthInitial());

  void session(context) async {
    emit(AuthLoading());
    authRepository!.session().then((value) {
      value!.listen((user) async {
        if (user == null) {
          emit(AuthStatus(isLogedin: false));
          print("user null");
        } else {
          emit(AuthStatus(isLogedin: true));
          print("user ada");
        }
      });
    });
  }

  void login(String email, String password) {
    emit(AuthLoginLoading());
    authRepository!.signInWithEmailandPassword(email, password).then((value) {
      print("User login: $value");
      emit(AuthLoginLoaded(user: value));
    });
  }

  void register(String email, String password) {
    emit(AuthRegisterLoading());
    authRepository!.signUpWithEmailandPassword(email, password).then((value) {
      print("User create: $value");
      emit(AuthRegisterLoaded(user: value));
    });
  }

  void logout(context) async {
    authRepository!.logout();
    print("logout");
    EasyLoading.show();
    await Future.delayed(const Duration(seconds: 2));
    EasyLoading.dismiss();
     Navigator.pushNamedAndRemoveUntil(context, loginScreen, (route) => false);
  }
}
