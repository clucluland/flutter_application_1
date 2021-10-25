import 'package:flutter/material.dart';

class NextPage extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const NextPage(this.name);
  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('次の画面'),
        actions: const <Widget>[Icon(Icons.add), Icon(Icons.share)],
      ),
      body: Container(
        height: double.infinity,
        color: Colors.teal[100],
        child: Column(
          // カラム内センタリング
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(name),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    // ボタンを押したとき
                    // 呼び元に戻る
                    Navigator.pop(context, 'hoihoi');
                  },
                  child: const Text('前の画面')),
            ),
          ],
        ),
      ),
    );
  }
}
