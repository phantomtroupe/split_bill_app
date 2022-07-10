import 'package:flutter/material.dart';
import 'package:split_bill_app/models/hasil_split_bill_model.dart';

class HasilCard extends StatelessWidget {
  const HasilCard({Key? key, required this.model}) : super(key: key);

  final HasilSplitBillModel model;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(
          16.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.namaOrang,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    "Total Bayar : Rp. ${model.totalHargaYangHarusDibayar}",
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
