class Book{
  final String title;
  late final List<String> _authorsNames;
  late final double? _rating;
  final int ratingCount;
  final String? imageUrl;
  final String? previewLink;
  final String? downloadLink;

  Book({
    required this.title,
    required List<String> authorsNames,
    int? rating,
    this.ratingCount = 0,
    this.imageUrl,
    this.previewLink,
    this.downloadLink,
  }){
    _rating = rating?.toDouble();
    _authorsNames = authorsNames;
  }

  factory Book.fromJson(Map json){
    return Book(
      title: json['volumeInfo']['title'],
      authorsNames: List<String>.from(json['volumeInfo']['authors'] ?? [],),
      rating: json['averageRating'],
      ratingCount: json['ratingsCount'] ?? 0,
      imageUrl: json['volumeInfo']['imageLinks']['thumbnail'],
      previewLink: json['previewLink'],
      downloadLink: json['accessInfo']['pdf']['acsTokenLink'],
    );
  }

  bool get canBeDownloaded => downloadLink != null;
  bool get canBePreviewd => previewLink != null;
  bool get hasImage => imageUrl != null;
  String get rating => (_rating == null ? 'No Rating' : _rating.toString());
  String get price => 'Free';
  String get authors => _authorsNames.join(', ');
}