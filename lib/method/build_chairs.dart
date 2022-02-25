import 'package:flutter/material.dart';

class BuildChairs {
  static Widget soldwithDetailHouse(int row, int column) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green[400],
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Center(
          child: Icon(
        Icons.home,
        color: Colors.black,
      )),
    );
  }

  static Widget notSoldHouse(int row, int column) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Center(
        child: Icon(
          Icons.home,
          color: Colors.blue,
        ),
      ),
    );
  }

  static Widget soldwithoutDetailHouse(int row, int column) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Center(
          child: Icon(
        Icons.home,
        color: Colors.black,
      )),
    );
  }
}
