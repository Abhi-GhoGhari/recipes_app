class RecipeModal {
  String name;
  String catagory;
  String price;
  RecipeModal({
    required this.name,
    required this.catagory,
    required this.price,
  });

  factory RecipeModal.fromJson(Map<String, dynamic> json) => RecipeModal(
        name: json["id"],
        catagory: json["quote"],
        price: json["author"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "catagory": catagory,
        "price": price,
      };
}
