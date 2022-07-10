import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:split_bill_app/providers/split_bill_provider.dart';
import 'package:split_bill_app/screens/hasil_split_bill_screen/hasil_split_bill_screen.dart';
import 'package:split_bill_app/screens/main_screen/list_orang_section.dart';
import 'package:split_bill_app/screens/main_screen/total_section.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Split Bill App"),
      ),
      body: ListView(
        children: const [
          TotalSection(),
          ListOrangSection(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: const EdgeInsets.all(
            16.0,
          ),
          child: ElevatedButton(
            onPressed: () {
              String result = Provider.of<SplitBillProvider>(context,listen: false,).hitung();
              if(result == "SUCCESS"){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const HasilSplitBillScreen();
                    },
                  ),
                );
              }else if(result == "TAMBAHKAN_MINIMAL_SATU_ORANG"){
                Fluttertoast.showToast(msg: "Tambahkan Minimal 1 orang untuk menghitung");
              }else if(result == "MASUKKAN_TOTAL_HARGA"){
                Fluttertoast.showToast(msg: "Masukkan Total Harga Sebelum dan Sesudah Diskon");
              }
            },
            child: const Text("Hitung"),
          ),
        ),
      ),
    );
  }
}
