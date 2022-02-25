import 'package:flutter/material.dart';
import 'package:map_demo/home_info.dart';
import 'package:map_demo/house_arrangment.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key, required this.rowvalue, required this.columnvalue})
      : super(key: key);
  final int rowvalue;
  final int columnvalue;

  @override
  _SeatSelectorState createState() => _SeatSelectorState();
}

class _SeatSelectorState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // setState(() {
    unsoldHouse = widget.rowvalue * widget.columnvalue -
        withoutDetailHouse -
        withDetailHouse;

    // });
  }

  int unsoldHouse = 0;
  int withDetailHouse = 1;
  int withoutDetailHouse = 4;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Total House - ${widget.rowvalue * widget.columnvalue}',
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              alignment: Alignment.topLeft,
              color: Colors.black,
              width: size.width,
            ),
            Positioned(
              top: 10,
              child: HomeInfo(
                  unsoldHouse: unsoldHouse,
                  withDetailHouse: withDetailHouse,
                  withoutDetailHouse: withoutDetailHouse),
            ),
            Positioned(
              top: size.height / 6,
              child: Container(
                height: size.height / 1.5,
                width: size.width * 0.90,
                child: Column(
                  children: [
                    HomeArrangemnt(
                        unsoldHouse: unsoldHouse,
                        withoutDetailHouse: withoutDetailHouse,
                        withDetailHouse: withDetailHouse,
                        onunsoldHouseChanged: ((value) => setState(() {
                              unsoldHouse = value;
                            })),
                        onwithoutDetailHouseChanged: ((value) => setState(() {
                              withoutDetailHouse = value;
                            })),
                        onwithDetailHouseChanged: ((value) => setState(() {
                              withDetailHouse = value;
                            })),
                        size: size,
                        rowvalue: widget.rowvalue,
                        columnvalue: widget.columnvalue),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
