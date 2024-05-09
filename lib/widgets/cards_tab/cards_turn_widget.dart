import 'dart:math';
import 'package:oracle/models/cardsDataModel.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:oracle/data/cards.dart';

class CardsTurnWidget extends StatefulWidget {
  const CardsTurnWidget({super.key, required this.showButton});
  final Function(List<int>) showButton;

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
    var dataModel = Provider.of<CardsDataModel>(context, listen: false);
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        if (_controller.isAnimating) {
          return;
        }
        if (_status == AnimationStatus.dismissed) {
          newInt = Random().nextInt(cards.length);
          dataModel.add(newInt);
          if (dataModel.dataList.length == 3)
            widget.showButton(dataModel.dataList);
          precacheImage(AssetImage(cards[newInt].link), context).then((value) {
            setState(() {
              visible = true;
              name = cards[newInt].name;
            });
            _controller.forward();
          });

          //tileController.expand();
        }
      },
      child: Transform(
        alignment: FractionalOffset.center,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.0015)
          ..rotateY(pi * _animation.value),
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 3,
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
    );
  }
}
