import 'package:flutter/material.dart';

class NextPage extends StatelessWidget {
  const NextPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('次の画面'),
        actions: const <Widget>[Icon(Icons.add), Icon(Icons.share)],
      ),
      body: Container(
        height: double.infinity,
        color: Colors.deepOrange,
        child: Center(
          child: ElevatedButton(
              onPressed: () {
                // ボタンを押したとき
                // 呼び元に戻る
                Navigator.pop(context);
              },
              child: const Text('前の画面')),
        ),
      ),
    );
  }
}
