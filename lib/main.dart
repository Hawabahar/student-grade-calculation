import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Grade Calculator',
      home: const GradePage(),
    );
  }
}

class GradePage extends StatefulWidget {
  const GradePage({super.key});

  @override
  State<GradePage> createState() => _GradePageState();
}

class _GradePageState extends State<GradePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController marksController = TextEditingController();

  String result = "";

  void calculateGrade() {
    String name = nameController.text;
    int marks = int.parse(marksController.text);

    String grade;

    if (marks >= 80) {
      grade = "A";
    } else if (marks >= 70) {
      grade = "B";
    } else if (marks >= 60) {
      grade = "C";
    } else if (marks >= 50) {
      grade = "D";
    } else {
      grade = "F";
    }

    setState(() {
      result = "Student: $name\nMarks: $marks\nGrade: $grade";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Grade Calculator"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Student Name",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: marksController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Marks",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: calculateGrade,
              child: const Text("Calculate"),
            ),

            const SizedBox(height: 20),

            Text(
              result,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}