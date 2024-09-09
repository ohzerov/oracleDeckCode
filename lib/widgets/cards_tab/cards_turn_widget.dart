import 'dart:math';
import 'package:oracle/models/cardsDataModel.dart';
import 'package:oracle/screens/three_cards_details_scr.dart';
import 'package:oracle/widgets/cards_tab/showButtonCounter.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:oracle/data/cards.dart';

class CardsTurnWidget extends StatefulWidget {
  const CardsTurnWidget(
      {super.key, required this.showButton, required this.position});
  final Function(List<int>) showButton;
  final int position;
  @override
  State<CardsTurnWidget> createState() => _CardsTurnWidgetState();
}

class _CardsTurnWidgetState extends State<CardsTurnWidget>
    with TickerProviderStateMixin {
  final ExpansionTileController tileController = ExpansionTileController();
  late AnimationController _controller;
  late Animation _animation;
  AnimationStatus _status = AnimationStatus.dismissed;
  int newInt = 0;
  String name = '';
  String description = '';
  bool visible = false;
  bool isProcessing = false;

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

  void checkRandomValue(
      CardsDataModel dataModel, ShowButtonCounter counterNotifier) {
    if (_controller.isAnimating) {
      return;
    }
    isProcessing = true;
    newInt = Random().nextInt(cards.length);
    if (_status == AnimationStatus.dismissed) {
      if (dataModel.dataList.contains(newInt)) {
        checkRandomValue(dataModel, counterNotifier);
      } else {
        dataModel.add(newInt, widget.position);
        counterNotifier.add();

        precacheImage(AssetImage(cards[newInt].link), context).then((value) {
          setState(() {
            visible = true;
          });
          _controller.forward();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final myNotifier = Provider.of<ShowButtonCounter>(context);
    var dataModel = Provider.of<CardsDataModel>(context, listen: false);
    double screenWidth = MediaQuery.of(context).size.width;

    const int mobileBreakpoint = 450;
    const int tabletBreakpoint = 950;
    BoxConstraints constraints;

    if (screenWidth < mobileBreakpoint) {
      constraints = BoxConstraints(
        minHeight: MediaQuery.of(context).size.height / 5,
        minWidth: MediaQuery.of(context).size.width / 2.5,
        maxWidth: MediaQuery.of(context).size.width / 2.5,
      );
    } else if (screenWidth <= tabletBreakpoint &&
        screenWidth > mobileBreakpoint) {
      constraints = BoxConstraints(
        minHeight: MediaQuery.of(context).size.height / 10,
        minWidth: MediaQuery.of(context).size.width / 5,
        maxWidth: MediaQuery.of(context).size.width / 5,
      );
    } else {
      constraints = BoxConstraints(
        minHeight: MediaQuery.of(context).size.height / 10,
        minWidth: MediaQuery.of(context).size.width / 5,
        maxWidth: MediaQuery.of(context).size.width / 5,
      );
    }
    return Transform(
      alignment: FractionalOffset.center,
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.0015)
        ..rotateY(pi * _animation.value),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(MediaQuery.of(context).size.height / 50)),
        child: ConstrainedBox(
          constraints: constraints,

          //height: MediaQuery.of(context).size.height / 5,
          child: _animation.value <= 0.5
              ? InkWell(
                  hoverColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    if (isProcessing) {
                      return;
                    }

                    checkRandomValue(dataModel, myNotifier);
                  },
                  child: Image.asset(
                    'assets/images/back.jpg',
                    fit: BoxFit.cover,
                  ),
                )
              : InkWell(
                  hoverColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    if (dataModel.dataList.length == 3) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ThreeCardsDetailsScreen(
                                indexesList: dataModel.dataList,
                              )));
                    }
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
    );
  }
}
