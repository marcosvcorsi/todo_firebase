import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel {
  bool check;
  String title;
  DocumentReference reference;

  TodoModel({this.check = false, this.title = '', this.reference});

  factory TodoModel.fromDocument(DocumentSnapshot doc) {
    return TodoModel(
        check: doc["check"], title: doc["title"], reference: doc.reference);
  }

  Future save() async {
    var modelMap = {
      'title': title,
      'check': check,
    };

    if (reference == null) {
      int total = (await Firestore.instance.collection("todo").getDocuments())
          .documents
          .length;

      reference = await Firestore.instance
          .collection("todo")
          .add({...modelMap, 'position': total});
    } else {
      reference.updateData(modelMap);
    }
  }

  delete() {
    return reference.delete();
  }
}
