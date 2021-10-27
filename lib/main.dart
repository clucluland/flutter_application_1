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

  final myFocusNode = FocusNode();

  late String name;

  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _passwordFocusNode = FocusNode(); // 追加

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

          children: [
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              // オートフォーカス
              autofocus: true,
              textInputAction: TextInputAction.next, // Done → Next
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "文字を入力してください"),
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_passwordFocusNode);
              },
              focusNode: myFocusNode,
              onChanged: (text) {
                // // ignore: avoid_print
                // print('First text field: $text');
                name = text;
              },
            ),
            TextFormField(
              controller: myController,
              decoration: const InputDecoration(
                  labelText: 'password',
                  border: OutlineInputBorder(),
                  hintText: 'password'),
              obscureText: true,
              focusNode: _passwordFocusNode,
            ),
            ElevatedButton(
              onPressed: () => myFocusNode.requestFocus(),
              child: const Text('フォーカスセット'),
            ),
            // イメージ
            // Image.network(
            //     'https://m.media-amazon.com/images/I/51F6HWP4FYL._AC_.jpg'),
            Image.asset('images/clucluland.jpg'),
            const Icon(
              Icons.share,
              color: Colors.pink,
              size: 16,
            ),
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
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      // Retrieve the text the user has entered by using the
                      // TextEditingController.
                      content: Text(myController.text),
                    );
                  },
                );
              },
              child: const Text('Show Dialog'),
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
