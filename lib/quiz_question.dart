import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

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
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'C Programming Quiz'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> questions = [];
  int correctAnswers = 0;

  @override
  void initState() {
    super.initState();
    fetchQuestions();
  }

  Future<void> fetchQuestions() async {
    try {
      final response = await http.get(Uri.parse('https://www.geeksforgeeks.org/c-programming-language/'));
      if (response.statusCode == 200) {
        final document = parse(response.body);
        final elements = document.querySelectorAll('.entry-content p strong');
        setState(() {
          questions = elements.map((element) => element.text).toList();
        });
      } else {
        throw Exception('Failed to fetch questions');
      }
    } catch (e) {
      print('Error fetching questions: $e');
    }
  }

  void answerQuestion(bool isCorrect) {
    if (isCorrect) {
      setState(() {
        correctAnswers++;
      });
    }
  }

  Future<void> sendScoreByEmail(int score) async {
    final smtpServer = gmail('22cs007@charusat.edu.in', '27327@Nand');

    final message = Message()
      ..from = Address('22cs007@charusat.edu.in', 'Your Name')
      ..recipients.add('recipient_email@example.com') // Replace with user's email
      ..subject = 'Quiz Score'
      ..text = 'Your score is: $score';

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
    } catch (e) {
      print('Error sending email: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(questions[index]),
            trailing: ElevatedButton(
              onPressed: () {
                answerQuestion(true); // Assuming the user answered correctly
              },
              child: Text('Correct'),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          sendScoreByEmail(correctAnswers);
        },
        tooltip: 'Send Score',
        child: Icon(Icons.email),
      ),
    );
  }
}
