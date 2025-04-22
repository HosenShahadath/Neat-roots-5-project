import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:neat_roots_5_project/Todo%20App/database/database.dart';
import 'package:neat_roots_5_project/Todo%20App/utils/dialog_box.dart';
import 'package:neat_roots_5_project/Todo%20App/utils/todo_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  final _myBox = Hive.box('mybox');
  TodoDataBase db = TodoDataBase();

  @override
  void initState() {
    if(_myBox.get('TODOLIST') == null){
      db.createData();
    } else {
      db.loadData();
    }

    super.initState();
  }

  void deleteTask(int index){
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateDataBase();
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
  }

  void savedNewTask() {
    setState(() {
      db.todoList.add([_controller.text, false]);
      _controller.clear();
      Navigator.pop(context);
    });
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          Controller: _controller,
          onSave: savedNewTask,
          onCancel: () => Navigator.pop(context),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      appBar: AppBar(
        title: Text('TODO', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple[400],
        elevation: 10,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor: Colors.deepPurple[400],
        child: Icon(Icons.add, color: Colors.white),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return TodoItem(
            isChecked: db.todoList[index][1],
            todoText: db.todoList[index][0],
            onChanged: (value) {
              checkBoxChanged(value, index);
            },
            onPressed: (context) => deleteTask(index),
          );
        },
        itemCount: db.todoList.length,
      ),
    );
  }
}
