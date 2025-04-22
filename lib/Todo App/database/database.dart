

import 'package:hive/hive.dart';

class TodoDataBase{

  List todoList = [];

  final _myBox = Hive.box('mybox');

  void createData(){
    todoList = [
      ['TODO', false],
      ['TODO', false],
      ['TODO', false],
    ];
  }

  void loadData(){
    todoList = _myBox.get('TODOLIST');
  }

  void updateDataBase(){
    _myBox.put('TODOLIST', todoList);
  }
}