import 'package:flutter/material.dart';
import 'package:craxynm/result.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cr@xYnM',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: Main(title: 'Cr@xYnM'),
    );
  }
}

class Main extends StatefulWidget {
  // Main Stateful Widget of the application
  Main({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  String queryText = "";
  String inputText = "";

  final inputTextController = TextEditingController();

  @override
  void initState() {
    setState(() {
      queryText = "";
    });
    super.initState();
  }

  @override
  void didUpdateWidget(Main old) {
    super.didUpdateWidget(old);
    print('Widget updated: Main Widget');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(
          widget.title,
          style: TextStyle(
            color: Colors.lightBlueAccent[400],
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Input Text Widget
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Enter Text',
                  border: OutlineInputBorder(),
                ),
                controller: inputTextController,
              ),
            ),
            // Submission button Widget
            Center(
              child: RaisedButton(
                color: Colors.lightBlue[500],
                padding: EdgeInsets.all(15.0),
                child: Text('Get your Cr@xy'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                onPressed: () {
                  setState(() {
                    queryText = inputTextController.text;
                  });
                },
              ),
            ),
            // Widget for some gap
            SizedBox(height: 20.0,),
            // Result Widget to display list of the Craxy texts
            Result(string: queryText),
            Padding(
              padding: EdgeInsets.all(16.0),
            )
          ],
        ),
      ),
      resizeToAvoidBottomPadding: false,
    );
  }
}
