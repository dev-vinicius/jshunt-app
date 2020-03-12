class Product {
  String title;
  String description;
  String url;
  DateTime createdAt;

  Product.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        description = json['description'],
        url = json['url'],
        createdAt = DateTime.parse(json['createdAt']);

  Map<String, dynamic> toJson() =>
    {
      'title': title,
      'description': description,
      'url': url,
    };
}