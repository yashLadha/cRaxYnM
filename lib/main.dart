import 'package:flutter/material.dart';
import 'package:craxynm/result.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cr@xYnM',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: const Main(title: 'Cr@xYnM'),
    );
  }
}

class Main extends StatefulWidget {
  final String title;

  const Main({Key? key, required this.title}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
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
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: const InputDecoration(
                  labelText: 'Enter Text',
                  border: OutlineInputBorder(),
                ),
                controller: inputTextController,
              ),
            ),
            // Submission button Widget
            Center(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    queryText = inputTextController.text;
                  });
                },
                child: const Text('Get your Cr@xy'),
              ),
            ),
            // Widget for some gap
            const SizedBox(height: 20.0,),
            // Result Widget to display list of the Craxy texts
            Result(string: queryText),
            const Padding(
              padding: EdgeInsets.all(16.0),
            )
          ],
        ),
      ),
    );
  }
}
