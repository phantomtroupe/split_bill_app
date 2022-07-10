import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:split_bill_app/models/barang_model.dart';
import 'package:split_bill_app/providers/split_bill_provider.dart';
import 'package:split_bill_app/screens/tambah_edit_orang_screen/tambah_edit_dialog.dart';

class BarangCard extends StatelessWidget {
  BarangCard({Key? key, required this.model}) : super(key: key);

  BarangModel model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Tambah / Edit Barang Belanjaan"),
              content: TambahEditBarangDialog(model: model),
              actions: [
                TextButton(
                  onPressed: () {
                    String result = Provider.of<SplitBillProvider>(
                      context,
                      listen: false,
                    ).tambahBarang(
                      model: model,
                    );
                    if (result == "SUCCESS") {
                      Fluttertoast.showToast(msg: "Berhasil Edit Barang");
                      Navigator.of(context).pop();
                    } else if (result == "NOT_ALL_DATA_FILLED") {
                      Fluttertoast.showToast(
                          msg: "Mohon Isi Semua Data Pesanan");
                    } else if (result == "HARGA_BARANG_IS_LESS_THAN_ONE") {
                      Fluttertoast.showToast(
                          msg: "Harga Barang Tidak Boleh 0 atau Minus");
                    } else if (result == "JUMLAH_BARANG_IS_LESS_THAN_ONE") {
                      Fluttertoast.showToast(
                          msg: "Jumlah Barang Yang Dipesan Minimal 1");
                    }
                  },
                  child: const Text("Simpan"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Batal"),
                ),
              ],
            );
          },
        );
      },
      child: Card(
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
                      model.namaBarang,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      "Harga : ${model.hargaBarang}",
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "Jumlah : ${model.jumlahBarang}",
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Konfirmasi"),
                        content: const Text(
                            "Apakah Anda Yakin Ingin Menghapus Barang?"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Provider.of<SplitBillProvider>(
                                context,
                                listen: false,
                              ).hapusBarang(model);
                              Navigator.pop(context);
                            },
                            child: const Text("Ya"),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Tidak"),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text("Hapus"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
