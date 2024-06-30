import 'package:flutter/material.dart';
import 'main_page.dart';
import 'pages/cart/payment_page.dart';
import 'pages/cart/option.dart';
import 'pages/cart/vouchers.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:VoucherPage (),
    );
  }
}
