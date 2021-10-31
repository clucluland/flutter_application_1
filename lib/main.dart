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
  final items = List<String>.generate(10000, (i) => "Item $i");
  final items2 = ['clucluland', 'mario', 'xevious', 'gradius'];

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

          // 横スクロールの ListView
          child: ListView(
            // This next line does the trick.
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Expanded(
                    child: Image.network(
                        'https://m.media-amazon.com/images/I/31QQzrtbIjL._SS135_.jpg'),
                  ),
                  const Text('Text Msg'),
                ],
              ),
              Container(
                width: 160.0,
                color: Colors.red,
              ),
              Container(
                width: 160.0,
                color: Colors.blue,
              ),
              Container(
                width: 160.0,
                color: Colors.green,
              ),
              Container(
                width: 160.0,
                color: Colors.yellow,
              ),
              Container(
                width: 160.0,
                color: Colors.orange,
              ),
            ],
          )

          // // GridView の使い方
          // child: GridView.count(
          //   crossAxisCount: 3,
          //   children: List.generate(100, (index) {
          //     return Column(
          //       children: <Widget>[
          //         // Expanded で囲むことによりはみ出さない
          //         Expanded(
          //           child: Image.network(
          //               'https://m.media-amazon.com/images/I/31QQzrtbIjL._SS135_.jpg'),
          //         ),
          //         Text('$index'),
          //       ],
          //     );
          //     // return Center(
          //     //   child: Text(
          //     //     'Item $index',
          //     //     style: Theme.of(context).textTheme.headline5,
          //     //   ),
          //     // );
          //   }),
          // ),

          // // ListView を builder で
          // child: ListView.builder(
          //   itemCount: items.length,
          //   itemBuilder: (context, index) {
          //     return ListTile(
          //       title: Text('>>' + items[index]),
          //     );
          //   },
          // )

          // // ListViewを固定で出力
          // child: ListView(
          //   children: <Widget>[
          //     const ListTile(
          //       leading: Icon(Icons.map),
          //       title: Text('Map'),
          //       trailing: Text('Left Text'),
          //     ),
          //     ListTile(
          //       leading: const Icon(Icons.info),
          //       title: const Text('Information'),
          //       trailing: const Icon(Icons.arrow_forward_ios),
          //       onTap: () {
          //         Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //               builder: (context) => const NextPage('from ListView')),
          //         );
          //       },
          //     ),
          //     const ListTile(
          //       leading: Icon(Icons.phone),
          //       title: Text('Phone'),
          //     ),
          //     const Text('TestRow'),
          //   ],
          // ),
          ),
    );
  }
}
