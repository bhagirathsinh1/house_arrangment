// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:map_demo/method/edit_owner_delete_dialog.dart';
import 'package:map_demo/method/build_chairs.dart';
import 'package:map_demo/method/show_owner_detail_dialog.dart';

class HomeArrangemnt extends StatefulWidget {
  int rowvalue;
  int columnvalue;

  final ValueChanged<int> onunsoldHouseChanged;
  final ValueChanged<int> onwithDetailHouseChanged;
  final ValueChanged<int> onwithoutDetailHouseChanged;
  int unsoldHouse;
  int withDetailHouse;
  int withoutDetailHouse;
  HomeArrangemnt({
    Key? key,
    required this.size,
    required this.rowvalue,
    required this.columnvalue,
    required this.onunsoldHouseChanged,
    required this.onwithDetailHouseChanged,
    required this.onwithoutDetailHouseChanged,
    required this.unsoldHouse,
    required this.withDetailHouse,
    required this.withoutDetailHouse,
  });

  final Size size;

  @override
  State<HomeArrangemnt> createState() => _ChairListState();
}

class _ChairListState extends State<HomeArrangemnt> {
  late List<List<dynamic>> houseOwnerName;
  late List<List<dynamic>> houseNumber;

  @override
  void initState() {
    super.initState();
    houseOwnerName = [
      for (var row = 0; row < widget.rowvalue; row += 1)
        [for (var column = 0; column < widget.columnvalue; column += 1) ""],
    ];
    houseNumber = [
      for (var row = 0; row < widget.rowvalue; row += 1)
        [
          for (var column = 0; column < widget.columnvalue; column += 1) "",
        ],
    ];
  }

  @override
  Widget build(BuildContext context) {
    houseOwnerName[3][4] = null;
    houseOwnerName[2][1] = null;
    houseOwnerName[3][3] = null;
    houseOwnerName[1][2] = null;

    print('<<-----------$houseOwnerName----------->>');
    print('<<-----------$houseNumber----------->>');

    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              for (int row = 0; row < widget.rowvalue; row++)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int column = 0; column < widget.columnvalue; column++)
                      InkWell(
                        onLongPress: () {},
                        onTap: () {
                          if (houseOwnerName[row][column] == "") {
                            EditOwnerDetailAlertDialog(
                                onhouseOwnerNameChanged: (String value) {
                              setState(() {
                                houseOwnerName[row][column] = value;
                              });
                            }, onhouseNumberChanged: (String value) {
                              setState(() {
                                houseNumber[row][column] = value;
                                widget.onunsoldHouseChanged(
                                    widget.unsoldHouse - 1);
                                widget.onwithDetailHouseChanged(
                                    widget.withDetailHouse + 1);
                              });
                            }).showGotoAlert(context);
                          } else {
                            if (houseOwnerName[row][column] == null) {
                              ShowOwnerDetailAlertDialog(
                                      houseNumber: "Null",
                                      houseOwnerName: "Null")
                                  .showGotoAlert(context);
                            } else {
                              ShowOwnerDetailAlertDialog(
                                      houseOwnerName: houseOwnerName[row]
                                          [column],
                                      houseNumber: houseNumber[row][column])
                                  .showGotoAlert(context);
                            }
                          }
                        },
                        child: Container(
                            alignment: Alignment.center,
                            width: 40,
                            height: 40,
                            margin: EdgeInsets.all(5.0),
                            child: houseOwnerName[row][column] == ""
                                ? BuildChairs.notSoldHouse(row, column)
                                : houseOwnerName[row][column] == null
                                    ? BuildChairs.soldwithoutDetailHouse(
                                        row, column)
                                    : BuildChairs.soldwithDetailHouse(
                                        row, column)),
                      ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
