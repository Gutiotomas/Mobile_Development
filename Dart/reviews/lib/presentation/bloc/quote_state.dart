abstract class QuoteState {}

class QuoteInitial extends QuoteState {}

class QuoteLoading extends QuoteState {}

class QuoteLoaded extends QuoteState {
  final String quote;

  QuoteLoaded({required this.quote});
}

class QuoteError extends QuoteState {
  final String message;

  QuoteError({required this.message});
}