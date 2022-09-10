class StudentModel {
  String? department;
  String? name;
  String? rollnum;
  String? semester;
  StudentModel({this.department, this.name, this.rollnum, this.semester});
  factory StudentModel.fromMap(map) {
    return StudentModel(
        department: map['department'],
        name: map['name'],
        rollnum: map['rollnum'],
        semester: map['semester']);
  }
  Map<String, dynamic> toMap() {
    return {
      'department': department,
      'name': name,
      'rollnum': rollnum,
      'semester': semester
    };
  }
}
