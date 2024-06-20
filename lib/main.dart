import 'package:dumy_project/screens/invoice.dart';
import 'package:dumy_project/screens/pdf.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const InvoiceGenerator());
}

class InvoiceGenerator extends StatelessWidget {
  const InvoiceGenerator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Details(),
        '/pdf': (context) => pdfPage(),
      },
    );
  }
}
