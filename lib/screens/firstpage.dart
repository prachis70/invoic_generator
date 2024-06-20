
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import 'global.dart';


class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        leading: Icon(
          Icons.menu,
          color: Colors.white,
        ),
        title: Text(
          'Invoice Generator',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/pdf');
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Icon(Icons.print,color: Colors.white,),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...List.generate(
              ProductList.length,
                  (index) => Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      height: 80,
                      width: 500,
                      decoration: BoxDecoration(color: Colors.white, boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0, 2),
                          blurRadius: 2,
                          spreadRadius: 2,
                        )
                      ]),
                      child: ListTile(
                        leading: Text((index + 1).toString()),
                        title: Text(ProductList[index].name!),
                        subtitle: Text(ProductList[index].category!),
                        trailing: Text(ProductList[index].price!),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            ProductList.add(ProductModel(
                name: 'AC', category: 'HouseHold', price: '50000'));
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
Future<Uint8List> generatePdf() async {
  final pdf = pw.Document();
  pdf.addPage(
    pw.Page(
        build: (context) => pw.Row(children: [
          pw.Column(
              children: List.generate(
                ProductList.length,
                    (index) => pw.Text(
                    '${ProductList[index].name}\t\t\t\t\t\t\t\t\t\t\t \n\n\n',
                    style: pw.TextStyle(
                      fontSize: 25,
                    )),
              )),
          pw.Column(
              children: List.generate(
                ProductList.length,
                    (index) => pw.Text('${ProductList[index].price}\t\t\t\t\t\t\t\t\t\t\t \n\n\n',
                    style: pw.TextStyle(fontSize: 25)),
              )),
          pw.Column(
              children: List.generate(
                ProductList.length,
                    (index) => pw.Text(
                    '${ProductList[index].category}\t\t\t\t\t\t\t\t\t\t\t \n\n\n',
                    style: pw.TextStyle(fontSize: 25)),
              )),
        ])),
  );
  return pdf.save();
}
