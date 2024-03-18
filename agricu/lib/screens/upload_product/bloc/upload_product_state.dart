part of 'upload_product_bloc.dart';

class UploadProductState {
  final String? name;
  final CategoryEnum? categoryEnum;
  final String? price;
  final String? unitQuantity;
  final String? description;
  final FetchState uploadState;
  final XFile? image;
  UploadProductState({
    this.categoryEnum,
    this.description,
    this.name,
    this.image,
    this.price,
    this.unitQuantity,
    this.uploadState = FetchState.initial,
  });

  UploadProductState copyWith({
    String? name,
    CategoryEnum? categoryEnum,
    String? price,
    String? unitQuantity,
    XFile? image,
    String? description,
    FetchState? uploadState,
  }) {
    return UploadProductState(
        image: image ?? this.image,
        categoryEnum: categoryEnum ?? this.categoryEnum,
        description: description ?? this.description,
        name: name ?? this.name,
        price: price ?? this.price,
        unitQuantity: unitQuantity ?? this.unitQuantity,
        uploadState: uploadState ?? this.uploadState);
  }
}
