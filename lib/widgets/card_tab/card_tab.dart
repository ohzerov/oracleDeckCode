import "dart:ui";

import "package:flutter/material.dart";

import "package:oracle/widgets/card_tab/PageViewHolder.dart";
import 'package:provider/provider.dart';
import 'card_open_widget.dart';

class CardTab extends StatefulWidget {
  const CardTab({super.key});

  @override
  State<CardTab> createState() => _CardTabState();
}

class _CardTabState extends State<CardTab> with TickerProviderStateMixin {
  late PageViewHolder pageViewHolder;
  late PageController pageCtrl;

  double fraction = 0.5;
  final ExpansionTileController tileController = ExpansionTileController();
  late AnimationController _controller;
  late Animation _animation;
  AnimationStatus _status = AnimationStatus.dismissed;
  int newInt = 0;
  String name = '';
  String description = '';
  bool visible = false;
  // int _currentIndex = 0;
  @override
  void initState() {
    super.initState();

    pageCtrl = PageController(initialPage: 10, viewportFraction: fraction);

    pageViewHolder = PageViewHolder(value: 10);
    pageCtrl.addListener(() {
      pageViewHolder.setValue(pageCtrl.page);
    });

    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _animation = Tween(end: 1.0, begin: 0.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        _status = status;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        double screenWidth = constraints.maxWidth;
        double cardAspectRatio = 0.66;
        double cardWidth = screenWidth / 5;
        //double cardHeight = cardWidth * cardAspectRatio;
        if (constraints.maxWidth <= 600) {
          return AspectRatio(
            aspectRatio: 1,
            child: ChangeNotifierProvider<PageViewHolder>.value(
              value: pageViewHolder,
              child: PageView.builder(
                controller: pageCtrl,
                //itemCount: 50,
                itemBuilder: (context, index) {
                  return Page(
                    number: index.toDouble(),
                    fraction: fraction,
                  );
                },
              ),
            ),
          );
        } else {
          return PageView.builder(
            scrollBehavior: const ScrollBehavior().copyWith(dragDevices: {
              PointerDeviceKind.touch,
              PointerDeviceKind.mouse,
              PointerDeviceKind.stylus,
            }),
            controller: PageController(
                initialPage: 10,
                viewportFraction: cardWidth / (screenWidth / 1.2)),
            // Example item count
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Center(
                  child: AspectRatio(
                    aspectRatio: cardAspectRatio,
                    child: InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const CardTurnWidget(),
                          ),
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: SizedBox(
                          child: Hero(
                            tag: 'image_back',
                            child: Image.asset(
                              'assets/images/back.jpg',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }
}

class Page extends StatefulWidget {
  final double number;
  final double fraction;
  const Page({super.key, required this.number, required this.fraction});

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> {
  double padding = 0.0;
  @override
  Widget build(BuildContext context) {
    double value = Provider.of<PageViewHolder>(context).value;
    double diff = (widget.number - value);

    final Matrix4 pvMatrix = Matrix4.identity()
      ..setEntry(3, 3, 0.88) // Increasing Scale by 90%
      ..setEntry(1, 1, 0.75) // Changing Scale Along Y Axis
      ..setEntry(3, 0, 0.001 * -diff);

    return Transform(
      transform: pvMatrix,
      alignment: FractionalOffset.center,
      child: Padding(
        padding: EdgeInsets.only(bottom: padding),
        child: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const CardTurnWidget(),
              ),
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: SizedBox(
              child: Image.asset(
                'assets/images/back.jpg',
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PageDesktop extends StatelessWidget {
  const PageDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const CardTurnWidget(),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: SizedBox(
          width: 100,
          height: 500,
          child: Image.asset(
            'assets/images/back.jpg',
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
