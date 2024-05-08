import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class QuizResultPage extends StatelessWidget {
  final int score;

  QuizResultPage(this.score);

  void sendEmail(BuildContext context, int score) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: '', // add your email here
      queryParameters: {
        'subject': 'Quiz Result',
        'body': 'My quiz score is $score%'
      },
    );
    
    if (await canLaunch(emailLaunchUri.toString())) {
      launch(emailLaunchUri.toString());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Could not launch email. Please check your email app.'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Your Quiz Result:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '$score%',
              style: TextStyle(fontSize: 40, color: Colors.green),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                sendEmail(context, score);
              },
              child: Text('Send Email'),
            ),
          ],
        ),
      ),
    );
  }
}
