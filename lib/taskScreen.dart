import 'package:flutter/material.dart';
import 'package:todolist/component/listContainer.dart';
import 'package:todolist/models/task.dart';
class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  bool isChecked = false;
  String taskname = "";
  List<Task> tasks = [];

  Widget modalAddTask(BuildContext context){
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            Text("Add Task",style: TextStyle(
              color: Colors.blue,
              fontSize: 30
            ),),
            SizedBox(height: 20,),
            TextField(
              decoration:InputDecoration(
                hintText: "enter your task here"
              ),
              onChanged: (value){
                setState(() {
                  taskname = value;
                });
              },
            ),
            SizedBox(height: 20,),
            OutlinedButton(onPressed: (){
              setState(() {
                tasks.add(Task(taskname));
              });
              Navigator.pop(context);}, child: Container(
              padding: EdgeInsets.all(8),
              child: Text("Add",style: TextStyle(
                fontSize: 30
              ),),
            ))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          //TODO add new task
          showModalBottomSheet(context: context, builder: modalAddTask,
            isScrollControlled: true
          );
        },
        child: Icon(Icons.add),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 60),
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100)),
                        child: Icon(
                          Icons.list,
                          size: 40,
                          color: Colors.lightBlue,
                        ),
                      ),
                    ),
                    Text(
                      "TodoList",
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w800,
                          color: Colors.white),
                    ),
                    Text(
                      "Task count",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
                child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child:ListView.builder(itemBuilder: (context,index){
                        return TaskTile(taskTitle: tasks[index].getTaskName(), checkboxCallback: (val){
                          setState(() {
                           if(val){
                             tasks[index].TaskDone();
                           }
                           else{
                             tasks[index].Setfalse();
                           }
                          });
                        }, isChecked: tasks[index].getIsdone());
                      },itemCount: tasks.length,),
                    )))
          ],
        ),
      ),
    );
  }
}
