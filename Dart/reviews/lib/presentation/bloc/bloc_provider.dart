import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'quote_bloc.dart';
import '../../main.dart'; // Ensure this import is added

class BlocProviderApp extends StatelessWidget {
  const BlocProviderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => QuoteBloc(),
          lazy: true,
        ),
      ],
      child: const MyApp(),
    );
  }
}