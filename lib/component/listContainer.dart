import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({Key? key,required this.taskTitle,required this.checkboxCallback,required this.isChecked}) : super(key: key);
  final taskTitle;
  final bool isChecked;
  final Function checkboxCallback;
  @override
  Widget build(BuildContext context) {

    Color getColor(){
      return isChecked ? Colors.blue : Colors.grey;
    }
    return ListTile(
      title: Text(taskTitle,style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w600,
        color: isChecked ? Colors.grey : Colors.black,
        decoration: isChecked?TextDecoration.lineThrough:TextDecoration.none
      ),),
      trailing: Transform.scale(
        scale: 1.5,
        child: Checkbox(
          value: isChecked,
          onChanged: (newval){
            checkboxCallback(newval);
        },
        ),
      ),
    );
  }
}

// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Text(taskName,style: TextStyle(
// fontSize: 30,
// decoration: checked?TextDecoration.lineThrough:null
// ),),
// Transform.scale(
// scale: 1.5,
// child: Checkbox(value: checked, onChanged:(newval){
//
// }
// ))
// ],
// );;