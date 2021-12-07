import 'package:cloud_firestore/cloud_firestore.dart';

class HomeModel {
  String title;
  String description;
  String date;

  DocumentReference? reference;

  HomeModel(
      {this.title = '', this.description = '', this.date = '', this.reference});

  factory HomeModel.fromDocument(DocumentSnapshot doc) {
    return HomeModel(
      title: doc['title'],
      description: doc['description'],
      date: doc['date'],
      reference: doc.reference,
    );
  }

  Future save(String title, String description, String date) async {
    if (reference == null) {
      int total = (await FirebaseFirestore.instance.collection('games').get())
          .docs
          .length;
      reference = await FirebaseFirestore.instance.collection('games').add(
        {
          'title': title,
          'description': description,
          'date': date,
          'position': total,
        },
      );
    } else {
      reference!.update(
        {
          'title': title,
          'description': description,
          'date': date,
        },
      );
    }
  }

  Future delete() async {
    return reference!.delete();
  }
}
