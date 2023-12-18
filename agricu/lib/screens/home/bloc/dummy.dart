import 'package:agricu/models/product.dart';
import 'package:agricu/models/product_section.dart';

final products = <Product>[
  const Product(
      image: 'assets/images/broc.png',
      name: 'Broccoli',
      isFavourite: false,
      priceQuantityRatio: 'FCFA 200 per/kg',
      stars: 3,
      productId: 'idsafu'),
  const Product(
      image: 'assets/images/lettuce.jpg',
      name: 'Broccoli',
      isFavourite: false,
      priceQuantityRatio: 'FCFA 200 per/kg',
      stars: 3.5,
      productId: 'iadsdfasdfadfadu'),
  const Product(
      image: 'assets/images/orange.png',
      name: 'Orange',
      isFavourite: false,
      priceQuantityRatio: 'FCFA 200 per/kg',
      stars: 4,
      productId: 'iaasdadsffadu'),
  const Product(
      image: 'assets/images/cabbage.png',
      name: 'Cabbage',
      isFavourite: false,
      priceQuantityRatio: 'FCFA 200 per/kg',
      stars: 5,
      productId: 'iugadsfadfasd'),
  const Product(
      image: 'assets/images/tropicana.jpg',
      name: 'Orange',
      isFavourite: false,
      priceQuantityRatio: 'FCFA 200 per/kg',
      stars: 2,
      productId: 'iaadasdfadsffdu'),
];

final products2 = <Product>[
  const Product(
      image: 'assets/images/tropicana.jpg',
      name: 'Broccoli',
      isFavourite: false,
      priceQuantityRatio: 'FCFA 200 per/kg',
      stars: 3,
      productId: 'iu'),
  const Product(
      image: 'assets/images/orange.png',
      name: 'Broccoli',
      isFavourite: false,
      priceQuantityRatio: 'FCFA 200 per/kg',
      stars: 3.5,
      productId: 'iadasdfasdfsdfadfadu'),
  const Product(
      image: 'assets/images/orange.png',
      name: 'Orange',
      isFavourite: false,
      priceQuantityRatio: 'FCFA 200 per/kg',
      stars: 4,
      productId: 'iaasadsfasddfadu'),
  const Product(
      image: 'assets/images/cabbage.png',
      name: 'Cabbage',
      isFavourite: false,
      priceQuantityRatio: 'FCFA 200 per/kg',
      stars: 5,
      productId: 'iugasdfasdasd'),
  const Product(
      image: 'assets/images/orange.png',
      name: 'Orange',
      isFavourite: false,
      priceQuantityRatio: 'FCFA 200 per/kg',
      stars: 2,
      productId: 'iaaasdfadfdu'),
];
final products3 = <Product>[
  const Product(
      image: 'assets/images/onion.jpg',
      name: 'Onion',
      isFavourite: false,
      priceQuantityRatio: 'FCFA 200 per/kg',
      stars: 3,
      productId: 'adfasdfiu'),
  const Product(
      image: 'assets/images/garlic.jpg',
      name: 'garlic',
      isFavourite: false,
      priceQuantityRatio: 'FCFA 200 per/kg',
      stars: 3.5,
      productId: 'iadasdfsdfadfadu'),
  const Product(
      image: 'assets/images/ginger.jpg',
      name: 'ginger',
      isFavourite: false,
      priceQuantityRatio: 'FCFA 200 per/kg',
      stars: 4,
      productId: 'iaasadsfdfadu'),
  const Product(
      image: 'assets/images/cabbage.png',
      name: 'Cabbage',
      isFavourite: false,
      priceQuantityRatio: 'FCFA 200 per/kg',
      stars: 5,
      productId: 'iugaasdfadssd'),
  const Product(
      image: 'assets/images/orange.png',
      name: 'Orange',
      isFavourite: false,
      priceQuantityRatio: 'FCFA 200 per/kg',
      stars: 2,
      productId: 'iaadadffdu'),
];
final productSection = <ProductSection>[
  ProductSection(
      title: 'Organic Vegetables',
      description: 'Picked up from organic farms',
      discount: 20,
      products: products),
  ProductSection(
      title: 'Mixed Vegetables Pack',
      description: 'Vegetable mix fresh pack',
      discount: 10,
      products: products2),
  ProductSection(
      title: 'Allium Vegetables',
      description: 'Fresh Allium vegetables',
      discount: 20,
      products: products3)
];
