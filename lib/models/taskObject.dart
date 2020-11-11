class TaskObject {
  final int id;
  final String taskName;
  final String notes;
  final String dueDate;
  //final bool important;
  final String className;
  final int isComplete;
  final int isImportant;

  TaskObject({this.id, this.taskName, this.notes, this.className, this.dueDate, this.isComplete, this.isImportant});
  Map<String, dynamic> toMap() {
    return {'id': id, 'taskName': taskName, 'notes': notes, 'className': className, 'dueDate': dueDate, 'isComplete': isComplete, 'isImportant': isImportant};
  }
}
