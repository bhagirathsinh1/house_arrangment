import 'package:flutter/material.dart';

class HomeInfo extends StatelessWidget {
  const HomeInfo({
    Key? key,
    required this.unsoldHouse,
    required this.withDetailHouse,
    required this.withoutDetailHouse,
  }) : super(key: key);
  final int unsoldHouse;
  final int withDetailHouse;
  final int withoutDetailHouse;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 15,
                width: 15,
                margin: EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue,
                ),
              ),
              Text(
                'Unsold House : $unsoldHouse',
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 12,
                  color: Colors.blue,
                ),
              )
            ],
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Container(
                height: 15,
                width: 15,
                margin: EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green[400],
                ),
              ),
              Text(
                'House With Detail : $withDetailHouse',
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 12,
                  color: Colors.green[400],
                ),
              )
            ],
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Container(
                height: 15,
                width: 15,
                margin: EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey,
                ),
              ),
              Text(
                'House without detail : $withoutDetailHouse',
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 12,
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
