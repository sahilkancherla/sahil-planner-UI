class ClassObject {
  final int id;
  final String className;
  final String teacherName;

  ClassObject({this.id, this.className, this.teacherName});
  Map<String, dynamic> toMap() {
    return {'id': id, 'className': className, 'teacherName': teacherName};
  }
}
