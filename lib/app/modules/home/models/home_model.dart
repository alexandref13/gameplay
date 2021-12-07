import 'package:cloud_firestore/cloud_firestore.dart';

class HomeModel {
  String title;
  String photo;

  DocumentReference? reference;

  HomeModel({this.title = '', this.photo = '', this.reference});

  factory HomeModel.fromDocument(DocumentSnapshot doc) {
    return HomeModel(
      title: doc['title'],
      photo: doc['photo'],
      reference: doc.reference,
    );
  }

  Future save() async {
    if (reference == null) {
      int total = (await FirebaseFirestore.instance.collection('games').get())
          .docs
          .length;
      reference = await FirebaseFirestore.instance.collection('games').add(
        {
          'title': title,
          'photo': photo,
          'position': total,
        },
      );
    } else {
      reference!.update({
        'title': title,
        'photo': photo,
      });
    }
  }

  Future delete() async {
    return reference!.delete();
  }
}
