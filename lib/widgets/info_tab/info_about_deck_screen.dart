import 'package:flutter/material.dart';
import 'dart:js' as js;

class InfoAboutDeckScreen extends StatelessWidget {
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
                child: SizedBox(
              width: layoutWidth,
              child: Column(children: [
                const Text(
                  "ABOUT THE DECK",
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      fontSize: 24),
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: paddingBodyText),
                  child: const Text(
                    'This 50-card deck is a visual chronicle of Eva\'s artistic journey spanning from 2014 to 2024.\n\nEach of the pieces selected for this deck is a portal into a different metaphysical realm, each one telling its own story. However, the message behind the artwork is always unique and deeply personal for the viewer. Consider them an invitation to explore the mysteries of the mind, the Universe, and everything.\n\nIt\'s truly remarkable how visual art serves as a universal language, effortlessly bridging cultural and mental divides, offering a way to connect with one\'s own subconscious, unveiling answers that may have been there all along. Therefore, Oracle cards are a great introspection tool, helping you to tune in to your deeper levels of self. This phenomenon is evidence of genuine magic.',
                    style: TextStyle(fontFamily: 'Inter', fontSize: 16),
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
                        foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                        side: const BorderSide(width: 2, color: Colors.black),
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
                        padding: const EdgeInsets.all(12),
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
            ));
          },
        ),
      ),
    );
  }
}
