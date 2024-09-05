import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:io';

class BillPage extends StatelessWidget {
  BillPage({super.key});

  // Sample bill data
  final String orderId = '12345';
  final DateTime now = DateTime.now();
  final List<Map<String, dynamic>> items = [
    {'description': 'Item 1', 'quantity': 2, 'price': 50.0},
    {'description': 'Item 2', 'quantity': 1, 'price': 100.0},
  ];
  final double tax = 8.8;

  @override
  Widget build(BuildContext context) {
    // Calculate total amount
    double totalAmount = items.fold(0.0,
            (double sum, item) => sum + (item['quantity'] * item['price'])) *
        (1 + tax / 100);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Generate Simple Bill'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "INVOICE",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text("Order ID: $orderId"),
            Text("Date: ${DateFormat('MM-dd-yyyy').format(now)}"),
            const SizedBox(height: 16),
            const Text('Bill Details', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Table(
              border: TableBorder.all(color: Colors.black, width: 1.0),
              children: [
                const TableRow(children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Description'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Quantity'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Price'),
                  ),
                ]),
                ...items.map((item) {
                  return TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(item['description']),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(item['quantity'].toString()),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('\$${item['price'].toStringAsFixed(2)}'),
                    ),
                  ]);
                }),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Tax @ $tax%'),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(''),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        '\$${(totalAmount - (totalAmount / (1 + tax / 100))).toStringAsFixed(2)}'),
                  ),
                ]),
                TableRow(children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Total'),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(''),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('\$${totalAmount.toStringAsFixed(2)}'),
                  ),
                ]),
              ],
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () => generateBillPdf(context),
                child: const Text('Generate and Share PDF'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Generate the PDF and share it
  Future<void> generateBillPdf(BuildContext context) async {
    final pdf = pw.Document();

    // Calculate total amount
    double totalAmount = items.fold(0.0,
            (double sum, item) => sum + (item['quantity'] * item['price'])) *
        (1 + tax / 100);

    // Add content to the PDF
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              "INVOICE",
              style: pw.TextStyle(
                fontSize: 25,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
            pw.SizedBox(height: 16),
            pw.Text("Order ID: $orderId"),
            pw.Text("Date: ${DateFormat('MM-dd-yyyy').format(now)}"),
            pw.SizedBox(height: 16),
            pw.Text('Bill Details', style: const pw.TextStyle(fontSize: 16)),
            pw.SizedBox(height: 8),
            pw.Table(
              border: pw.TableBorder.all(color: PdfColors.black, width: 1.0),
              children: [
                pw.TableRow(children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(8.0),
                    child: pw.Text('Description'),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(8.0),
                    child: pw.Text('Quantity'),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(8.0),
                    child: pw.Text('Price'),
                  ),
                ]),
                ...items.map((item) {
                  return pw.TableRow(children: [
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(8.0),
                      child: pw.Text(item['description']),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(8.0),
                      child: pw.Text(item['quantity'].toString()),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(8.0),
                      child: pw.Text('\$${item['price'].toStringAsFixed(2)}'),
                    ),
                  ]);
                }),
                pw.TableRow(children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(8.0),
                    child: pw.Text('Tax @ $tax%'),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(8.0),
                    child: pw.Text(''),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(8.0),
                    child: pw.Text(
                        '\$${(totalAmount - (totalAmount / (1 + tax / 100))).toStringAsFixed(2)}'),
                  ),
                ]),
                pw.TableRow(children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(8.0),
                    child: pw.Text('Total'),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(8.0),
                    child: pw.Text(''),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(8.0),
                    child: pw.Text('\$${totalAmount.toStringAsFixed(2)}'),
                  ),
                ]),
              ],
            ),
          ],
        ),
      ),
    );

    // Get the temporary directory
    final output = await getTemporaryDirectory();

    // Create the file name
    final file = File("${output.path}/SimpleBill.pdf");

    // Write the PDF to the file
    await file.writeAsBytes(await pdf.save());

    // Share the PDF file
    await Share.shareXFiles([XFile(file.path)]);
  }
}

