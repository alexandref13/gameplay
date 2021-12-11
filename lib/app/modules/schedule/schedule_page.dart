import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gameplay/app/modules/home/home_store.dart';
import 'package:gameplay/app/modules/schedule/schedule_store.dart';
import 'package:flutter/material.dart';
import 'package:gameplay/app/modules/schedule/widget/alert/alert_widget.dart';
import 'package:gameplay/app/modules/schedule/widget/input_text/input_text.dart';
import 'package:gameplay/app/theme/app_colors.dart';
import 'package:gameplay/app/theme/app_text_styles.dart';

class SchedulePage extends StatefulWidget {
  @override
  SchedulePageState createState() => SchedulePageState();
}

class SchedulePageState extends State<SchedulePage> {
  final ScheduleStore store = Modular.get();
  final HomeStore homeStore = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          title: Text('Agendar Partida'),
          centerTitle: true,
          backgroundColor: AppColors.shapeBoxes,
          elevation: 0,
        ),
        body: Observer(
          builder: (_) {
            return store.status == ScheduleStatus.loading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Imagem',
                                    style: TextStyles.heading18,
                                  ),
                                ],
                              ),
                              Observer(
                                builder: (_) {
                                  return GestureDetector(
                                    onTap: store.pickFile,
                                    child: store.file != null
                                        ? Container(
                                            margin: EdgeInsets.only(top: 12),
                                            height: 150,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            decoration: BoxDecoration(
                                              color: AppColors.shapeBoxes,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Image.file(
                                              store.file!,
                                              fit: BoxFit.fill,
                                            ),
                                          )
                                        : Stack(
                                            children: [
                                              Container(
                                                margin:
                                                    EdgeInsets.only(top: 12),
                                                height: 150,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                decoration: BoxDecoration(
                                                  color: AppColors.shapeBoxes,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                              Positioned(
                                                top: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    .075,
                                                left: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .38,
                                                child: Icon(
                                                  Icons.upload_outlined,
                                                  size: 40,
                                                  color: AppColors.heading,
                                                ),
                                              )
                                            ],
                                          ),
                                  );
                                },
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 24,
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Nome',
                                    style: TextStyles.heading18,
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 4),
                                padding: EdgeInsets.only(left: 16),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: AppColors.shapeBoxes,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextField(
                                  controller: homeStore.title,
                                  style: TextStyles.text13,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 24, top: 10),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Dia e mês',
                                    style: TextStyles.heading18,
                                  ),
                                  InputTextWidget(
                                    controller: homeStore.day,
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  left: 6,
                                  top: 20,
                                ),
                                child: Image.asset(
                                  'images/barra.png',
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  left: 6,
                                  top: 20,
                                ),
                                child: InputTextWidget(
                                  controller: homeStore.mouth,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 60),
                                child: Column(
                                  children: [
                                    Text(
                                      'Horário',
                                      style: TextStyles.heading18,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                        left: 10,
                                      ),
                                      child: InputTextWidget(
                                        controller: homeStore.hour,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  left: 6,
                                  top: 20,
                                ),
                                child: Image.asset(
                                  'images/doisPontos.png',
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  left: 6,
                                  top: 20,
                                ),
                                child: InputTextWidget(
                                  controller: homeStore.minute,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Descrição',
                                    style: TextStyles.heading18,
                                  ),
                                  Text(
                                    'Max 100 caracteres',
                                    style: TextStyles.text13,
                                  )
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 12),
                                padding: EdgeInsets.only(left: 16),
                                height: 95,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: AppColors.shapeBoxes,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextField(
                                  controller: homeStore.description,
                                  style: TextStyles.text13,
                                  maxLength: 100,
                                  maxLines: 5,
                                  decoration: InputDecoration(
                                    counterText: '',
                                    border: InputBorder.none,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 12),
                          width: MediaQuery.of(context).size.width,
                          height: 56,
                          padding: EdgeInsets.symmetric(
                            horizontal: 24,
                          ),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                Color(0xffE51C44),
                              ),
                            ),
                            onPressed: () async {
                              await store.addList().then(
                                (value) {
                                  if (value == '0') {
                                    onAlertButtonPressed(
                                      context: context,
                                      text: 'Todos os campos são obrigatórios',
                                    );
                                  }
                                },
                              );
                            },
                            child: Text(
                              'Agendar',
                              style: TextStyles.text15,
                            ),
                          ),
                        )
                      ],
                    ),
                  );
          },
        ));
  }
}
