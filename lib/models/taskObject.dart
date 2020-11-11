class TaskObject {
  final int id;
  final String taskName;
  final String notes;
  final String dueDate;
  //final bool important;
  final String className;
  final int isComplete;

  TaskObject({this.id, this.taskName, this.notes, this.className, this.dueDate, this.isComplete});
  Map<String, dynamic> toMap() {
    return {'id': id, 'taskName': taskName, 'notes': notes, 'className': className, 'dueDate': dueDate, 'isComplete': isComplete};
  }
}
