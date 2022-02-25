import 'package:flutter/material.dart';

class EditOwnerDetailAlertDialog {
  TextEditingController textGotoValueRow = TextEditingController();
  TextEditingController textGotoValueColumn = TextEditingController();

  final _formKeyRow = GlobalKey<FormState>();
  final _formKeyColumn = GlobalKey<FormState>();
  EditOwnerDetailAlertDialog(
      {Key? key,
      required this.onhouseOwnerNameChanged,
      required this.onhouseNumberChanged});

  ValueChanged<String> onhouseOwnerNameChanged;
  ValueChanged<String> onhouseNumberChanged;

  showGotoAlert(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("CANCEL"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        if (_formKeyRow.currentState!.validate() &&
            _formKeyColumn.currentState!.validate()) {
          String tempRow = textGotoValueRow.text.toString();
          String tempcolumn = textGotoValueColumn.text.toString();

          print('------------first temp--------$tempRow--------------');
          onhouseOwnerNameChanged(tempRow);
          onhouseNumberChanged(tempcolumn);

          Navigator.pop(context);
        }
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Row(
        children: [
          Icon(Icons.dehaze_sharp, color: Colors.blueGrey),
          Text(" House Detail", style: TextStyle(color: Colors.blueGrey)),
        ],
      ),
      content: Container(
        height: 180,
        child: Column(
          children: [
            Form(
              key: _formKeyRow,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: textGotoValueRow,
                    validator: (value) {
                      if (value != null && value != "") {
                        String temp = value.toString();
                        if (temp.length < 1) {
                          return "Owner name Cant be null";
                        } else {
                          return null;
                        }
                      } else {
                        return "Re-Enter Owner name here";
                      }
                    },

                    keyboardType: TextInputType.text,
                    // Only numbers can be entered
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'House Owner Name'),
                  ),
                  // Align(
                  //   alignment: Alignment.topRight,
                  //   child: Text(
                  //     'Enter Row',
                  //     style: TextStyle(
                  //       color: Colors.grey,
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
            Form(
              key: _formKeyColumn,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: textGotoValueColumn,
                    validator: (value) {
                      if (value != null && value != "") {
                        String temp = value.toString();
                        if (temp.length < 1) {
                          return "House Name Cant be nul";
                        } else {
                          return null;
                        }
                      } else {
                        return "Re-Enter House Number";
                      }
                    },

                    keyboardType: TextInputType.text,
                    // Only numbers can be entered
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'House Number'),
                  ),
                  // Align(
                  //   alignment: Alignment.topRight,
                  //   child: Text(
                  //     'Enter Row',
                  //     style: TextStyle(
                  //       color: Colors.grey,
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
      actions: [
        cancelButton,
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
