import 'dart:io';

import 'package:agricu/enums/category_enum.dart';
import 'package:agricu/enums/fetch_state_enum.dart';
import 'package:agricu/screens/profile/bloc/profile_bloc.dart';
import 'package:agricu/screens/upload_product/bloc/upload_product_bloc.dart';
import 'package:agricu/themes/colors.dart';
import 'package:agricu/themes/style.dart';
import 'package:agricu/widgets/outline_button.dart';
import 'package:agricu/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

final uploadProductKey = GlobalKey<FormState>();

class UploadProduct extends StatefulWidget {
  const UploadProduct({super.key});

  @override
  State<UploadProduct> createState() => _UploadProductState();
}

class _UploadProductState extends State<UploadProduct> {
  File? _selectedImage;

  Future<void> _pickImage(ImageSource source, UploadProductBloc bloc) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      bloc.add(OnImage(image: pickedFile));
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  void _clearImage(UploadProductBloc bloc) {
    bloc.add(OnImage(image: null));
    setState(() {
      _selectedImage = null;
    });
  }

  CategoryEnum? selectedCategoryEnum;
  String? selectedSubCategoryEnum;

  final Map<CategoryEnum, List<String>> subcategories = {
    CategoryEnum.drinks: ['Bottle', 'crate', 'Glass'],
    CategoryEnum.food: ['Plate', 'Tuber', 'Bunch'],
    CategoryEnum.vegetables: ['Bundle', '1', '2'],
  };

  List<DropdownMenuItem<CategoryEnum>> _buildCategoryEnumDropdownItems() {
    return CategoryEnum.values.map((CategoryEnum value) {
      return DropdownMenuItem<CategoryEnum>(
        value: value,
        child: Text(value.toString().split('.').last),
      );
    }).toList();
  }

  List<DropdownMenuItem<String>> _buildSubCategoryEnumDropdownItems() {
    if (selectedCategoryEnum == null) {
      return [];
    }

    final subCategoryEnumList = subcategories[selectedCategoryEnum!];
    final dropdownItems = subCategoryEnumList!.map((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList();

    dropdownItems.add(const DropdownMenuItem<String>(
      value: 'Custom',
      child: Text('Custom'),
    ));

    return dropdownItems;
  }

  final TextEditingController customSubcategoryController =
      TextEditingController();

  void _showCustomSubcategoryDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter Custom Subcategory'),
          content: TextField(
            controller: customSubcategoryController,
            decoration: InputDecoration(
              hintText: 'Subcategory',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  selectedSubCategoryEnum = customSubcategoryController.text;
                });
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UploadProductBloc(
          user: BlocProvider.of<ProfileBloc>(context).state.currentUser),
      child: BlocConsumer<UploadProductBloc, UploadProductState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "Upload Product",
                style: AppStyles.bannerTitle.copyWith(
                  fontSize: 20,
                ),
              ),
              centerTitle: true,
            ),
            body: Form(
              key: uploadProductKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey[300],
                            ),
                            child: _selectedImage != null
                                ? ClipOval(
                                    child: Image.file(
                                      _selectedImage!,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.food_bank,
                                        size: 100,
                                        color: Colors.grey[500],
                                      ),
                                      Text(
                                        "Product Image",
                                        style: AppStyles.regular,
                                      )
                                    ],
                                  ),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.camera_alt,
                              size: 40,
                            ),
                            onPressed: () {
                              _pickImage(ImageSource.gallery,
                                  BlocProvider.of<UploadProductBloc>(context));
                            },
                          ),
                        ],
                      ),
                      if (_selectedImage != null)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                _clearImage(BlocProvider.of<UploadProductBloc>(
                                    context));
                              },
                              child: Text('Discard'),
                            ),
                            const SizedBox(width: 16),
                            ElevatedButton(
                              onPressed: () {
                                _pickImage(
                                    ImageSource.gallery,
                                    BlocProvider.of<UploadProductBloc>(
                                        context));
                              },
                              child: Text('Change Picture'),
                            ),
                          ],
                        ),
                      const Gap(10),
                      TextFieldWidget(
                        onchanged: (val) {
                          context
                              .read<UploadProductBloc>()
                              .add(OnProductName(name: val));
                        },
                        validator: (input) {
                          if (input == null || input.isEmpty) {
                            return "Please enter a name for your product";
                          }
                          return null;
                        },
                        hintText: "Name of product. e.g tomatoe",
                        labelText: "Product Name",
                      ),
                      const Gap(10),
                      DropdownButtonFormField<CategoryEnum>(
                        value: selectedCategoryEnum,
                        validator: (input) {
                          if (input == null) {
                            return "Please select a category";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: darkGreen)),
                        ),
                        hint: Text(
                          'Product Category',
                          style: AppStyles.hintStyle.copyWith(
                              color: const Color.fromARGB(255, 100, 97, 97)),
                        ),
                        items: _buildCategoryEnumDropdownItems(),
                        onChanged: (CategoryEnum? value) {
                          context
                              .read<UploadProductBloc>()
                              .add(OnCategory(category: value));
                          setState(() {
                            selectedCategoryEnum = value;
                            selectedSubCategoryEnum = null;
                          });
                        },
                      ),
                      const Gap(10),
                      TextFieldWidget(
                        onchanged: (val) {
                          context
                              .read<UploadProductBloc>()
                              .add(OnPrice(price: val));
                        },
                        validator: (price) {
                          if (price == null || price.isEmpty) {
                            return "Please set the price of your product";
                          }
                          return null;
                        },
                        hintText: "Price in XAF",
                        labelText: "Price",
                        inputType: TextInputType.number,
                      ),
                      const Gap(10),
                      DropdownButtonFormField<String>(
                        value: selectedSubCategoryEnum,
                        items: _buildSubCategoryEnumDropdownItems(),
                        onChanged: (dynamic value) {
                          if (value == 'Custom') {
                            _showCustomSubcategoryDialog();
                          } else {
                            context
                                .read<UploadProductBloc>()
                                .add(OnQuantity(quantity: value));
                            setState(() {
                              selectedSubCategoryEnum = value;
                            });
                          }
                        },
                        validator: (val) {
                          if (val == null) {
                            return "Please select a Unit quantity";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: darkGreen)),
                        ),
                        hint: Text(
                          'Unit Quantity',
                          style: AppStyles.hintStyle.copyWith(
                              color: const Color.fromARGB(255, 100, 97, 97)),
                        ),
                        isDense: true,
                        disabledHint: Text(
                          'Select a category first',
                          style: AppStyles.hintStyle.copyWith(
                              color: const Color.fromARGB(255, 100, 97, 97)),
                        ),
                        elevation: selectedSubCategoryEnum == null ? 0 : 8,
                        iconSize: 30.0,
                      ),
                      const Gap(10),
                      Container(
                        height: 200,
                        child: TextFieldWidget(
                          onchanged: (val) {
                            context
                                .read<UploadProductBloc>()
                                .add(OnDescription(description: val));
                          },
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return "Fill in detailed description of product";
                            }
                            return null;
                          },
                          hintText: "Describe your product",
                          maxLines: 10,
                        ),
                      ),
                      const Gap(10),
                      OutlineButtonWidget(
                        onPressed: () {
                          if (uploadProductKey.currentState!.validate()) {
                            context.read<UploadProductBloc>().add(OnUpload());
                          }
                        },
                        width: double.infinity,
                        backgroundColor: brown,
                        child: state.uploadState == FetchState.loading
                            ? const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            : Text(
                                "upload ",
                                style: AppStyles.regular
                                    .copyWith(color: Colors.white),
                              ),
                      ),
                      const Gap(20),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
