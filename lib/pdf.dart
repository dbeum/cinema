// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:path_provider/path_provider.dart';
// import 'dart:io';
// Future<void> saveTicketAsPdf(String movieTitle) async {
//   final pdf = pw.Document();

//   // Customize the ticket details here
//   pdf.addPage(
//     pw.Page(
//       build: (pw.Context context) {
//         return pw.Column(
//           crossAxisAlignment: pw.CrossAxisAlignment.start,
//           children: [
//             pw.Text('Ticket Details', style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)),
//             pw.SizedBox(height: 10),
//             pw.Text('Cinema: ${ticket.cinema}', style: pw.TextStyle(fontSize: 18)),
//             pw.Text('Movie: ${ticket.movieTitle}', style: pw.TextStyle(fontSize: 18)),
//             pw.Text('Date: ${ticket.date}', style: pw.TextStyle(fontSize: 18)),
//             pw.Text('Time: ${ticket.time}', style: pw.TextStyle(fontSize: 18)),
//             pw.Text('Row: ${ticket.row}', style: pw.TextStyle(fontSize: 18)),
//             pw.Text('Seat: ${ticket.seat}', style: pw.TextStyle(fontSize: 18)),
//           ],
//         );
//       },
//     ),
//   );

//   // Get the directory for saving the file
//    final directory = await getApplicationDocumentsDirectory();
//   final file = File('${directory.path}/ticket_${ticket.movieTitle}.pdf');

//   // Save the PDF
//   await file.writeAsBytes(await pdf.save());

//   print('PDF saved to ${file.path}');
// }
