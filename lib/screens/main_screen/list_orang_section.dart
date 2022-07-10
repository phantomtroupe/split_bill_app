import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:split_bill_app/providers/split_bill_provider.dart';
import 'package:split_bill_app/screens/main_screen/orang_card.dart';
import 'package:split_bill_app/screens/tambah_edit_orang_screen/tambah_edit_orang_screen.dart';

class ListOrangSection extends StatefulWidget {
  const ListOrangSection({Key? key}) : super(key: key);

  @override
  State<ListOrangSection> createState() => _ListOrangSectionState();
}

class _ListOrangSectionState extends State<ListOrangSection> {
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
                "List Orang : ",
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TambahOrEditOrangScreen(),
                    ),
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
          Column(
            children: Provider.of<SplitBillProvider>(context)
                .listOrang
                .map(
                  (e) => OrangCard(
                    model: e,
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
