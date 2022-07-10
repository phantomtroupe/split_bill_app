import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:split_bill_app/models/orang_model.dart';
import 'package:split_bill_app/providers/split_bill_provider.dart';
import 'package:split_bill_app/screens/tambah_edit_orang_screen/barang_card.dart';
import 'package:split_bill_app/screens/tambah_edit_orang_screen/tambah_edit_dialog.dart';

class ListBarangSection extends StatefulWidget {
  ListBarangSection({Key? key,this.model}) : super(key: key);

  OrangModel? model;

  @override
  State<ListBarangSection> createState() => _ListBarangSectionState();
}

class _ListBarangSectionState extends State<ListBarangSection> {
  @override
  void initState() {
    super.initState();
    if(widget.model != null){
      Provider.of<SplitBillProvider>(context,listen: false,).listBarang = List.from(widget.model!.listBarang);
    }else{
      Provider.of<SplitBillProvider>(context,listen: false,).listBarang.clear();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "List Barang : ",
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Tambah / Edit Barang Belanjaan"),
                        content: TambahEditBarangDialog(),
                        actions: [
                          TextButton(
                            onPressed: () {
                              String result = Provider.of<SplitBillProvider>(context,listen: false,).tambahBarang();
                              if(result == "SUCCESS"){
                                Fluttertoast.showToast(msg: "Berhasil Menambahkan Barang");
                                Navigator.of(context).pop();
                              }else if(result =="NOT_ALL_DATA_FILLED"){
                                Fluttertoast.showToast(msg: "Mohon Isi Semua Data Pesanan");
                              }else if(result == "HARGA_BARANG_IS_LESS_THAN_ONE"){
                                Fluttertoast.showToast(msg: "Harga Barang Tidak Boleh 0 atau Minus");
                              }else if(result == "JUMLAH_BARANG_IS_LESS_THAN_ONE"){
                                Fluttertoast.showToast(msg: "Jumlah Barang Yang Dipesan Minimal 1");
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
                child: const Text(
                  "Tambah",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16.0,
          ),
          Consumer<SplitBillProvider>(
            builder: (context, value, child) {
              return Column(
                children: value.listBarang.map((e){
                  return BarangCard(
                    model: e,
                  );
                },).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
