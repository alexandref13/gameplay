import 'package:flutter_modular/flutter_modular.dart';
import 'package:gameplay/app/modules/schedule/schedule_store.dart';
import 'package:flutter/material.dart';

class SchedulePage extends StatefulWidget {
  final String title;
  const SchedulePage({Key? key, this.title = 'SchedulePage'}) : super(key: key);
  @override
  SchedulePageState createState() => SchedulePageState();
}
class SchedulePageState extends State<SchedulePage> {
  final ScheduleStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}