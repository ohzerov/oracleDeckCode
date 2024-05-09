import 'package:flutter/material.dart';
import 'package:oracle/data/cards.dart';

import 'dart:js' as js;

class ThreeCardsDetailsScreen extends StatelessWidget {
  const ThreeCardsDetailsScreen({super.key, required this.indexesList});

  final List<int> indexesList;

  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          SizedBox(
            height: 24,
          ),
          ThreeCardsListViewItem(
            index: indexesList[0],
          ),
          SizedBox(
            height: 24,
          ),
          ThreeCardsListViewItem(index: indexesList[1]),
          SizedBox(
            height: 24,
          ),
          ThreeCardsListViewItem(index: indexesList[2]),
          SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              "If you want to buy my Orace Deck, follow the link below :3",
              style: TextStyle(fontFamily: 'Inter', fontSize: 14),
            ),
          ),
          TextButton(
            onPressed: () {
              js.context.callMethod('open',
                  ['https://evagamayun.com/product/evidence-based-magic/']);
            },
            child: Text(
              textAlign: TextAlign.start,
              "Get the deck",
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 12,
              ),
            ),
          ),
          SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }
}

class ThreeCardsListViewItem extends StatelessWidget {
  const ThreeCardsListViewItem({super.key, required this.index});
  final int index;
  @override
  build(BuildContext context) {
    double rowItemSize = MediaQuery.of(context).size.width / 2;
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              width: rowItemSize * 0.8,
              child: SizedBox(child: Image.asset(cards[index].link))),
          const SizedBox(
            width: 16,
          ),
          SizedBox(
            width: rowItemSize,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cards[index].name,
                  style: TextStyle(fontFamily: 'Tan', fontSize: 24),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(cards[index].title,
                    style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w500)),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  cards[index].description,
                  style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
