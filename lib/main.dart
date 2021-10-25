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

      // // 画面遷移(ルート)の指定
      // initialRoute: '/',
      // routes: {
      //   // When navigating to the "/" route, build the FirstScreen widget.
      //   '/': (context) => const MyHomePage(
      //         title: 'Flutter Study',
      //       ),
      //   // When navigating to the "/second" route, build the SecondScreen widget.
      //   '/next': (context) => const NextPage(),
      // },
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

  late String buttonText = '次画面へ';

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
        child: Column(
          // カラム内センタリング
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              child: Text(
                'clucluland',
                textAlign: TextAlign.left,
                // テキスト装飾をまとめて行う
                style: TextStyle(
                  fontSize: 30.0,
                  // color: Colors.purpleAccent,
                  // fontWeight: FontWeight.bold,
                  // fontStyle: FontStyle.italic,
                  // decoration: TextDecoration.lineThrough,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 3
                    ..color = Colors.pink[700]!,
                ),
              ),
            ),
            DefaultTextStyle(
              style: const TextStyle(
                fontSize: 36.0,
                color: Colors.deepOrange,
              ),
              child: Column(
                children: const <Widget>[
                  Text('tada'),
                  Text('sugiyama'),
                  Text('shingu'),
                ],
              ),
            ),
            const Text('mario'),
            // イメージ
            // Image.network(
            //     'https://m.media-amazon.com/images/I/51F6HWP4FYL._AC_.jpg'),
            Image.asset('images/clucluland.jpg'),
            // ボタン
            ElevatedButton(
              // // MyAppでルートを指定
              // onPressed: () {
              //   Navigator.pushNamed(context, '/next');
              // },

              // MyAppでルートを指定しない場合は以下のコード
              // 'async'-'await' を入れなければ非同期でコードが走る
              onPressed: () async {
                // ボタンを押したとき
                // 画面遷移
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NextPage('次画面 実験'),
                  ),
                );
                buttonText = result;
                // デバッグコンソールに出力
                debugPrint('結果 : $result');
              },
              child: Text(buttonText),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
