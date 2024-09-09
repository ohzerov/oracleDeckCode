import 'package:flutter/material.dart';
import 'package:oracle/models/cardsDataModel.dart';
import 'package:oracle/widgets/cards_tab/showButtonCounter.dart';
import 'package:provider/provider.dart';
import 'package:oracle/screens/three_cards_details_scr.dart';

import 'package:oracle/widgets/cards_tab/cards_turn_widget.dart';

class CardsTab extends StatefulWidget {
  const CardsTab({super.key});

  @override
  State<CardsTab> createState() => _CardsTabState();
}

class _CardsTabState extends State<CardsTab> {
  List<int> listOfIndexes = [];
  int isShowButtonCounter = 0;
  bool isShowButton = false;
  void showButton(
    List<int> indexList,
  ) {
    listOfIndexes = indexList;
    isShowButton = true;

    setState(() {});
  }

  void showThreeCardsDataScreen() {
    var dataModel = Provider.of<CardsDataModel>(context, listen: false);
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ThreeCardsDetailsScreen(
              indexesList: dataModel.dataList,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 600) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Provider.of<CardsDataModel>(context, listen: false).resetValues();
            Provider.of<ShowButtonCounter>(context, listen: false)
                .resetValues();
          });

          return cardsTabDesktopLayout(
              isShowButton: isShowButton,
              showButton: showButton,
              showThreeCardsDataScreen: showThreeCardsDataScreen);
        } else {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Provider.of<CardsDataModel>(context, listen: false).resetValues();
            Provider.of<ShowButtonCounter>(context, listen: false)
                .resetValues();
          });
          return cardsTabMobileLayout(
              isShowButtonCounter: isShowButtonCounter,
              isShowButton: isShowButton,
              showButton: showButton,
              showThreeCardsDataScreen: showThreeCardsDataScreen);
        }
      },
    );
  }
}

class cardsTabMobileLayout extends StatelessWidget {
  cardsTabMobileLayout(
      {required this.isShowButtonCounter,
      required this.isShowButton,
      required this.showButton,
      required this.showThreeCardsDataScreen});

  Function(List<int>) showButton;
  Function() showThreeCardsDataScreen;
  bool isShowButton;
  int isShowButtonCounter = 0;
  @override
  Widget build(BuildContext context) {
    final myNotifier = Provider.of<ShowButtonCounter>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.width / 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Column(
                          children: [
                            CardsTurnWidget(
                              showButton: showButton,
                              position: 0,
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            CardsTurnWidget(
                              position: 2,
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
                          position: 1,
                          showButton: showButton,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  height: 48,
                  child: myNotifier.isShowButton
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: SizedBox(
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Color.fromARGB(255, 6, 1, 7),
                                side: const BorderSide(
                                    width: 2, color: Colors.black),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                              onPressed: showThreeCardsDataScreen,
                              child: const Text('Read Cards',
                                  style: TextStyle(fontSize: 18)),
                            ),
                          ),
                        )
                      : const SizedBox(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class cardsTabDesktopLayout extends StatelessWidget {
  cardsTabDesktopLayout(
      {required this.isShowButton,
      required this.showButton,
      required this.showThreeCardsDataScreen});

  Function(List<int>) showButton;
  Function() showThreeCardsDataScreen;
  bool isShowButton;
  @override
  Widget build(BuildContext context) {
    final myNotifier = Provider.of<ShowButtonCounter>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CardsTurnWidget(
                      position: 0,
                      showButton: showButton,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    CardsTurnWidget(
                      position: 2,
                      showButton: showButton,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    CardsTurnWidget(
                      position: 1,
                      showButton: showButton,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 48,
                ),
                SizedBox(
                  height: 48,
                  child: myNotifier.isShowButton
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 200),
                          child: SizedBox(
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                foregroundColor:
                                    const Color.fromARGB(255, 0, 0, 0),
                                side: const BorderSide(
                                    width: 2, color: Colors.black),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                              onPressed: showThreeCardsDataScreen,
                              child: const Padding(
                                padding: EdgeInsets.all(12),
                                child: Text('READ CARDS',
                                    style: TextStyle(fontSize: 18)),
                              ),
                            ),
                          ),
                        )
                      : const SizedBox(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
