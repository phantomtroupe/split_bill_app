import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:split_bill_app/models/orang_model.dart';
import 'package:split_bill_app/providers/split_bill_provider.dart';
import 'package:split_bill_app/screens/tambah_edit_orang_screen/tambah_edit_orang_screen.dart';

class OrangCard extends StatelessWidget {
  final OrangModel model;

  const OrangCard({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int totalHarga = 0;
    for (var element in model.listBarang) {
      totalHarga += (element.hargaBarang * element.jumlahBarang);
    }
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TambahOrEditOrangScreen(
              model: model,
            ),
          ),
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
                      model.nama,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      "Item : ${model.listBarang.length}",
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "Total : Rp. $totalHarga",
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
                              ).hapusOrang(model);
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
