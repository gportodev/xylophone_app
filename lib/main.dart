import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  Future<void> playSound(int id) async {
    final player = AudioPlayer();

    await player.play(AssetSource('note$id'));
  }

  Expanded buildKey({required MaterialColor color, required int id}) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: color,
        ),
        onPressed: () async {
          playSound(id);
        },
        child: null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            buildKey(color: Colors.red, id: 1),
            buildKey(color: Colors.orange, id: 2),
            buildKey(color: Colors.yellow, id: 3),
            buildKey(color: Colors.green, id: 4),
            buildKey(color: Colors.teal, id: 5),
            buildKey(color: Colors.blue, id: 6),
            buildKey(color: Colors.purple, id: 7),
          ]),
        ),
      ),
    );
  }
}
