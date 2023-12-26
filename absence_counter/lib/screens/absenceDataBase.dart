import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

var database;
void initialize() async {
  // Avoid errors caused by flutter upgrade.
  // Importing 'package:flutter/widgets.dart' is required.
  WidgetsFlutterBinding.ensureInitialized();
  // Open the database and store the reference.
  database = openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    join(await getDatabasesPath(), 'absence_5.db'),
    // When the database is first created, create a table to store students.
    onCreate: (db, version) async {
      // Run the CREATE TABLE statement on the database.
      await db.execute(
        'CREATE TABLE student(id INTEGER PRIMARY KEY, name TEXT)'
      );
      await db.execute(
        'CREATE TABLE class(id INTEGER PRIMARY KEY, name TEXT)'
      );
      await db.execute(
        'CREATE TABLE student_class(studentId INTEGER, classId INTEGER, absenceNumber INTEGER,'
            'FOREIGN KEY (studentId) REFERENCES student(id),'
            'FOREIGN KEY (classId) REFERENCES class(id),'
            'PRIMARY KEY (studentId, classId))'
      );
      return;
    },
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 1,
  );
}

Future<void> insertStudents(int classID) async {
  // Create a Student and add it to the Student table
  var afonso = const Student(
    id: 202008014,
    name: 'Afonso da Silva Pinto',
  );

  var david = const Student(
    id: 202006302,
    name: 'David dos Santos Ferreira',
  );

  var joao = const Student(
    id: 201905892,
    name: 'João Miguel Ferreira de Araújo Pinto Correia',
  );

  var ines = const Student(
    id: 202005545,
    name: 'Linda Inês de Pina Marques Rodrigues',
  );

  var monica = const Student(
    id: 201905753,
    name: 'Mónica Moura Pereira',
  );

  var tiago = const Student(
    id: 201905653,
    name: 'Tiago Mairos',
  );

  var ana = const Student(
    id: 201905652,
    name: 'Ana dos Santos Lisboa',
  );

  var oliveira = const Student(
    id: 202009029,
    name: 'Ana Catarina da Silva Oliveira',
  );

  var pinheiro = const Student(
    id: 202006059,
    name: 'Diogo Pinheiro Almeida',
  );

  var castro = const Student(
    id: 202006770,
    name: 'Hugo Reis de Castro',
  );

  var amaral = const Student(
    id: 202006677,
    name: 'Isabel André Amaral',
  );

  var guarniero = const Student(
    id: 201603903,
    name: 'Marcelo Guarniero Apolinário',
  );

  var lessa = const Student(
    id: 201900194,
    name: 'Matias Lessa Vaz',
  );

  var milena = const Student(
    id: 202008862,
    name: 'Milena Luísa Pereira Gouveia',
  );

  var manuel = const Student(
    id: 201704976,
    name: 'Tomás Manuel de Moura Duarte Agante Martins',
  );

  var henriques = const Student(
    id: 202006141,
    name: 'Jose Manuel Henriques Valente Marques de Sousa',
  );

  var braga = const Student(
    id: 201907095,
    name: 'Nuno Miguel Braga Ramos Antunes',
  );

  await insertStudent(afonso);
  await insertStudent(david);
  await insertStudent(joao);
  await insertStudent(ines);
  await insertStudent(monica);
  await insertStudent(ana);
  await insertStudent(tiago);
  await insertStudent(oliveira);
  await insertStudent(pinheiro);
  await insertStudent(castro);
  await insertStudent(amaral);
  await insertStudent(guarniero);
  await insertStudent(lessa);
  await insertStudent(milena);
  await insertStudent(manuel);
  await insertStudent(henriques);
  await insertStudent(braga);

  // adicionar alunos às aulas
  var student_class = StudentClass(
    classId: classID,
    studentId: 202008014,
    absenceNumber: 0,
  );
  var student_class_1 = StudentClass(
    classId: classID,
    studentId: 202009029,
    absenceNumber: 0,
  );
  var student_class_2 = StudentClass(
    classId: classID,
    studentId: 201905652,
    absenceNumber: 0,
  );
  var student_class_3 = StudentClass(
    classId: classID,
    studentId: 202006302,
    absenceNumber: 0,
  );
  var student_class_4 = StudentClass(
    classId: classID,
    studentId: 202006059,
    absenceNumber: 0,
  );
  var student_class_5 = StudentClass(
    classId: classID,
    studentId: 202006770,
    absenceNumber: 0,
  );
  var student_class_6 = StudentClass(
    classId: classID,
    studentId: 202006677,
    absenceNumber: 0,
  );
  var student_class_7 = StudentClass(
    classId: classID,
    studentId: 201906141,
    absenceNumber: 0,
  );
  var student_class_8 = StudentClass(
    classId: classID,
    studentId: 201905892,
    absenceNumber: 0,
  );
  var student_class_9 = StudentClass(
    classId: classID,
    studentId: 202005545,
    absenceNumber: 0,
  );
  var student_class_10 = StudentClass(
    classId: classID,
    studentId: 201603903,
    absenceNumber: 0,
  );
  var student_class_11 = StudentClass(
    classId: classID,
    studentId: 201900194,
    absenceNumber: 0,
  );
  var student_class_12 = StudentClass(
    classId: classID,
    studentId: 202008862,
    absenceNumber: 0,
  );
  var student_class_13 = StudentClass(
    classId: classID,
    studentId: 201907095,
    absenceNumber: 0,
  );
  var student_class_14 = StudentClass(
    classId: classID,
    studentId: 201905753,
    absenceNumber: 0,
  );
  var student_class_15 = StudentClass(
    classId: classID,
    studentId: 201704976,
    absenceNumber: 0,
  );

  await insertStudentClass(student_class);
  await insertStudentClass(student_class_1);
  await insertStudentClass(student_class_2);
  await insertStudentClass(student_class_3);
  await insertStudentClass(student_class_4);
  await insertStudentClass(student_class_5);
  await insertStudentClass(student_class_6);
  await insertStudentClass(student_class_7);
  await insertStudentClass(student_class_8);
  await insertStudentClass(student_class_9);
  await insertStudentClass(student_class_10);
  await insertStudentClass(student_class_11);
  await insertStudentClass(student_class_12);
  await insertStudentClass(student_class_13);
  await insertStudentClass(student_class_14);
  await insertStudentClass(student_class_15);

}

