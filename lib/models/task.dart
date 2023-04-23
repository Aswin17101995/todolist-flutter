class Task{
  String _taskName = "";
  bool _is_done = false;

  Task(name){
    _taskName = name;
  }

  void TaskDone(){
    _is_done = true;
  }
  void Setfalse(){
    _is_done = false;
  }
  String getTaskName(){
    return _taskName;
  }
  bool getIsdone(){
    return _is_done;
  }


}