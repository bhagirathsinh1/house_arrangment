import 'package:flutter/material.dart';

class ShowOwnerDetailAlertDialog {
  ShowOwnerDetailAlertDialog({
    Key? key,
    required this.houseOwnerName,
    required this.houseNumber,
  });

  String houseOwnerName;
  String houseNumber;
  showGotoAlert(BuildContext context) {
    // set up the buttons

    Widget continueButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Row(
        children: [
          Icon(Icons.dehaze_sharp, color: Colors.black.withOpacity(0.7)),
          Text(" House Detail",
              style: TextStyle(color: Colors.black.withOpacity(0.7))),
        ],
      ),
      content: Container(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              shadowColor: Colors.black,
              color: Colors.blue[200],
              child: ListTile(
                title: Text(
                  "House Owner",
                  style: TextStyle(color: Colors.black.withOpacity(0.7)),
                ),
                subtitle: Text(houseOwnerName,
                    style: TextStyle(color: Colors.black.withOpacity(0.7))),
                leading: Icon(
                  Icons.home,
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
            ),
            Card(
              shadowColor: Colors.black,
              color: Colors.blue[200],
              child: ListTile(
                title: Text(
                  "House Number",
                  style: TextStyle(color: Colors.black.withOpacity(0.7)),
                ),
                subtitle: Text(houseNumber,
                    style: TextStyle(color: Colors.black.withOpacity(0.7))),
                leading: Icon(
                  Icons.location_on_outlined,
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
