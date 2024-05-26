import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:oracle/widgets/card_tab/card_fullscreen_widget.dart';
import '../data/cards.dart';
import 'dart:js' as js;

class CardDetailsScreen extends StatelessWidget {
  final int index;
  const CardDetailsScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: LayoutBuilder(builder: (context, constraints) {
        double layoutSize;
        if (constraints.maxWidth <= 600) {
          layoutSize = constraints.maxWidth;
        } else {
          layoutSize = constraints.maxWidth / 3;
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Center(
            child: SingleChildScrollView(
              child: Center(
                child: SizedBox(
                  width: layoutSize,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        hoverColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () {
                          HapticFeedback.heavyImpact();
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  CardFullScreenScreen(index: index),
                            ),
                          );
                        },
                        child: SizedBox(
                            height: MediaQuery.of(context).size.height / 2,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.asset(cards[index].link))),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        cards[index].name.toUpperCase(),
                        style: TextStyle(fontFamily: 'Tan', fontSize: 32),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Text(
                        cards[index].title,
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        cards[index].description,
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      SizedBox(
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Color.fromARGB(255, 0, 0, 0),
                            side: BorderSide(width: 2, color: Colors.black),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          onPressed: () {
                            js.context
                                .callMethod('open', [cards[index].buyLink]);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Text(
                              "GET PRINT",
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 18,
                              ),
                            ),
                          ),
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
          ),
        );
      }),
    );
  }
}
