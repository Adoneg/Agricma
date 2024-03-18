enum Availability {
  available,
  unavailable,
  limited;

  String toDBString() {
    return switch (this) {
      Availability.available => "Available",
      Availability.unavailable => "Unavailable",
      Availability.limited => "Limited",
    };
  }

  factory Availability.fromString(String? availability) {
    return switch (availability) {
      "Available" => Availability.available,
      "Limited" => Availability.limited,
      "Unavailable" => Availability.unavailable,
      String() => Availability.unavailable,
      null => Availability.unavailable,
    };
  }
}
