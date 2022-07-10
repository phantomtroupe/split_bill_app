import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:split_bill_app/models/orang_model.dart';
import 'package:split_bill_app/providers/split_bill_provider.dart';

class NamaOrangSection extends StatelessWidget {
  NamaOrangSection({Key? key,this.model}) : super(key: key);

  OrangModel? model;

  @override
  Widget build(BuildContext context) {
    if(model != null){
      Provider.of<SplitBillProvider>(context,listen: false,).inputedNamaOrang = model!.nama;
    }

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Nama orang",
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
              initialValue: model != null ? model!.nama : "",
              onChanged: (value){
                Provider.of<SplitBillProvider>(context,listen: false,).inputedNamaOrang = value;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
                hintText: "Nama Orang",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
