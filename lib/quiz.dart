import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'C Programming Quiz',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DocumentationSelectionScreen(),
    );
  }
}

class DocumentationSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select C Programming Documentation'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DocumentationScreen()),
            );
          },
          child: Text('Read Documentation'),
        ),
      ),
    );
  }
}

class DocumentationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('C Programming Documentation'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              // Your C programming documentation here
              'C Programming Documentation...',
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => QuizScreen()),
          );
        },
        child: Icon(Icons.quiz),
      ),
    );
  }
}

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('C Programming Quiz'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate to quiz screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => QuizQuestionScreen()),
            );
          },
          child: Text('Start Quiz'),
        ),
      ),
    );
  }
}

class QuizQuestionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Simulated list of quiz questions
    List<String> questions = [
      'Question 1',
      'Question 2',
      // Add more questions here
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('C Programming Quiz'),
      ),
      body: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(questions[index]),
            onTap: () {
              // Navigate to quiz question detail screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => QuizQuestionDetailScreen(question: questions[index])),
              );
            },
          );
        },
      ),
    );
  }
}

class QuizQuestionDetailScreen extends StatelessWidget {
  final String question;

  QuizQuestionDetailScreen({required this.question});

  @override
  Widget build(BuildContext context) {
    // Simulated list of options for each question
    List<String> options = [
      'Option A',
      'Option B',
      'Option C',
      'Option D',
    ];

    String? selectedOption; // Store the selected option

    return Scaffold(
      appBar: AppBar(
        title: Text('C Programming Quiz'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              question,
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          // Use a Column with a single child SingleChildScrollView
          SingleChildScrollView(
            child: Column(
              children: options.map((option) {
                return RadioListTile<String>(
                  title: Text(option),
                  value: option,
                  groupValue: selectedOption,
                  onChanged: (String? value) {
                    // Update the selected option when the user selects a radio button
                    selectedOption = value;
                  },
                );
              }).toList(),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Navigate to next question or result screen
            },
            child: Text('Next'),
          ),
        ],
      ),
    );
  }
}
