import 'package:flutter/material.dart';

import 'package:oracle/screens/three_cards_details_scr.dart';

import 'package:oracle/widgets/cards_tab/cards_turn_widget.dart';

class CardsTab extends StatefulWidget {
  const CardsTab({super.key});

  @override
  State<CardsTab> createState() => _CardsTabState();
}

class _CardsTabState extends State<CardsTab> {
  List<int> listOfIndexes = [];
  bool isShowButton = false;
  void showButton(List<int> indexList) {
    listOfIndexes = indexList;
    isShowButton = true;
    setState(() {});
  }

  void showThreeCardsDataScreen() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ThreeCardsDetailsScreen(
              indexesList: listOfIndexes,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Column(
                      children: [
                        CardsTurnWidget(
                          showButton: showButton,
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        CardsTurnWidget(
                          showButton: showButton,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  width: 24,
                ),
                Column(
                  children: [
                    CardsTurnWidget(
                      showButton: showButton,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 24,
            ),
            isShowButton
                ? SizedBox(
                    height: 24,
                    child: TextButton(
                        onPressed: showThreeCardsDataScreen,
                        child: Text('Read more')),
                  )
                : SizedBox(
                    height: 24,
                  ),
          ],
        ),
      ),
    );
  }
}
