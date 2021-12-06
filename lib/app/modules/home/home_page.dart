import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:gameplay/app/shared/auth/auth_controller.dart';
import 'package:gameplay/app/theme/app_colors.dart';
import 'package:gameplay/app/theme/app_text_styles.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final AuthController authController = Modular.get();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Padding(
          padding: EdgeInsets.only(
            left: 24,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    children: [
                      Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          image: DecorationImage(
                            image: NetworkImage(authController.user!.photoURL!),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 90),
                        child: Text.rich(
                          TextSpan(
                            text: 'Olá, ',
                            style: TextStyles.heading24Medium,
                            children: [
                              TextSpan(
                                text:
                                    '${authController.user!.displayName!.split(' ')[0]} \n',
                                style: TextStyles.heading24,
                                children: [
                                  TextSpan(
                                    text: 'Hoje é dia de vitória',
                                    style: TextStyles.text13,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Modular.to.pushNamed('/schedule/');
                        },
                        child: Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: Color(0xffE51C44),
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                          child: Icon(
                            Icons.add,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Text(
                    'Partidas agendadas',
                    style: TextStyles.heading18,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 24),
                  child: Row(
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        child: Image.network(
                          'https://yt3.ggpht.com/a8do10Of8KHQMj-mhkcYj88IjBDdBZ1Fd7oy1D1H1ohDWOfSLUigPEeDyUsYhesVdK51N5DSoAM=s900-c-k-c0x00ffffff-no-rj',
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .768,
                        padding: EdgeInsets.only(left: 20, top: 2),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              padding: EdgeInsets.only(bottom: 4),
                              child: Text(
                                'Valorosos',
                                style: TextStyles.heading18,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text(
                                'League of Legends',
                                style: TextStyles.text13,
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.date_range_outlined,
                                    size: 16,
                                    color: Color(0xffE51C44),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 12),
                                    child: Text(
                                      'Sex 18/06 às 21:00h',
                                      style: TextStyles.text13,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Divider(
                              thickness: 1,
                              endIndent: 1,
                              color: AppColors.shapeBoxes,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 24),
                  child: Row(
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        child: Image.network(
                          'https://yt3.ggpht.com/a8do10Of8KHQMj-mhkcYj88IjBDdBZ1Fd7oy1D1H1ohDWOfSLUigPEeDyUsYhesVdK51N5DSoAM=s900-c-k-c0x00ffffff-no-rj',
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .768,
                        padding: EdgeInsets.only(left: 20, top: 2),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              padding: EdgeInsets.only(bottom: 4),
                              child: Text(
                                'Valorosos',
                                style: TextStyles.heading18,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text(
                                'League of Legends',
                                style: TextStyles.text13,
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.date_range_outlined,
                                    size: 16,
                                    color: Color(0xffE51C44),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 12),
                                    child: Text(
                                      'Sex 18/06 às 21:00h',
                                      style: TextStyles.text13,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Divider(
                              thickness: 1,
                              endIndent: 1,
                              color: AppColors.shapeBoxes,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 24),
                  child: Row(
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        child: Image.network(
                          'https://yt3.ggpht.com/a8do10Of8KHQMj-mhkcYj88IjBDdBZ1Fd7oy1D1H1ohDWOfSLUigPEeDyUsYhesVdK51N5DSoAM=s900-c-k-c0x00ffffff-no-rj',
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .768,
                        padding: EdgeInsets.only(left: 20, top: 2),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              padding: EdgeInsets.only(bottom: 4),
                              child: Text(
                                'Valorosos',
                                style: TextStyles.heading18,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text(
                                'League of Legends',
                                style: TextStyles.text13,
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.date_range_outlined,
                                    size: 16,
                                    color: Color(0xffE51C44),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 12),
                                    child: Text(
                                      'Sex 18/06 às 21:00h',
                                      style: TextStyles.text13,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Divider(
                              thickness: 1,
                              endIndent: 1,
                              color: AppColors.shapeBoxes,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 24),
                  child: Row(
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        child: Image.network(
                          'https://yt3.ggpht.com/a8do10Of8KHQMj-mhkcYj88IjBDdBZ1Fd7oy1D1H1ohDWOfSLUigPEeDyUsYhesVdK51N5DSoAM=s900-c-k-c0x00ffffff-no-rj',
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .768,
                        padding: EdgeInsets.only(left: 20, top: 2),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              padding: EdgeInsets.only(bottom: 4),
                              child: Text(
                                'Valorosos',
                                style: TextStyles.heading18,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text(
                                'League of Legends',
                                style: TextStyles.text13,
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.date_range_outlined,
                                    size: 16,
                                    color: Color(0xffE51C44),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 12),
                                    child: Text(
                                      'Sex 18/06 às 21:00h',
                                      style: TextStyles.text13,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Divider(
                              thickness: 1,
                              endIndent: 1,
                              color: AppColors.shapeBoxes,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
