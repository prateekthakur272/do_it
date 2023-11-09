class Task{
  final int id;
  final String title;
  final String description;
  final TaskStatus status;
  const Task(this.id, this.title, this.description, this.status);
}

enum TaskStatus{
  done,
  pending
}