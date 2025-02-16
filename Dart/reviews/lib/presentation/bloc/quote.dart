class Quote {
  final String quote;
  final String author;

  Quote(this.quote, this.author);

  Quote.fromJson(Map<String, dynamic> object)
      : quote = object['q'] ?? "No aplica",
        author = object['a'] ?? "Anónimo";
}