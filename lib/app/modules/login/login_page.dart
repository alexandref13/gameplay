import 'package:flutter_modular/flutter_modular.dart';
import 'package:gameplay/app/modules/login/login_store.dart';
import 'package:flutter/material.dart';
import 'package:gameplay/app/theme/app_images.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widget/social_login/social_login_button.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final LoginStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff0E1647),
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Image.asset(
                  AppImages.background,
                  height: 360,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                top: 30,
                child: Image.asset(
                  AppImages.caracter,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * .6,
                left: 55,
                right: 60,
                child: Text(
                  'Conecte-se\n e organize sua\n jogatinas',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.rajdhani(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Color(0xffDDE3F0),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * .76,
                left: 55,
                right: 60,
                child: Text(
                  'Crie grupos para jogar seus games\n favoritos com seus amigos',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: Color(0xffDDE3F0),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * .82,
                left: 70,
                right: 60,
                child: SocialLoginButton(
                  onTap: () {
                    // store.googleSignIn();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
