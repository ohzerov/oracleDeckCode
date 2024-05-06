import 'package:flutter/material.dart';

class CardsTurnWidget extends StatefulWidget {
  const CardsTurnWidget({super.key});

  @override
  State<CardsTurnWidget> createState() => _CardsTurnWidgetState();
}

class _CardsTurnWidgetState extends State<CardsTurnWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Image.asset(
                    'assets/images/back.jpg',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Image.asset(
                    'assets/images/back.jpg',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 2,
            child: Image.asset(
              'assets/images/back.jpg',
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    ));
  }
}
