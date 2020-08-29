import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Server connection'),
        ),
        body: BodyWidget(),
      ),
    );
  }
}

class BodyWidget extends StatefulWidget {
  @override
  _BodyWidgetState createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  String serverResponse = 'server response';
  String localhost() {
    return 'http://10.0.2.2:3000';
  }

  _makeGetResponse() async {
    Response response = await get(localhost());
    print(response.body);
    setState(() {
      serverResponse = response.body;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            child: Text('connect'),
            onPressed: () {
              _makeGetResponse();
            },
          ),
          Padding(
            padding: EdgeInsets.all(14),
            child: Text(serverResponse),
          )
        ],
      ),
    );
  }
}
