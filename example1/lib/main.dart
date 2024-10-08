import 'package:flutter/material.dart';
import 'package:flutter_msa_sdk/flutter_msa_sdk.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isSupport = false;
  String _oaid = "";
  TextEditingController _controller =
      TextEditingController(text: 'Initial value');

  @override
  void initState() {
    initPlatformState();
    super.initState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    bool isSupport = await FlutterMsaSdk.isSupport();
    print('isSupport: $isSupport');
    String oaid = await FlutterMsaSdk.getOAID();
    print('oaid: $oaid');

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    // if (!mounted) return;

    setState(() {
      _isSupport = isSupport;
      _oaid = oaid;

      _controller.text = _oaid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: [
              Text('isSupport: $_isSupport'),
              TextFormField(
                  controller: _controller,
                  decoration: InputDecoration(label: Text('OAID')))
            ],
          ),
        ),
      ),
    );
  }
}
