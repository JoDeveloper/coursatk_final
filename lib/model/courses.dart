import 'dart:convert';

class Course {
  final String name;

  Course({
    this.name,
  });

  Course copyWith({
    String name,
  }) {
    return Course(
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }

  static Course fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Course(
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  static Course fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'Course name: $name';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Course && o.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}
