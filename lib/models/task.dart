import 'package:do_it/database/db_helper.dart';

class Task{
  int? id;
  final String title;
  final String description;
  final TaskStatus status;

  Task(this.title, this.description, this.status);
  Task.id(this.id ,this.title, this.description, this.status);

  Map<String, Object> toMap(){
    return {
      DatabaseHelper.taskColumnTitle:title,
      DatabaseHelper.taskColumnDescription:description,
      DatabaseHelper.taskColumnStatus:status==TaskStatus.pending?0:1
    };
  }

}

enum TaskStatus{
  done,
  pending
}