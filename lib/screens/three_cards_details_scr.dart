import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:oracle/data/cards.dart';

import 'package:oracle/widgets/card_tab/card_fullscreen_widget.dart';

class ThreeCardsDetailsScreen extends StatelessWidget {
  const ThreeCardsDetailsScreen({super.key, required this.indexesList});

  final List<int> indexesList;

  @override
  build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth <= 600) {
              return MobilePageView(
                indexesList: indexesList,
              );
            } else {
              return DesktopListView(
                indexesList: indexesList,
              );
            }
          },
        ));
  }
}

class MobilePageView extends StatelessWidget {
  const MobilePageView({super.key, required this.indexesList});
  final List<int> indexesList;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: PageController(viewportFraction: 0.86),
      children: [
        MobilePageViewItem(cardIndex: indexesList[0]),
        MobilePageViewItem(cardIndex: indexesList[1]),
        MobilePageViewItem(cardIndex: indexesList[2]),
      ],
    );
  }
}

class MobilePageViewItem extends StatelessWidget {
  const MobilePageViewItem({super.key, required this.cardIndex});
  final int cardIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Center(
        child: SizedBox(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 24,
                ),
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
                            CardFullScreenScreen(index: cardIndex),
                      ),
                    );
                  },
                  child: SizedBox(
                    //width: MediaQuery.of(context).size.width / 1.3,
                    child: Image.asset(
                      cards[cardIndex].link,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  textAlign: TextAlign.center,
                  cards[cardIndex].name,
                  style: const TextStyle(fontFamily: "Tan", fontSize: 18),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  textAlign: TextAlign.center,
                  cards[cardIndex].title,
                  style: const TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  textAlign: TextAlign.center,
                  cards[cardIndex].description,
                  style: const TextStyle(
                    fontFamily: "inter",
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DesktopListView extends StatelessWidget {
  const DesktopListView({super.key, required this.indexesList});
  final List<int> indexesList;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Center(
        child: ListView(
          children: [
            DesktopListViewItem(
              cardIndex: indexesList[0],
            ),
            DesktopListViewItem(
              cardIndex: indexesList[2],
            ),
            DesktopListViewItem(
              cardIndex: indexesList[1],
            ),
          ],
        ),
      ),
    );
  }
}

class DesktopListViewItem extends StatelessWidget {
  const DesktopListViewItem({super.key, required this.cardIndex});
  final int cardIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        CardFullScreenScreen(index: cardIndex),
                  ),
                );
              },
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 4,
                child: Image.asset(cards[cardIndex].link),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Column(
                children: [
                  Text(
                    textAlign: TextAlign.left,
                    cards[cardIndex].name,
                    style: TextStyle(fontFamily: "Tan", fontSize: 24),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    textAlign: TextAlign.left,
                    cards[cardIndex].title,
                    style: TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    softWrap: true,
                    textAlign: TextAlign.left,
                    cards[cardIndex].description,
                    style: TextStyle(
                      fontFamily: "inter",
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
