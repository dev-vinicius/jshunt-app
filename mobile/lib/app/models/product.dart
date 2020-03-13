class Product {
  String id;
  String title;
  String description;
  String url;
  DateTime createdAt;

  Product.fromJson(Map<String, dynamic> json)
      : id = json['_id'],
        title = json['title'],
        description = json['description'],
        url = json['url'],
        createdAt = DateTime.parse(json['createdAt']);

  Map<String, dynamic> toJson() =>
    {
      '_id': id,
      'title': title,
      'description': description,
      'url': url,
    };
}