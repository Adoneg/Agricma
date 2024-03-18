import 'package:agricu/enums/availability_type_enum.dart';
import 'package:agricu/enums/category_enum.dart';
import 'package:agricu/enums/fetch_state_enum.dart';
import 'package:agricu/models/product.dart';
import 'package:agricu/models/user.dart';
import 'package:agricu/services/db.dart';
import 'package:agricu/services/storage.dart';
import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'upload_product_event.dart';
part 'upload_product_state.dart';

class UploadProductBloc extends Bloc<UploadProductEvent, UploadProductState> {
  final AppUser? user;
  final db = DBMethods();
  final storage = Storage();
  UploadProductBloc({this.user}) : super(UploadProductState()) {
    on<OnProductName>((event, emit) {
      emit(state.copyWith(name: event.name));
    });
    on<OnCategory>((event, emit) {
      emit(state.copyWith(categoryEnum: event.category));
    });
    on<OnPrice>((event, emit) {
      emit(state.copyWith(price: event.price));
    });
    on<OnImage>((event, emit) {
      if (event.image == null) {
        emit(UploadProductState(
          categoryEnum: state.categoryEnum,
          description: state.description,
          name: state.name,
          price: state.price,
          unitQuantity: state.unitQuantity,
          uploadState: state.uploadState,
          image: null,
        ));
      } else {
        emit(state.copyWith(image: event.image));
      }
    });
    on<OnQuantity>((event, emit) {
      emit(state.copyWith(unitQuantity: event.quantity));
    });
    on<OnDescription>((event, emit) {
      emit(state.copyWith(description: event.description));
    });
    on<OnUpload>((event, emit) async {
      emit(state.copyWith(uploadState: FetchState.loading));

      try {
        String? image;
        if (state.image != null) {
          image = await storage.uploadImage(state.image!, 'products');
        }
        final product = Product(
            image: image,
            category: state.categoryEnum,
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
            description: state.description,
            name: state.name,
            price: double.parse(state.price!),
            priceQuantityRatio: state.unitQuantity,
            status: Availability.available,
            stars: 3.0,
            sellerId: user?.userId);
        await db.uploadProduct(product);

        emit(state.copyWith(uploadState: FetchState.success));
      } catch (e) {
        emit(state.copyWith(uploadState: FetchState.failed));
      }
    });
  }
}
