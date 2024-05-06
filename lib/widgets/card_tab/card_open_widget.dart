import 'package:flutter/material.dart';
import 'package:oracle/data/cards.dart';
import 'dart:math';

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
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Container(
                child: Column(
                  children: [
                    AnimatedOpacity(
                        duration: Duration(milliseconds: 500),
                        opacity: visible ? 1.0 : 0.0,
                        child: SizedBox(
                          height: 45,
                          width: MediaQuery.of(context).size.width - 36,
                          child: FittedBox(
                            child: Text(
                              name,
                              style: TextStyle(
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

                          Future.delayed(Duration(milliseconds: 700), () {
                            setState(() {
                              visible = true;
                              name = cards[newInt].name;
                              description = cards[newInt].description;
                            });
                          });
                          precacheImage(AssetImage(cards[newInt].link), context)
                              .then((value) => _controller.forward());

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
                          child: _animation.value <= 0.5
                              ? Container(
                                  height:
                                      MediaQuery.of(context).size.height / 2,
                                  child: Image.asset(
                                    'assets/images/back.jpg',
                                    fit: BoxFit.fill,
                                  ),
                                )
                              : Container(
                                  height:
                                      MediaQuery.of(context).size.height / 2,
                                  child: Transform.flip(
                                    flipX: true,
                                    child: Image.asset(
                                      cards[newInt].link,
                                      fit: BoxFit.cover,
                                    ),
                                  )),
                        ),
                      ),
                    ),
                    // Vertical Flipping
                  ],
                ),
              ),
              ExpansionTile(
                expandDuration: Duration(milliseconds: 600),
                shape: Border(),
                controller: tileController,
                trailing: SizedBox.shrink(),
                enabled: false,
                title: SizedBox(),
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          cards[newInt].title,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          cards[newInt].description,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      SizedBox(
                        height: 6,
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
                        icon: Icon(
                          Icons.refresh_outlined,
                          color: const Color.fromARGB(255, 162, 138, 208),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
