import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  const Info({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 100,
            backgroundImage: AssetImage('assets/images/eva.jpg'),
          ),
          SizedBox(
            height: 16,
          ),
          SizedBox(
            width: 230,
            child: Text(
              textAlign: TextAlign.center,
              "This is Eva Gamayun's Oracle deck",
              style: TextStyle(
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w500,
                  fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}
