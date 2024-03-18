enum CategoryEnum {
  food,
  vegetables,
  drinks;

  String toDBString() {
    return switch (this) {
      CategoryEnum.food => "food",
      CategoryEnum.vegetables => "vegetable",
      CategoryEnum.drinks => "drink",
    };
  }

  factory CategoryEnum.fromString(String? val) {
    return switch (val) {
      "food" => CategoryEnum.food,
      "vegetable" => CategoryEnum.vegetables,
      "drink" => CategoryEnum.drinks,
      String() => CategoryEnum.food,
      null => CategoryEnum.food,
    };
  }
}
