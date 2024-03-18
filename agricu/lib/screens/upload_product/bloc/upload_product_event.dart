part of 'upload_product_bloc.dart';

@immutable
sealed class UploadProductEvent {}

class OnProductName extends UploadProductEvent {
  final String? name;
  OnProductName({this.name});
}

class OnCategory extends UploadProductEvent {
  final CategoryEnum? category;
  OnCategory({this.category});
}

class OnPrice extends UploadProductEvent {
  final String? price;
  OnPrice({this.price});
}

class OnQuantity extends UploadProductEvent {
  final String? quantity;
  OnQuantity({this.quantity});
}

class OnDescription extends UploadProductEvent {
  final String? description;
  OnDescription({this.description});
}

class OnImage extends UploadProductEvent {
  final XFile? image;
  OnImage({this.image});
}

class OnUpload extends UploadProductEvent {}
