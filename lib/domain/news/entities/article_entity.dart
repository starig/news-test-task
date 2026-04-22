class ArticleEntity {
  final SourceEntity source;
  final String? author;
  final String title;
  final String? description;
  final String? urlToImage;
  final String publishedAt;
  final String? content;

  ArticleEntity({
    required this.source,
    this.author,
    required this.title,
    this.description,
    this.urlToImage,
    required this.publishedAt,
    this.content,
  });

  String get displayTime {
    final date = DateTime.tryParse(publishedAt);
    if (date == null) return publishedAt;

    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');
    final year = date.year.toString();

    return '$month.$day.$year';
  }
}

class SourceEntity {
  final String? id;
  final String? name;

  SourceEntity({this.id, this.name});
}
