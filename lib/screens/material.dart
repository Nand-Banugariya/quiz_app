// import 'package:flutter/material.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';
//
// import '../Quiz/quiz_app.dart';
//
// class NextPage extends StatefulWidget {
//   final String subject;
//
//   NextPage({required this.subject});
//
//   @override
//   _NextPageState createState() => _NextPageState();
// }
//
// class _NextPageState extends State<NextPage> {
//   late PDFViewController _pdfViewController;
//   int _pageNumber = 1;
//   int _totalPages = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Study Material - ${widget.subject}'),
//         backgroundColor: Colors.blue,
//       ),
//       backgroundColor: Colors.lightBlueAccent,
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Expanded(
//             child: PDFView(
//               filePath: "assets/pdfs/HTML_material.pdf",
//               autoSpacing: true,
//               pageSnap: true,
//               swipeHorizontal: true,
//               onRender: (total) {
//                 setState(() {
//                   _totalPages = total!;
//                 });
//               },
//               onError: (error) {
//                 print('Error: $error');
//               },
//               onPageChanged: (int? page, int? total) {
//                 if (page != null) {
//                   setState(() {
//                     _pageNumber = page;
//                   });
//                 }
//               },
//             ),
//           ),
//           SizedBox(height: 20.0),
//           ElevatedButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => QuizApp()),
//               );
//             },
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.blue,
//             ),
//             child: Text('Start Quiz'),
//           ),
//           SizedBox(height: 20.0),
//           Text('Page $_pageNumber of $_totalPages'),
//         ],
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
//
// class PDFViewer extends StatefulWidget {
//   @override
//   _PDFViewerState createState() => _PDFViewerState();
// }
//
// class _PDFViewerState extends State<PDFViewer> {
//   late PDFDocument document;
//   bool _pdfReady = false;
//
//   @override
//   void initState() {
//     super.initState();
//     loadPDF();
//   }
//
//   Future<void> loadPDF() async {
//     document = await PDFDocument.fromAsset('assets/pdfs/HTML_material.pdf');
//     setState(() {
//       _pdfReady = true;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('PDF Viewer'),
//       ),
//       body: _pdfReady
//           ? PDFViewer()
//           : Center(
//         child: CircularProgressIndicator(),
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: PDFViewer(),
//     );
//   }
// }







