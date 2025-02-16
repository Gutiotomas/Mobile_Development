import 'package:flutter/material.dart';
import 'presentation/bloc/bloc_provider.dart';
import 'presentation/screens/quote_page.dart';

void main() {
  runApp(const BlocProviderApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reviews',
      home: const QuotePage(),
    );
  }
}