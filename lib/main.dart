import "package:flutter/material.dart";
import "package:oracle/screens/tabs_screen.dart";

void main() {
  runApp(const OracleDeckApp());
}

class OracleDeckApp extends StatelessWidget {
  const OracleDeckApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        primarySwatch: Colors.blue,
      ),
      home: const TabsScreen(),
    );
  }
}
