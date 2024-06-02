import 'package:flutter/material.dart';
import 'package:invoic_generator/screens/firstpage.dart';
import 'package:invoic_generator/screens/secondpage.dart';
void main()
{
  runApp(invoice());
}
class invoice extends StatelessWidget {
  const invoice({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/sc':(context) => Invoice_gen(),
        '/':(context) =>generator(),
      },
    );
  }
}
