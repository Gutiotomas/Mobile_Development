import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/quote_bloc.dart';
import '../bloc/quote_event.dart';
import '../bloc/quote_state.dart';

class QuotePage extends StatelessWidget {
  const QuotePage({super.key});

  @override
  Widget build(BuildContext context) {
    final getQuote = context.read<QuoteBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Reseñas de ZenQuotes'),
      ),
      body: Center(
        child: BlocBuilder<QuoteBloc, QuoteState>(
          builder: (context, state) {
            if (state is QuoteInitial) {
              return const Text('Presiona el botón para obtener una reseña');
            } else if (state is QuoteLoading) {
              return const CircularProgressIndicator();
            } else if (state is QuoteLoaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    state.quote.split(' - ')[0], // Display the quote
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    state.quote.split(' - ')[1], // Display the author
                    style: const TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                    textAlign: TextAlign.center,
                  ),
                ],
              );
            } else if (state is QuoteError) {
              return Text(
                state.message,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              );
            } else {
              return const Text('Estado desconocido');
            }
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              getQuote.add(FetchQuote());
            },
            child: const Icon(Icons.refresh),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              context.read<QuoteBloc>().add(ClearQuote());
            },
            child: const Icon(Icons.clear),
          ),
        ],
      ),
    );
  }
}