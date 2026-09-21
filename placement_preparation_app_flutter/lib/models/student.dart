class Student {
  final String name;
  final String rollNumber;
  final String email;
  final String year;

  const Student({
    required this.name,
    required this.rollNumber,
    required this.email,
    required this.year,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'rollNumber': rollNumber,
      'email': email,
      'year': year,
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      name: map['name'] ?? '',
      rollNumber: map['rollNumber'] ?? '',
      email: map['email'] ?? '',
      year: map['year'] ?? '',
    );
  }
}
