import 'package:flutter/material.dart';
import 'package:oracle/data/cards.dart';

class CardFullScreenScreen extends StatelessWidget {
  const CardFullScreenScreen({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(0, 0, 0, 0),
        foregroundColor: Colors.white,
      ),
      body: InteractiveViewer(
        // panEnabled: false,
        boundaryMargin: EdgeInsets.all(100),
        minScale: 0.5,
        maxScale: 4,

        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(32),
          child: Image.asset(
            cards[index].link,
            fit: BoxFit.contain,
          ),
        )),
      ),
    );
  }
}
