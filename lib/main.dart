import 'package:flutter/material.dart';
import 'package:flutter_application_1/next_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // メイン画面タイトル
      home: const MyHomePage(title: 'Flutter Demo Home Page Sample'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        // 試しにタイトルにアイコン追加
        // ignore: prefer_const_literals_to_create_immutables
        actions: <Widget>[const Icon(Icons.add), const Icon(Icons.share)],
      ),
      body: SizedBox(
        width: double.infinity,
        child: ListView(
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.map),
              title: Text('Map'),
              trailing: Text('Left Text'),
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Information'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NextPage('from ListView')),
                );
              },
            ),
            const ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone'),
            ),
            const Text('TestRow'),
          ],
        ),
      ),
    );
  }
}
