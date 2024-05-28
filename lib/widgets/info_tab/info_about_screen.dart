import 'package:flutter/material.dart';
import 'dart:js' as js;

class InfoAboutScreen extends StatelessWidget {
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
                  "ABOUT ARTIST",
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
                    "I'm Eva Gamayun, a self-taught artist working in the genre of surrealism and the author of this oracle deck.\n\nMy paintings usually depict subjects in dream-like states, dissolving into their surroundings like mirages. I draw inspiration from nature, literature, scientific theories, ancient myths, the beauty of the human body, and the intricate illusions of the human mind. From an early age, I've discovered the ability to channel overwhelming emotions and curiosity into infinite imaginary realms. Imagination games soon became my second nature, a physical necessity, that eventually blossomed into an art career. Since that time, I have dreamed of worlds where the boundaries between internal and external, material and digital, scientific and magical are blurred. These dreams are translated into my art, bringing the viewer a message, a story, or an invitation to embark on a journey.\n\nOver the past 13 year I have developed a unique style of acrylic painting to convey stories of self-discovery and to visualize dreams of other worlds.",
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
                        js.context
                            .callMethod('open', ['https://evagamayun.com']);
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(12),
                        child: Text(
                          textAlign: TextAlign.center,
                          'View my art',
                          style: TextStyle(fontFamily: 'Inter', fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
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
                        js.context.callMethod(
                            'open', ['https://www.instagram.com/evagamayun/']);
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(12),
                        child: Text(
                          textAlign: TextAlign.center,
                          'Follow me on Instagram',
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
