import 'package:connectapinetcore01/services/apiservice.dart';
import 'package:flutter/material.dart';

//==============================================================================
// MAIN
//==============================================================================
void main() {
  runApp(const MyApp());
}

//==============================================================================
// MY APP
//==============================================================================
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

//==============================================================================
// MAIN PAGE CLASS
//==============================================================================
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

//==============================================================================
// STATE CLASS
//==============================================================================
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
//==============================================================================
// TITLE
//==============================================================================
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Lesson#1 Function to Call Google and Azure Core API',
                ),
              ),

//==============================================================================
// CALL GOOGLE API
//==============================================================================
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    ApiService.fnCallGoogleApi();
                  },
                  child: const Text('Call Google API'),
                ),
              ),
//==============================================================================
// CALL AZURE API GET
//==============================================================================
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    ApiService.fnCallAzureApiGet();
                  },
                  child: const Text('Call Azure API - getMockUp'),
                ),
              ),
//==============================================================================
// CALL AZURE API POST
//==============================================================================
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    ApiService.fnCallAzureApiPost();
                  },
                  child: const Text('Call Azure API - Post Authen (Login)'),
                ),
              ),
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
