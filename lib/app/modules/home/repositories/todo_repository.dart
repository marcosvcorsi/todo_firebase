import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_firebase/app/modules/home/models/todo_model.dart';
import 'package:todo_firebase/app/modules/home/repositories/todo_repository_inteface.dart';

class TodoRepository implements ITodoRepository {
  final Firestore firestore;

  TodoRepository(this.firestore);

  @override
  Stream<List<TodoModel>> getTodos() {
    return firestore
        .collection("todo")
        .orderBy("position")
        .snapshots()
        .map((query) {
      return query.documents.map((doc) {
        return TodoModel.fromDocument(doc);
      }).toList();
    });
  }
}
