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
      // home: const MyHomePage(title: 'Flutter Demo Home Page Sample'),

      // 画面遷移(ルート)の指定
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const MyHomePage(
              title: 'Flutter Study',
            ),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/next': (context) => const NextPage(),
      },
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        // 試しにタイトルにアイコン追加
        // ignore: prefer_const_literals_to_create_immutables
        actions: <Widget>[const Icon(Icons.add), const Icon(Icons.share)],
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/next');
            },
            // MyAppでルートを指定しない場合は以下のコード
            // onPressed: () {
            //   // ボタンを押したとき
            //   // 画面遷移
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => const NextPage(),
            //     ),
            //   );
            // },
            child: const Text('次の画面')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
