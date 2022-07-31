import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  Future<void> playSound(int id) async {
    final player = AudioPlayer();

    await player.play(AssetSource('note$id'));
  }

  Expanded buildKey(
      {required String note, required MaterialColor color, required int id}) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: color,
        ),
        onPressed: () async {
          playSound(id);
        },
        child: Text(
          note,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(note: "C", color: Colors.red, id: 1),
              buildKey(note: "D", color: Colors.orange, id: 2),
              buildKey(note: "E", color: Colors.yellow, id: 3),
              buildKey(note: "F", color: Colors.green, id: 4),
              buildKey(note: "G", color: Colors.teal, id: 5),
              buildKey(note: "A", color: Colors.blue, id: 6),
              buildKey(note: "B", color: Colors.purple, id: 7),
              buildKey(note: "C", color: Colors.cyan, id: 8),
            ],
          ),
        ),
      ),
    );
  }
}
