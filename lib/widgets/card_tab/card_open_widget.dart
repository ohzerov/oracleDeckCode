import 'package:flutter/material.dart';
import 'package:oracle/data/cards.dart';
import 'dart:math';
import 'dart:js' as js;

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
    super.initState();
  }

  @override
  void didChangeDependencies() {
    cardHeight = MediaQuery.of(context).size.height / 2;
    super.didChangeDependencies();
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              Column(
                children: [
                  AnimatedOpacity(
                      duration: const Duration(milliseconds: 500),
                      opacity: visible ? 1.0 : 0.0,
                      child: SizedBox(
                        height: 45,
                        width: MediaQuery.of(context).size.width - 36,
                        child: FittedBox(
                          child: Text(
                            name,
                            style: const TextStyle(
                                fontSize: 28,
                                fontFamily: 'Tan',
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      )),
                  const SizedBox(
                    height: 28,
                  ),

                  InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {
                      if (_controller.isAnimating) {
                        return;
                      }
                      if (_status == AnimationStatus.dismissed) {
                        newInt = Random().nextInt(cards.length);

                        // Future.delayed(const Duration(milliseconds: 700), () {

                        // });
                        precacheImage(AssetImage(cards[newInt].link), context)
                            .then((value) {
                          setState(() {
                            visible = true;
                            name = cards[newInt].name;
                            description = cards[newInt].description;
                          });
                          _controller.forward();
                        });

                        tileController.expand();
                      }
                    },
                    child: Transform(
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
                              ? Image.asset(
                                  'assets/images/back.jpg',
                                  fit: BoxFit.fill,
                                )
                              : Transform.flip(
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
                  // Vertical Flipping
                ],
              ),
              ExpansionTile(
                expandDuration: const Duration(milliseconds: 600),
                shape: const Border(),
                controller: tileController,
                trailing: const SizedBox.shrink(),
                enabled: false,
                title: const SizedBox(),
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          textAlign: TextAlign.left,
                          cards[newInt].title,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          cards[newInt].description,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      TextButton(
                        onPressed: () {
                          js.context.callMethod('open', [
                            'https://evagamayun.com/product/evidence-based-magic/'
                          ]);
                        },
                        child: Text(
                          "Get the deck",
                          style: TextStyle(fontFamily: 'Inter', fontSize: 18),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          js.context
                              .callMethod('open', [cards[newInt].buyLink]);
                        },
                        child: Text(
                          "Buy print",
                          style: TextStyle(fontFamily: 'Inter', fontSize: 18),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            visible = false;
                            //name = '';
                            //description = '';
                          });
                          tileController.collapse();
                          _controller
                              .reverse()
                              .then((value) => Navigator.of(context).pop());
                        },
                        icon: const Icon(
                          Icons.refresh_outlined,
                          color: Color.fromARGB(255, 162, 138, 208),
                        ),
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
      ),
    );
  }
}
