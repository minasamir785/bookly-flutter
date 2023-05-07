import 'package:flutter/material.dart';

abstract class Styles {
  static const textstyle18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
  static const textstyle20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );
  static const textstyle16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
  static final textstyle14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static final textstyleLowOpacity14 = TextStyle(
    fontSize: 14,
    color: Colors.white.withOpacity(0.5),
    fontWeight: FontWeight.w100,
  );
  static const textstyleLowOpacity18 = TextStyle(
    fontSize: 18,
    color: Colors.white70,
    fontWeight: FontWeight.bold,
  );
  static const textstyle30 = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w600,
  );
}
