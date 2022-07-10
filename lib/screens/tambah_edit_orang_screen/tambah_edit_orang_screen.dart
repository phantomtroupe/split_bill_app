import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:split_bill_app/models/orang_model.dart';
import 'package:split_bill_app/providers/split_bill_provider.dart';
import 'package:split_bill_app/screens/tambah_edit_orang_screen/list_barang_section.dart';
import 'package:split_bill_app/screens/tambah_edit_orang_screen/nama_orang_section.dart';

class TambahOrEditOrangScreen extends StatelessWidget {
  TambahOrEditOrangScreen({Key? key, this.model}) : super(key: key);

  OrangModel? model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tambah / Edit Orang",
        ),
      ),
      body: ListView(
        children: [
          NamaOrangSection(
            model: model,
          ),
          ListBarangSection(
            model: model,
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: const EdgeInsets.all(
            16.0,
          ),
          child: ElevatedButton(
            onPressed: () {
              String result = Provider.of<SplitBillProvider>(
                context,
                listen: false,
              ).tambahOrang(
                model: model,
              );

              if (result == "SUCCESS") {
                Fluttertoast.showToast(msg: "Berhasil Menambahkan Orang");
                Navigator.pop(context);
              } else if (result == "PILIH_SATU_BARANG_MINIMAL") {
                Fluttertoast.showToast(msg: "Tambahkan Minimal Satu Barang");
              } else if (result == "ISIKAN_NAMA_ORANG") {
                Fluttertoast.showToast(msg: "Isi Nama Orang");
              }
            },
            child: const Text("Simpan"),
          ),
        ),
      ),
    );
  }
}
