class ClassObject {
  final int id;
  final String className;
  final String teacherName;
  final int color;

  ClassObject({this.id, this.className, this.teacherName, this.color});
  Map<String, dynamic> toMap() {
    return {'id': id, 'className': className, 'teacherName': teacherName, 'color': color};
  }
}
