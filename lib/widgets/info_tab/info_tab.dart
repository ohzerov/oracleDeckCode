import 'package:flutter/material.dart';
import 'package:oracle/widgets/info_tab/info_about_deck_screen.dart';
import 'package:oracle/widgets/info_tab/info_about_screen.dart';
import 'package:oracle/widgets/info_tab/info_howtouse_screen.dart';
import 'dart:js' as js;

class Info extends StatelessWidget {
  Info({super.key});
  TextStyle buttonTextStyle = TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.w500,
      fontSize: 14,
      color: Color.fromARGB(253, 0, 0, 0));

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double layoutSize;
        if (constraints.maxWidth <= 600) {
          layoutSize = constraints.maxWidth;
        } else {
          layoutSize = constraints.maxWidth / 3;
        }
        return Padding(
          padding: const EdgeInsets.only(left: 32, right: 32, top: 24),
          child: Center(
            child: SizedBox(
              width: layoutSize,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      maxRadius: 110,
                      child: Image.asset(
                        'assets/images/avatar.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Text(
                      "EVIDENCE-BASED MAGIC",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Tan',
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Text("50-Cards Oracle Deck by Eva Gamayun",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontFamily: 'Inter', fontSize: 14)),
                    const SizedBox(
                      height: 18,
                    ),
                    SizedBox(
                      width: constraints.maxWidth / 1.5,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Color.fromARGB(255, 216, 90, 251),
                          side: BorderSide(width: 2, color: Colors.black),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            'ABOUT ARTIST',
                            style: buttonTextStyle,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => InfoAboutScreen()));
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: constraints.maxWidth / 1.5,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Color.fromARGB(255, 216, 90, 251),
                          side: BorderSide(width: 2, color: Colors.black),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            'ABOUT THE DECK',
                            style: buttonTextStyle,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => InfoAboutDeckScreen()));
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: constraints.maxWidth / 1.5,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Color.fromARGB(255, 216, 90, 251),
                          side: BorderSide(width: 2, color: Colors.black),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            'HOW TO USE',
                            style: buttonTextStyle,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => InfoHowToUseScreen()));
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: constraints.maxWidth / 1.5,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Color.fromARGB(255, 216, 90, 251),
                          side: BorderSide(width: 2, color: Colors.black),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            'PHYSICAL DECK',
                            style: buttonTextStyle,
                          ),
                        ),
                        onPressed: () {
                          js.context.callMethod('open', [
                            'https://evagamayun.com/product/evidence-based-magic/'
                          ]);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
