import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:oracle/models/cardsDataModel.dart';
import 'package:oracle/widgets/card_tab/card_tab.dart';
import 'package:oracle/widgets/cards_tab/cards_tab.dart';
import 'package:oracle/widgets/gallery_tab/gallery_tab.dart';
import 'package:oracle/widgets/info_tab/info_tab.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

// don't forget "with SingleTickerProviderStateMixin"
class _TabsScreenState extends State<TabsScreen> {
  int _currentIndex = 0;
  bool isLoading = false;

  List<Widget> body = [
    CardTab(),
    ChangeNotifierProvider(
      create: (_) => CardsDataModel(),
      child: CardsTab(),
    ),
    Gallery(),
    Info(),
  ];

  @override
  Widget build(BuildContext context) {
    double iconSize = 40;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 242, 242),
      bottomNavigationBar: SizedBox(
        child: BottomNavigationBar(
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _currentIndex,
          onTap: (int newIdex) {
            setState(() {
              _currentIndex = newIdex;
            });
          },
          backgroundColor: Colors.transparent,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              // activeIcon:
              //     Image.asset(width: 65, height: 65, 'assets/icons/card.png'),
              icon: Image.asset(
                  width: iconSize,
                  height: iconSize,
                  'assets/icons/card.png'), //Icon(Icons.card_giftcard_outlined),
              label: 'Card of the day',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                  width: iconSize, height: iconSize, 'assets/icons/cards.png'),
              label: 'Cards',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                  width: iconSize,
                  height: iconSize,
                  'assets/icons/gallery.png'),
              label: 'Gallery',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                  width: iconSize, height: iconSize, 'assets/icons/info.png'),
              label: 'Info',
            ),
          ],
        ),
      ),
      body: body[_currentIndex],
    );
  }
}
