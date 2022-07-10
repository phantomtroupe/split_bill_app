import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:split_bill_app/providers/split_bill_provider.dart';
import 'package:split_bill_app/screens/hasil_split_bill_screen/hasil_card.dart';

class HasilSplitBillScreen extends StatelessWidget {
  const HasilSplitBillScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Hasil Split Bill",
        ),
      ),
      body: ListView(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Jumlah yang harus dibayar :",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Consumer<SplitBillProvider>(
            builder: (context, value, child) {
              return Column(
                children: value.listResult
                    .map(
                      (e) => HasilCard(
                        model: e,
                      ),
                    )
                    .toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
