import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Quiz_1/quiz_question.dart';
import '../Quiz_1/quiz_screen.dart';
import '../Quiz_1/quiz_service.dart';

class UserNotifier extends ChangeNotifier {
  String userName = '';

  void updateUserName(String name) {
    userName = name;
    notifyListeners();
  }
}

class SubjectSelectionPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<Map<String, String>> subjects = [
    {'name': 'HTML', 'image': 'HTML.png'},
    {'name': 'CSS', 'image': 'css.png'},
    {'name': 'JAVA', 'image': 'java.png'},
    {'name': 'PYTHON', 'image': 'python.png'},
    {'name': 'C', 'image': 'c.png'},
    {'name': 'C++', 'image': 'c++.png'}
  ];

  SubjectSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    UserNotifier userNotifier = Provider.of<UserNotifier>(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF003c43),
        elevation: 0,
        title: Text(
          'Q U I Z A P P',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          icon: Icon(Icons.person , color: Colors.white),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF135D66),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      child: userNotifier.userName.isNotEmpty
                          ? Text(
                        userNotifier.userName[0].toUpperCase(),
                        style: TextStyle(
                          color: Color(0xFF77B0AA),
                          fontSize: 40,
                        ),
                      )
                          : Icon(
                        Icons.person,
                        size: 60,
                        color: Color(0xFF135D66),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '${userNotifier.userName ?? 'Guest'}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.assignment, color: Color(0xFF135D66)),
              title: Text('My Quiz',
              style: TextStyle(color: Color(0xFF135D66), fontWeight: FontWeight.bold),
              ),
              onTap: () {
                // Add navigation to 'My Quiz' screen
              },
            ),
            ListTile(
              leading: Icon(Icons.score, color: Color(0xFF135D66)),
              title: Text('Score',
                style: TextStyle(color: Color(0xFF135D66), fontWeight: FontWeight.bold),
              ),
              onTap: () {
                // Add navigation to 'Score' screen
              },
            ),
            ListTile(
              leading: Icon(Icons.info, color: Color(0xFF135D66)),
              title: Text('About Us',
                style: TextStyle(color: Color(0xFF135D66), fontWeight: FontWeight.bold),
              ),
              onTap: () {
                // Add navigation to 'About Us' screen
              },
            ),
            ListTile(
              leading: Icon(Icons.privacy_tip, color: Color(0xFF135D66)),
              title: Text('Privacy Policy',
                style: TextStyle(color: Color(0xFF135D66), fontWeight: FontWeight.bold),
              ),
              onTap: () {
                // Add navigation to 'Privacy Policy' screen
              },
            ),
            ListTile(
              leading: Icon(Icons.article, color: Color(0xFF135D66)),
              title: Text('Terms and Conditions',
                style: TextStyle(color: Color(0xFF135D66), fontWeight: FontWeight.bold),
              ),
              onTap: () {
                // Add navigation to 'Terms and Conditions' screen
              },
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFF135D66),
        ),
        child: Column(
          children: [
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Select a Subject',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFE3FEF7),
                ),
              ),
            ),
            Expanded( // Wrap with Expanded
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                ),
                padding: EdgeInsets.all(16.0),
                itemCount: subjects.length,
                itemBuilder: (context, index) {
                  return SubjectCard(
                    subject: subjects[index]['name']!,
                    imagePath: 'assets/logos/${subjects[index]['image']!}',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SubjectCard extends StatelessWidget {
  final QuizService quizService = QuizService();
  final String subject;
  final String imagePath;

  SubjectCard({required this.subject, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: Color(0xFF77B0AA),
      child: InkWell(
        onTap: () {
          _showDifficultyDialog(context, subject);
        },
        borderRadius: BorderRadius.circular(15.0),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 80.0,
              width: 80.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage(imagePath),
              ),
            ),
            SizedBox(height: 15.0),
            Text(
              subject,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF003c43),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDifficultyDialog(BuildContext context, String subject) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Select Difficulty"),
          backgroundColor: Color(0xFF77B0AA),
          content: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Color(0xFF77B0AA), // Changing the dropdown's background color
            ),
            child: DropdownButton<String>(
              value: 'Easy', // Default value
              style: TextStyle(color: Colors.black, fontSize: 18.0), // Styling for the dropdown items
              onChanged: (String? newValue) {
                Navigator.pop(context); // Close the dialog
                if (newValue != null) {
                  _navigateToQuizScreen(context, subject, newValue);
                }
              },
              items: <String>['Easy', 'Medium', 'Hard'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(fontSize: 16.0),
                  ),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }


  void _navigateToQuizScreen(BuildContext context, String subject, String difficulty) async {
    try {
      List<QuizQuestion> quizQuestions = await quizService.loadQuestions(subject, difficulty);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => QuizScreen(questions: quizQuestions, selectedSubject: subject),
        ),
      );
    } catch (e) {
      print('Error loading quiz questions: $e');
    }
  }
}