// Define a function that inserts student into the database
Future<void> insertStudent(Student student) async {
  // Get a reference to the database.
  final db = await database;

  // Insert the Student into the correct table. You might also specify the
  // `conflictAlgorithm` to use in case the same student is inserted twice.
  //
  // In this case, replace any previous data.
  await db.insert(
    'student',
    student.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

// A method that retrieves all the students from the student table.
Future<List<Student>> students() async {
  // Get a reference to the database.
  final db = await database;

  // Query the table for all The Students.
  final List<Map<String, dynamic>> maps = await db.query('student');

  // Convert the List<Map<String, dynamic> into a List<Student>.
  List<Student> list =  List.generate(maps.length, (i) {
    return Student(
      id: maps[i]['id'],
      name: maps[i]['name'],
    );
  });
  list.sort((a, b) {
    return a.name.toString().toLowerCase().compareTo(b.name.toString().toLowerCase());
  });
  return list;
}

Future<void> updateStudent(Student student) async {
  // Get a reference to the database.
  final db = await database;

  // Update the given Student.
  await db.update(
    'student',
    student.toMap(),
    // Ensure that the student has a matching id.
    where: 'id = ?',
    // Pass the Student's id as a whereArg to prevent SQL injection.
    whereArgs: [student.id],
  );
}

Future<void> deleteStudent(int id) async {
  // Get a reference to the database.
  final db = await database;

  // Remove the Student from the database.
  await db.delete(
    'student',
    // Use a `where` clause to delete a specific student.
    where: 'id = ?',
    // Pass the Student's id as a whereArg to prevent SQL injection.
    whereArgs: [id],
  );
}

class Student {
  final int id;
  final String name;

  const Student({
    required this.id,
    required this.name,
  });

  // Convert a Student into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  // Implement toString to make it easier to see information about
  // each student when using the print statement.
  @override
  String toString() {
    return 'Student{id: $id, name: $name}';
  }
}

// Define a function that inserts student into the database
Future<void> insertClass(Class class_) async {
  // Get a reference to the database.
  final db = await database;

  // Insert the Student into the correct table. You might also specify the
  // `conflictAlgorithm` to use in case the same student is inserted twice.
  //
  // In this case, replace any previous data.
  await db.insert(
    'class',
    class_.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

// A method that retrieves all the students from the student table.
Future<List<Class>> classes() async {
  // Get a reference to the database.
  final db = await database;

  // Query the table for all The Students.
  final List<Map<String, dynamic>> maps = await db.query('class');

  // Convert the List<Map<String, dynamic> into a List<Student>.
  List<Class> list =  List.generate(maps.length, (i) {
    return Class(
      id: maps[i]['id'],
      name: maps[i]['name'],
    );
  });
  return list;
}

Future<void> updateClass(Class class_) async {
  // Get a reference to the database.
  final db = await database;

  // Update the given Student.
  await db.update(
    'class',
    class_.toMap(),
    // Ensure that the student has a matching id.
    where: 'id = ?',
    // Pass the Student's id as a whereArg to prevent SQL injection.
    whereArgs: [class_.id],
  );
}

Future<void> deleteClass(int id) async {
  // Get a reference to the database.
  final db = await database;

  // Remove the Student from the database.
  await db.delete(
    'class',
    // Use a `where` clause to delete a specific student.
    where: 'id = ?',
    // Pass the Student's id as a whereArg to prevent SQL injection.
    whereArgs: [id],
  );
}


class Class {
  final int id;
  final String name;

  const Class({
    required this.id,
    required this.name,
  });

  // Convert a Student into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  // Implement toString to make it easier to see information about
  // each student when using the print statement.
  @override
  String toString() {
    return 'Class{id: $id, name: $name}';
  }
}

// Define a function that inserts student into the database
Future<void> insertStudentClass(StudentClass studentClass) async {
  // Get a reference to the database.
  final db = await database;

  // Insert the Student into the correct table. You might also specify the
  // `conflictAlgorithm` to use in case the same student is inserted twice.
  //
  // In this case, replace any previous data.
  await db.insert(
    'student_class',
    studentClass.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

// A method that retrieves all the students from the student table.
Future<List<StudentClass>> studentClasses() async {
  // Get a reference to the database.
  final db = await database;

  // Query the table for all The Students.
  final List<Map<String, dynamic>> maps = await db.query('student_class');

  // Convert the List<Map<String, dynamic> into a List<Student>.
  List<StudentClass> list =  List.generate(maps.length, (i) {
    return StudentClass(
      studentId: maps[i]['studentId'],
      classId: maps[i]['classId'],
      absenceNumber: maps[i]['absenceNumber'],
    );
  });
  list.sort((a, b) {
    return b.absenceNumber.compareTo(a.absenceNumber);
  });
  return list;
}

Future<void> updateStudentClass(StudentClass studentClass) async {
  // Get a reference to the database.
  final db = await database;

  // Update the given Student.
  await db.update(
    'student_class',
    studentClass.toMap(),
    // Ensure that the student has a matching id.
    where: 'studentId = ? and classId = ?',
    // Pass the Student's id as a whereArg to prevent SQL injection.
    whereArgs: [studentClass.studentId, studentClass.classId],
  );
}

class StudentClass {
  final int studentId;
  final int classId;
  final int absenceNumber;

  const StudentClass({
    required this.studentId,
    required this.classId,
    required this.absenceNumber,
  });

  // Convert a Student into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'studentId': studentId,
      'classId': classId,
      'absenceNumber': absenceNumber,
    };
  }

  // Implement toString to make it easier to see information about
  // each student when using the print statement.
  @override
  String toString() {
    return 'StudentClass{studentId: $studentId, classId: $classId, absenceNumber: $absenceNumber}';
  }
}