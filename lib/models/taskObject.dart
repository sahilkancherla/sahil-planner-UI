class TaskObject {
  final int id;
  final String taskName;
  final String notes;

  TaskObject({this.id, this.taskName, this.notes});
  Map<String, dynamic> toMap() {
    return {'id': id, 'taskName': taskName, 'notes': notes};
  }
}
