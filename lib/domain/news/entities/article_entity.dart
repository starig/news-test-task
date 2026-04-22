class ArticleEntity {
  final SourceEntity source;
  final String? author;
  final String title;
  final String description;
  final String urlToImage;
  final String publishedAt;
  final String content;

  ArticleEntity({
    required this.source,
    this.author,
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });
}

class SourceEntity {
  final String? id;
  final String? name;

  SourceEntity({this.id, this.name});
}
