import 'package:cloud_firestore/cloud_firestore.dart';

class HomeModel {
  String title;
  String description;
  String date;
  int position;
  String url;

  DocumentReference? reference;

  HomeModel({
    this.title = '',
    this.description = '',
    this.date = '',
    this.position = 0,
    this.url = '',
    this.reference,
  });

  factory HomeModel.fromDocument(DocumentSnapshot doc) {
    return HomeModel(
      title: doc['title'],
      description: doc['description'],
      date: doc['date'],
      position: doc['position'],
      url: doc['url'],
      reference: doc.reference,
    );
  }

  Future save({
    String? title,
    String? description,
    String? date,
    String? url,
  }) async {
    if (reference == null) {
      int total = (await FirebaseFirestore.instance.collection('games').get())
          .docs
          .length;
      reference = await FirebaseFirestore.instance.collection('games').add(
        {
          'title': title,
          'description': description,
          'date': date,
          'url': url,
          'position': total,
        },
      );
    } else {
      reference!.update(
        {
          'title': title,
          'description': description,
          'date': date,
          'url': url,
        },
      );
    }
  }

  Future delete() async {
    return reference!.delete();
  }
}
