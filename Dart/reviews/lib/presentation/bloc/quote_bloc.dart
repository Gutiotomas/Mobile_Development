import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'quote.dart';
import 'quote_event.dart';
import 'quote_state.dart';

class QuoteBloc extends Bloc<QuoteEvent, QuoteState> {
  QuoteBloc() : super(QuoteInitial()) {
    on<FetchQuote>(_onFetchQuote);
    on<ClearQuote>(_onClearQuote);
  }

  static const url = 'https://zenquotes.io/api/random';
  static const corsProxy = 'https://cors-anywhere.herokuapp.com/';

  Future<void> _onFetchQuote(FetchQuote event, Emitter<QuoteState> emit) async {
    emit(QuoteLoading());
    try {
      final Uri uri = Uri.parse(corsProxy + url);
      final response = await http.get(uri);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        final List quoteJson = json.decode(response.body);
        final quote = Quote.fromJson(quoteJson[0]);
        emit(QuoteLoaded(quote: '${quote.quote} - ${quote.author}'));
      } else {
        emit(QuoteError(message: 'Error al obtener la reseña'));
      }
    } catch (e) {
      print('Error: $e');
      emit(QuoteError(message: 'Error de red: ${e.toString()}'));
    }
  }

  void _onClearQuote(ClearQuote event, Emitter<QuoteState> emit) {
    emit(QuoteInitial());
  }
}