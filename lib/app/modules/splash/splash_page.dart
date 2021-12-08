import 'package:flutter_modular/flutter_modular.dart';
import 'package:gameplay/app/modules/splash/splash_store.dart';
import 'package:flutter/material.dart';
import 'package:gameplay/app/theme/app_colors.dart';
import 'package:mobx/mobx.dart';

class SplashPage extends StatefulWidget {
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  final SplashStore store = Modular.get();

  ReactionDisposer? disposer;

  @override
  void initState() {
    super.initState();
    disposer = autorun(
      (_) {
        store.getPage();
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    disposer!();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Image.asset('images/logo.png'),
      ),
    );
  }
}
