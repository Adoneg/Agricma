enum CategoryEnum {
  all,
  food,
  vegetables,
  drinks;

  String toDBString() {
    return switch (this) {
      CategoryEnum.food => "Food",
      CategoryEnum.vegetables => "Vegetable",
      CategoryEnum.drinks => "Drink",
      CategoryEnum.all => "All Products",
    };
  }

  factory CategoryEnum.fromString(String? val) {
    return switch (val) {
      "All Products" => CategoryEnum.all,
      "Food" => CategoryEnum.food,
      "Vegetable" => CategoryEnum.vegetables,
      "Drink" => CategoryEnum.drinks,
      String() => CategoryEnum.food,
      null => CategoryEnum.food,
    };
  }
}
