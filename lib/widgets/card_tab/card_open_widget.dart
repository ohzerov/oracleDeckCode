import 'package:flutter/material.dart';

import 'package:oracle/data/cards.dart';
import 'package:flutter/services.dart';
import 'dart:math';

import 'package:oracle/widgets/card_tab/card_fullscreen_widget.dart';

class CardTurnWidget extends StatefulWidget {
  const CardTurnWidget({super.key});

  @override
  State<CardTurnWidget> createState() => _CardTurnWidgetState();
}

class _CardTurnWidgetState extends State<CardTurnWidget>
    with TickerProviderStateMixin {
  final ExpansionTileController tileController = ExpansionTileController();
  late AnimationController _controller;
  late Animation _animation;
  AnimationStatus _status = AnimationStatus.dismissed;
  int newInt = 0;
  String name = '';
  String description = '';
  bool visible = false;
  late double cardHeight;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _animation = Tween(end: 1.0, begin: 0.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        _status = status;
      });
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) onOpenCard();
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    cardHeight = MediaQuery.of(context).size.height / 1.6;
    super.didChangeDependencies();
  }

  void onOpenCard() {
    if (_controller.isAnimating) {
      return;
    }
    if (_status == AnimationStatus.dismissed) {
      newInt = Random().nextInt(cards.length);

      precacheImage(AssetImage(cards[newInt].link), context).then((value) {
        setState(() {
          name = cards[newInt].name;
          description = cards[newInt].description;
        });

        _controller.forward();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        double descriptionTextWidth;

        if (constraints.maxWidth > 600) {
          descriptionTextWidth = constraints.maxWidth / 2.5;
        } else {
          descriptionTextWidth = constraints.maxWidth / 1.2;
        }

        return SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 70,
                ),
                Column(
                  children: [
                    Transform(
                      alignment: FractionalOffset.center,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.0015)
                        ..rotateY(pi * _animation.value),
                      child: Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24)),
                        child: SizedBox(
                          height: cardHeight,
                          child: _animation.value <= 0.5
                              ? Hero(
                                  tag: 'image_back',
                                  child: Image.asset(
                                    'assets/images/back.jpg',
                                    fit: BoxFit.fill,
                                  ),
                                )
                              : InkWell(
                                  hoverColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onTap: () {
                                    HapticFeedback.heavyImpact();
                                    setState(() {
                                      visible = true;
                                      name = cards[newInt].name;
                                      description = cards[newInt].description;
                                      tileController.expand();
                                    });
                                  },
                                  onDoubleTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            CardFullScreenScreen(index: newInt),
                                      ),
                                    );
                                  },
                                  child: Transform.flip(
                                    flipX: true,
                                    child: Image.asset(
                                      cards[newInt].link,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Center(
                        child: Text(
                      'tap to read, doubletap to fullscreen',
                      style:
                          TextStyle(color: Color.fromARGB(255, 159, 159, 159)),
                    )),
                    // Vertical Flipping
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                ExpansionTile(
                  shape: const Border(),
                  controller: tileController,
                  trailing: const SizedBox.shrink(),
                  enabled: false,
                  title: const SizedBox.shrink(),
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 1.1,
                          child: Text(
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            name.toUpperCase(),
                            style: const TextStyle(
                                fontSize: 24,
                                fontFamily: 'Tan',
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            textAlign: TextAlign.center,
                            cards[newInt].title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: SizedBox(
                            width: descriptionTextWidth,
                            child: Text(
                              textAlign: TextAlign.center,
                              cards[newInt].description,
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        const SizedBox(
                          width: 42,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
