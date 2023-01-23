class Category {
  final int id;
  final String name;
  final String slug;
  final int parent;

  Category(
      {required this.id,
      required this.name,
      required this.slug,
      required this.parent});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      parent: json['parent'],
    );
  }
}
