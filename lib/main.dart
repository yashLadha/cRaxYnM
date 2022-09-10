import 'package:craxynm/utils/themeUtil.dart';
import 'package:flutter/material.dart';
import 'package:craxynm/result.dart';
import 'package:rive/rive.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? isLightTheme;

  void updateAppTheme(bool isLightModeEnabled) {
    setState(() {
      isLightTheme = isLightModeEnabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cr@xY',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: isLightTheme != null
          ? ThemeUtil.getSystemTheme(isLightTheme!)
          : ThemeMode.system,
      home: Main(
        title: 'Cr@xY',
        updateAppTheme: updateAppTheme,
        isLightMode: isLightTheme ?? ThemeUtil.isLightModeEnabled(),
      ),
    );
  }
}

class Main extends StatefulWidget {
  final String title;
  final Function updateAppTheme;
  final bool isLightMode;

  const Main(
      {Key? key,
      required this.title,
      required this.updateAppTheme,
      required this.isLightMode})
      : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> with WidgetsBindingObserver {
  String queryText = "";
  String inputText = "";
  SMITrigger? _toggleSwitch;
  SMIBool? _setLightTheme;

  final inputTextController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    decideThemeSwitch();
    super.didChangePlatformBrightness();
  }

  void decideThemeSwitch() {
    _setLightTheme?.change(widget.isLightMode);
    _toggleSwitch?.fire();
  }

  void _onRiveInit(Artboard artboard) {
    final controller =
        StateMachineController.fromArtboard(artboard, "switcher");
    artboard.addController(controller!);
    _toggleSwitch = controller.findInput<bool>("switch") as SMITrigger;
    _setLightTheme = controller.findInput<bool>("light mode") as SMIBool;

    decideThemeSwitch();
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
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 50,
              height: 50,
              child: GestureDetector(
                onTap: () {
                  _toggleSwitch?.fire();
                  widget.updateAppTheme(!widget.isLightMode);
                },
                child: RiveAnimation.asset(
                  "assets/rive/switch_day_night.riv",
                  fit: BoxFit.contain,
                  onInit: _onRiveInit,
                ),
              ),
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        queryText = value;
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: 'Enter Text',
                      border: OutlineInputBorder(),
                    ),
                    controller: inputTextController,
                  ),
                ),
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
                Result(string: queryText),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
