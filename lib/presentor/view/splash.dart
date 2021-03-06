import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusemachines_app_1/presentor/bloc/authentication/authentication_bloc.dart';
import 'package:fusemachines_app_1/presentor/view/dashboard.dart';
import 'package:fusemachines_app_1/presentor/view/login.dart';
import 'package:injectable/injectable.dart';

@injectable
class Splash extends StatefulWidget {
  static const String routeName = "/splash";

  @override
  State<StatefulWidget> createState() {
    return _SplashState();
  }
}

class _SplashState extends State<Splash> {
  void _goToLogin() {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(Login.routeName, (route) => false);
  }

  void _goToDashboard() {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(Dashboard.routeName, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        state.maybeWhen(
            orElse: () {},
            loggedIn: () {
              _goToDashboard();
            },
            logOut: () {
              _goToLogin();
            });
      },
      child: Scaffold(
        body: Center(
          child: Stack(
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  child: Hero(
                      tag: "fusemachines_image",
                      child: Image.asset('assets/graphics/fuse_machines.png')),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  child: LinearProgressIndicator(
                    minHeight: 8,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
