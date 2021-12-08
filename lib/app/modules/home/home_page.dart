import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:gameplay/app/modules/details/details_store.dart';
import 'package:gameplay/app/modules/home/home_store.dart';
import 'package:gameplay/app/modules/home/models/home_model.dart';
import 'package:gameplay/app/shared/auth/auth_controller.dart';
import 'package:gameplay/app/theme/app_colors.dart';
import 'package:gameplay/app/theme/app_text_styles.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final AuthController authController = Modular.get();
  final HomeStore controller = Modular.get();
  final detailsController = Modular.get<DetailsStore>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Padding(
          padding: EdgeInsets.only(
            left: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        authController.logOut();
                      },
                      child: Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          image: DecorationImage(
                            image: NetworkImage(authController.user!.photoURL!),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 140),
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
              Observer(builder: (_) {
                if (controller.todoList!.hasError) {
                  return Center(
                    child: ElevatedButton(
                      child: Text('Button'),
                      onPressed: () {
                        controller.getList;
                      },
                    ),
                  );
                }

                if (controller.todoList!.data == null) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                List<HomeModel> list = controller.todoList!.data;

                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: list.length,
                  itemBuilder: (_, i) {
                    var newList = list[i];

                    return ListTile(
                      onTap: () {
                        detailsController.title = newList.title;
                        detailsController.url = newList.url;
                        detailsController.description = newList.description;
                        detailsController.reference = newList.reference;
                        Modular.to.pushNamed('/details/');
                      },
                      leading: Image.network(
                        newList.url,
                        fit: BoxFit.fill,
                        width: 90,
                        height: 90,
                      ),
                      title: Text(
                        newList.title,
                        style: TextStyles.heading18,
                      ),
                      subtitle: Row(
                        children: [
                          Icon(
                            Icons.date_range_outlined,
                            size: 16,
                            color: Color(0xffE51C44),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 12),
                            child: Text(
                              newList.date,
                              style: TextStyles.text13,
                            ),
                          ),
                        ],
                      ),
                      trailing: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Color(0xffE51C44),
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                        child: Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}


// GestureDetector(
//                         onTap: () {},
//                         child: Container(
//                           decoration: BoxDecoration(
//                             border: Border(
//                               bottom: BorderSide(
//                                 width: .5,
//                                 color: AppColors.body,
//                               ),
//                             ),
//                           ),
//                           padding: EdgeInsets.only(top: 24, bottom: 10),
//                           child: Row(
//                             children: [
//                               Container(
//                                 width: 80,
//                                 height: 80,
//                                 child: Image.network(newList.url),
//                               ),
//                               Container(
//                                 width: MediaQuery.of(context).size.width * .5,
//                                 padding: EdgeInsets.only(top: 2),
//                                 child: Column(
//                                   crossAxisAlignment:
//                                       CrossAxisAlignment.stretch,
//                                   children: [
//                                     Container(
//                                       padding: EdgeInsets.only(bottom: 4),
//                                       child: Text(
//                                         newList.title,
//                                         style: TextStyles.heading18,
//                                       ),
// //                                     ),
//                                     Container(
//                                       child: Row(
//                                         children: [
//                                           Icon(
//                                             Icons.date_range_outlined,
//                                             size: 16,
//                                             color: Color(0xffE51C44),
//                                           ),
//                                           Container(
//                                             padding: EdgeInsets.only(left: 12),
//                                             child: Text(
//                                               newList.date,
//                                               style: TextStyles.text13,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
                                    // ),
//                                   ],
//                                 ),
//                               ),
                            
//                             ],
//                           ),
//                         ),
//                       );