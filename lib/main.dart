import 'package:flutter/material.dart';
import 'package:my_tasks/TodoModel.dart';
import 'package:provider/provider.dart';

void main() => runApp(Tasks());

class Tasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Goals',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
        home: ChangeNotifierProvider(
          create: (context) {
            return TodoModel();
          },
          child: HomePage(),
        )

    );
  }

}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        title: Text("This is it", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30)),
      ),
      body: Column(
        children: <Widget>[
          // this shows the clock
          Column(),

          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                  topLeft: Radius.circular(50),
                )
              ),
              child: Consumer <TodoModel>(
                builder: (context, todo, child){
                  return ListView.builder(
                itemCount: todo.taskList.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: ListTile(
                      contentPadding: EdgeInsets.only(left:32, right:32, top:8, bottom: 8),
                      title: Text(todo.taskList[index].title, style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),),
                      subtitle: Text(todo.taskList[index].detail, style: TextStyle(fontWeight: FontWeight.w400,   color: Colors.black54),),

                      trailing: Icon(Icons.check_circle, color: Colors.green,),
                    ),
                    margin: EdgeInsets.only(bottom: 8, left: 16, right: 16),
                  );
                }
              );
                },
              )
            ),
          )
        ]
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Provider.of<TodoModel>(context).addTaskInList();
        },
      ),
    );
  }
}