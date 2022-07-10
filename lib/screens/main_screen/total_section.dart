import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:split_bill_app/providers/split_bill_provider.dart';

class TotalSection extends StatelessWidget {
  const TotalSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Total Harga Barang Sebelum Diskon (Termasuk Ongkir)",
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
            ),
            child: TextFormField(
              onChanged: (value) {
                Provider.of<SplitBillProvider>(
                  context,
                  listen: false,
                ).inputedTotalHargaSebelumDiskon = value;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
                hintText: "Rp.",
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 8.0,
            ),
            child: Text(
              "Total Harga Barang Sesudah Diskon (Termasuk Ongkir)",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
            ),
            child: TextFormField(
              onChanged: (value){
                Provider.of<SplitBillProvider>(
                  context,
                  listen: false,
                ).inputedTotalHargaSetelahDiskon = value;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
                hintText: "Rp.",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
