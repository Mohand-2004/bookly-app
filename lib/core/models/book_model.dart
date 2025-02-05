import 'package:bookly/core/extensions/string/validations.dart';

class Book{
  final String id;
  final String title;
  late final List<String> authorsNames;
  late final num? _rating;
  final int ratingCount;
  final String? imageUrl;
  final String? previewLink;
  final String? downloadLink;

  Book({
    required this.id,
    required this.title,
    required this.authorsNames,
    num? rating,
    this.ratingCount = 0,
    this.imageUrl,
    this.previewLink,
    this.downloadLink,
  }){
    _rating = rating?.toDouble();
  }

  factory Book.fromJson(Map json){
    return Book(
      id: json['id'],
      title: json['volumeInfo']['title'],
      authorsNames: List<String>.from(json['volumeInfo']['authors'] ?? [],),
      rating: json['volumeInfo']['averageRating'],
      ratingCount: json['volumeInfo']['ratingsCount'] ?? 0,
      imageUrl: json['volumeInfo']['imageLinks']?['thumbnail'] ?? '',
      previewLink: json['volumeInfo']['previewLink'],
      downloadLink: json['accessInfo']['pdf']['acsTokenLink'],
    );
  }

  factory Book.fromLocalDataSource(Map json){
    return Book(
      id: json['id'],
      title: json['title'],
      authorsNames: List<String>.from(json['authors'],),
      rating: json['rating'],
      ratingCount: json['rating_count'],
      imageUrl: json['image_url'],
      previewLink: json['preview_link'],
      downloadLink: json['download_link'],
    );
  }

  bool get canBeDownloaded => downloadLink.hasValue;
  bool get canBePreviewd => previewLink.hasValue;
  bool get hasImage => imageUrl.hasValue;
  String get rating => (_rating == null || _rating == 0 ? 'No Rating' : _rating.toString());
  String get price => 'Free';
  String get authors => authorsNames.join(', ');
}