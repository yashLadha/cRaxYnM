import 'package:flutter/material.dart';
import 'package:craxynm/craxy.dart';
import 'package:flutter/services.dart';

class Result extends StatefulWidget {
  final String string;
  const Result({Key key, this.string})
      : assert(string != null),
        super(key: key);
  @override
  State<StatefulWidget> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    // Returns an empty text on an empty string
    if (widget.string == "") {
      return Text('');
    }
    // Fetched the name list for the application
    List<String> strings = Craxy().generateCraxyNames(widget.string);
    return Flexible(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: strings.length,
        itemBuilder: (BuildContext ctxt, int idx) {
          return GestureDetector(
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              elevation: 1.0,
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
              child: Container(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(strings[idx]),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Colors.lightBlueAccent),
                ),
              ),
            ),
            onTap: () {
              // Setting the string into the clipboard.
              Clipboard.setData(ClipboardData(text: strings[idx]));
              // Snackbar for updating user on clipboard data updation
              final snackBar = SnackBar(
                content: Text(strings[idx] + ' copied to clipboard.'),
                duration: Duration(milliseconds: 500) ,
              );
              Scaffold.of(context).showSnackBar(snackBar);
            },
          );
        },
      ),
    );
  }
}
