import 'package:flutter/material.dart';
import 'package:oracle/screens/card_details_screen.dart';
import 'package:oracle/data/cards.dart';
import 'package:oracle/models/cardModel.dart';

class Gallery extends StatelessWidget {
  const Gallery({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth <= 600) {
        return const GalleryMobile();
      } else {
        return Center(
          child: SizedBox(
              width: MediaQuery.of(context).size.width / 1.3,
              child: const GalleryDesktop()),
        );
      }
    });
  }
}

class GalleryMobile extends StatefulWidget {
  const GalleryMobile({super.key});

  @override
  State<GalleryMobile> createState() => _GalleryMobileState();
}

class _GalleryMobileState extends State<GalleryMobile> {
  final _searchController = TextEditingController();
  List<OracleCard> _fiteredCards = cards;
  void _searchCards() {
    final query = _searchController.text;
    if (query.isEmpty) {
      _fiteredCards = cards;
    } else {
      _fiteredCards = cards.where((OracleCard card) {
        return card.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    setState(() {});
  }

  @override
  void initState() {
    _searchController.addListener(_searchCards);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8),
          child: GridView.builder(
            padding: const EdgeInsets.only(top: 100),
            itemCount: _fiteredCards.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                hoverColor: Colors.transparent,
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CardDetailsScreen(
                        index: cards.indexWhere((item) =>
                            item.name.contains(_fiteredCards[index].name)),
                      ),
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    _fiteredCards[index].link,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.65,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              //mainAxisExtent: 275,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:
                      const BorderSide(width: 0, style: BorderStyle.none)),
              prefixIcon: const Icon(Icons.search_outlined),
              hintText: 'SEARCH CARDS',
              filled: true,
              fillColor:
                  const Color.fromARGB(255, 240, 242, 242).withAlpha(220),
            ),
            controller: _searchController,
          ),
        ),
      ],
    );
  }
}

class GalleryDesktop extends StatefulWidget {
  const GalleryDesktop({super.key});

  @override
  State<GalleryDesktop> createState() => _GalleryDesktopState();
}

class _GalleryDesktopState extends State<GalleryDesktop> {
  final _searchController = TextEditingController();
  List<OracleCard> _fiteredCards = cards;
  void _searchCards() {
    final query = _searchController.text;
    if (query.isEmpty) {
      _fiteredCards = cards;
    } else {
      _fiteredCards = cards.where((OracleCard card) {
        return card.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    setState(() {});
  }

  @override
  void initState() {
    _searchController.addListener(_searchCards);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GridView.builder(
          padding: const EdgeInsets.only(top: 100),
          itemCount: _fiteredCards.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CardDetailsScreen(
                      index: cards.indexWhere((item) =>
                          item.name.contains(_fiteredCards[index].name)),
                    ),
                  ),
                );
              },
              child: SizedBox(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    _fiteredCards[index].link,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.7,
            crossAxisSpacing: 32,
            mainAxisSpacing: 32,
            //mainAxisExtent: 375,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:
                      const BorderSide(width: 0, style: BorderStyle.none)),
              prefixIcon: const Icon(Icons.search_outlined),
              hintText: 'SEARCH CARDS',
              filled: true,
              fillColor:
                  const Color.fromARGB(255, 240, 242, 242).withAlpha(220),
            ),
            controller: _searchController,
          ),
        ),
      ],
    );
  }
}
