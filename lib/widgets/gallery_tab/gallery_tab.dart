import 'package:flutter/material.dart';
import 'package:oracle/screens/card_details_screen.dart';
import 'package:oracle/data/cards.dart';

class Gallery extends StatelessWidget {
  const Gallery({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: cards.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CardDetailsScreen(
                  index: index,
                ),
              ),
            );
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 250,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Hero(
                        tag: 'tag',
                        child: Image.asset(
                          cards[index].link,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                      height: 50,
                      child: Text(
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        cards[index].name,
                        style: const TextStyle(fontFamily: 'Tan', fontSize: 15),
                      ))
                ],
              ),
            ),
          ),
        );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        mainAxisExtent: 316,
      ),
    );
  }
}
