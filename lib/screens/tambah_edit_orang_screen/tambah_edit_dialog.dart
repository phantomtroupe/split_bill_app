import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:split_bill_app/models/barang_model.dart';
import 'package:split_bill_app/providers/split_bill_provider.dart';


class TambahEditBarangDialog extends StatelessWidget {
  TambahEditBarangDialog({
    Key? key,
    this.model,
  }) : super(key: key);

  BarangModel? model;

  @override
  Widget build(BuildContext context) {

    if(model != null){
      Provider.of<SplitBillProvider>(context,listen: false).inputedHargaBarang = model!.hargaBarang.toString();
      Provider.of<SplitBillProvider>(context,listen: false).inputedJumlahBarang = model!.jumlahBarang.toString();
      Provider.of<SplitBillProvider>(context,listen: false).inputedNamaBarang = model!.namaBarang;
    }

    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
            ),
            child: TextFormField(
              initialValue: model != null ? model!.namaBarang : "",
              onChanged: (value){
                Provider.of<SplitBillProvider>(context,listen: false,).inputedNamaBarang = value;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
                hintText: "Nama Barang Belanjaan",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
            ),
            child: TextFormField(
              initialValue: model != null ? model!.hargaBarang.toString() : "",
              onChanged: (value){
                Provider.of<SplitBillProvider>(context,listen: false,).inputedHargaBarang = value;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
                hintText: "Harga Barang Belanjaan",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
            ),
            child: TextFormField(
              initialValue: model != null ? model!.jumlahBarang.toString() : "",
              onChanged: (value){
                Provider.of<SplitBillProvider>(context,listen: false,).inputedJumlahBarang = value;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
                hintText: "Jumlah Barang Belanjaan",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
