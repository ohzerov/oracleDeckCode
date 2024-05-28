import 'package:flutter/material.dart';
import 'dart:js' as js;

import 'package:flutter/widgets.dart';

class InfoHowToUseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            double paddingBodyText;
            double layoutWidth;
            if (constraints.maxWidth <= 600) {
              paddingBodyText = 16;
              layoutWidth = constraints.maxWidth;
            } else {
              paddingBodyText = 160;
              layoutWidth = constraints.maxWidth / 1.5;
            }
            return SingleChildScrollView(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: paddingBodyText),
              child: SizedBox(
                width: layoutWidth,
                child: Column(children: [
                  const Text(
                    "HOW TO USE CARDS",
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        fontSize: 24),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'Let your imagination wander and discover the magic that resonates with you!\n\nBefore you begin, get into a calm and open state of mind using whatever methods work for you personally.\n\nWith each spread, give yourself time to contemplate the images and the words on the card. Let messages come to you intuitively. There\'s no need to read the card descriptions unless you want to; the image itself may convey the most meaning to you - go with what feels right for you!',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'The Single Card',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      'Focus on your question and pick a card. The card will reveal a story that can help you gain insight into your situation. Tune in to the deeper meaning of what is going on for you.',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'The Trinity Spread',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      'Hold your question, dilemma or concern in your mind.\n\nThe 1st card in the upper left is the Underneath. It gives you clues as to the influence of the past, and what has impacted upon you.\n\nThe 2nd card in the middle is The Heart. This is what is taking place at the moment and what is the central issue in the situation. It may also be the greatest challenge confronting you at this time.\n\nThe 3rd card, The Promise, in the bottom or to the right represents the future manifestation of the situation given. Look at the card, and see what will soon be confronting you or potential direction of the future events.',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'The Oracle Cards and Psychology',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Text(
                      'Oracle cards are great for providing support, inspiration, or for self-reflection!\n\nFor decades, the field of psychology has employed tests that utilize visual images to reveal underlying, unconscious, or difficult-to-communicate needs, beliefs, and response patterns in people. Oracle cards contain vast imagery and are full of metaphorical content that can help you understand your experiences and circumstances in a new light. These cards are open to each individual\'s unique interpretation. They are a perfect tool for people who feel blocked or stuck, who experience repetitive thinking, and who would like to approach a situation differently. However, cards do not replace professional help if needed.',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: paddingBodyText),
                    child: SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Color.fromARGB(255, 0, 0, 0),
                          side: BorderSide(width: 2, color: Colors.black),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        onPressed: () {
                          js.context.callMethod('open', [
                            'https://evagamayun.com/product/evidence-based-magic/'
                          ]);
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(12),
                          child: Text(
                            textAlign: TextAlign.center,
                            'GET PHYSICAL DECK',
                            style: TextStyle(fontFamily: 'Inter', fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ]),
              ),
            ));
          },
        ),
      ),
    );
  }
}
