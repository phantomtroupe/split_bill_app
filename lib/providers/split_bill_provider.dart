import 'package:flutter/cupertino.dart';
import 'package:split_bill_app/models/barang_model.dart';
import 'package:split_bill_app/models/hasil_split_bill_model.dart';
import 'package:split_bill_app/models/orang_model.dart';

class SplitBillProvider extends ChangeNotifier {
  List<OrangModel> listOrang = [];

  String inputedNamaOrang = "";
  String inputedNamaBarang = "";
  String inputedJumlahBarang = "";
  String inputedHargaBarang = "";
  String inputedTotalHargaSebelumDiskon = "";
  String inputedTotalHargaSetelahDiskon = "";

  List<BarangModel> listBarang = [];

  List<HasilSplitBillModel> listResult = [];

  String tambahBarang({BarangModel? model}) {
    if (inputedNamaBarang != "" &&
        inputedHargaBarang != "" &&
        inputedJumlahBarang != "") {
      if (int.parse(inputedHargaBarang) > 0) {
        if (int.parse(inputedJumlahBarang) > 0) {
          if (model != null) {
            model.namaBarang = inputedNamaBarang;
            model.jumlahBarang = int.parse(inputedJumlahBarang);
            model.hargaBarang = int.parse(inputedHargaBarang);
          } else {
            listBarang.add(
              BarangModel(
                hargaBarang: int.parse(inputedHargaBarang),
                jumlahBarang: int.parse(inputedJumlahBarang),
                namaBarang: inputedNamaBarang,
              ),
            );
          }

          inputedJumlahBarang = "";
          inputedHargaBarang = "";
          inputedNamaBarang = "";
          notifyListeners();
          return "SUCCESS";
        } else {
          return "JUMLAH_BARANG_IS_LESS_THAN_ONE";
        }
      } else {
        return "HARGA_BARANG_IS_LESS_THAN_ONE";
      }
    } else {
      return "NOT_ALL_DATA_FILLED";
    }
  }

  String tambahOrang({OrangModel? model}) {
    if (inputedNamaOrang != "") {
      if (listBarang.isNotEmpty) {
        print(listBarang.length);
        if(model != null){
          model.nama = inputedNamaOrang;
          model.listBarang = List.from(listBarang);
        }else{
          listOrang.add(
            OrangModel(
              nama: inputedNamaOrang,
              listBarang: List.from(listBarang),
            ),
          );
        }

        inputedNamaOrang = "";
        listBarang.clear();
        notifyListeners();

        return "SUCCESS";
      } else {
        return "PILIH_SATU_BARANG_MINIMAL";
      }
    } else {
      return "ISIKAN_NAMA_ORANG";
    }
  }

  String hitung() {
    if (inputedTotalHargaSebelumDiskon.isNotEmpty &&
        inputedTotalHargaSetelahDiskon.isNotEmpty) {
      if (listOrang.isNotEmpty) {
        listResult.clear();
        double ongkirPerOrang = 0;
        int totalHargaSebelumOngkir = 0;
        int totalDiskon = int.parse(inputedTotalHargaSebelumDiskon) -
            int.parse(inputedTotalHargaSetelahDiskon);
        for (var orang in listOrang) {
          for (var barang in orang.listBarang) {
            totalHargaSebelumOngkir +=
                (barang.hargaBarang * barang.jumlahBarang);
          }
        }

        ongkirPerOrang = (int.parse(inputedTotalHargaSebelumDiskon) -
                totalHargaSebelumOngkir) /
            listOrang.length;

        for (var orang in listOrang) {
          double totalHarga = 0;
          double persenDiskon = 0;
          double diskonPerOrang = 0;
          double hargaSetelahDiskon = 0;

          for (var barang in orang.listBarang) {
            totalHarga += (barang.jumlahBarang * barang.hargaBarang);
          }



          persenDiskon = (totalHarga + ongkirPerOrang) /
              int.parse(inputedTotalHargaSebelumDiskon);
          diskonPerOrang = totalDiskon * persenDiskon;
          hargaSetelahDiskon = totalHarga + ongkirPerOrang - diskonPerOrang;

          print(orang.nama);
          print(totalHarga);
          print(persenDiskon);
          print(diskonPerOrang);
          print(hargaSetelahDiskon);

          listResult.add(
            HasilSplitBillModel(
              namaOrang: orang.nama,
              totalHargaYangHarusDibayar: hargaSetelahDiskon.ceil().toDouble(),
            ),
          );
        }

        notifyListeners();
        return "SUCCESS";
      } else {
        return "TAMBAHKAN_MINIMAL_SATU_ORANG";
      }
    } else {
      return "MASUKKAN_TOTAL_HARGA";
    }
  }

  void hapusBarang(BarangModel model) {
    listBarang.remove(model);
    notifyListeners();
  }

  void hapusOrang(OrangModel model) {
    listOrang.remove(model);
    notifyListeners();
  }
}
