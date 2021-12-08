import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gameplay/app/modules/details/alert/delete_alert_widget.dart';
import 'package:gameplay/app/modules/home/models/home_model.dart';
import 'package:gameplay/app/theme/app_colors.dart';
import 'package:gameplay/app/theme/app_text_styles.dart';

import 'details_store.dart';

class DetailsPage extends StatelessWidget {
  final DetailsStore controller = Modular.get();
  final HomeModel homeModel = HomeModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Text(controller.title!),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              deleteAlert(
                context: context,
                text: 'Você quer mesmo excluir seu jogo agendado?',
                function: () {
                  homeModel.delete(controller.reference);
                  Modular.to.pop();
                },
              );
            },
            icon: Icon(
              Icons.delete,
              color: AppColors.primary,
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .3,
            child: Image.network(controller.url!),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
            child: Text(
              controller.title!,
              style: TextStyles.heading28,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              controller.description!,
              style: TextStyles.text15,
            ),
          )
        ],
      ),
    );
  }
}
