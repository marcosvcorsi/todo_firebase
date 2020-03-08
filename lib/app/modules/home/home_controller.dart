import 'package:mobx/mobx.dart';
import 'package:todo_firebase/app/modules/home/models/todo_model.dart';
import 'package:todo_firebase/app/modules/home/repositories/todo_repository_inteface.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final ITodoRepository repository;

  @observable
  ObservableStream<List<TodoModel>> todoList;

  _HomeControllerBase(ITodoRepository this.repository) {
    getList();
  }

  @action
  getList() {
    todoList = repository.getTodos().asObservable();
  }
}
