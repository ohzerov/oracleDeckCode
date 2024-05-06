import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../data/cards.dart';
import 'dart:js' as js;

class CardDetailsScreen extends StatelessWidget {
  final int index;
  const CardDetailsScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    cards[index].name,
                    style: TextStyle(fontFamily: 'Tan', fontSize: 24),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                SizedBox(
                    height: MediaQuery.of(context).size.height / 2,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Hero(
                            tag: "tag",
                            child: Image.asset(cards[index].link)))),
                SizedBox(
                  height: 24,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    cards[index].description,
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    js.context.callMethod('open', [cards[index].buyLink]);
                  },
                  child: Text(
                    "Explore prints",
                    style: TextStyle(fontFamily: 'Inter', fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}





/*  

  <iframe class='oracle-iframe' src="https://ohzerov.github.io/oracleDeck/" ></iframe>


  iframe {
    height: 100vh;
    width: 100vw;
    border:none;
    position: absolute;
}






 */