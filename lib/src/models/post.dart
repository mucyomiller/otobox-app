class Post {
  final String brandName;
  final String modelName;
  final String year;
  final String type;
  final String asset;
  final String logo;
  final String price;

  Post(
      {this.brandName,
      this.modelName,
      this.year,
      this.type,
      this.asset,
      this.logo,
      this.price});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      brandName: json['brand_name'],
      modelName: json['model_name'],
      year: "json['year']",
      type: "json['type']",
      asset: "json['url']",
      logo: "json['logo']",
      price: "json['price']",
    );
  }
}
