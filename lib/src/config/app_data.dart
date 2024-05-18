import 'package:quitandaapp/src/models/cart_item_model.dart';
import 'package:quitandaapp/src/models/item_model.dart';

ItemModel maca = ItemModel(
  itemName: 'Maçã',
  title: 'Maçã ',
  description:
      'Maçã nacional super doce com bastante acidez, mais maçães, maçães, maçães',
  price: 6.99,
  imageUrl: 'assets/fruits/maca.png',
  unidadeMedida: 'Kg',
);

ItemModel banana = ItemModel(
  itemName: 'Banana',
  title: 'Banana ',
  description:
      'Banana prata super docinha, banana prata, banana prata, banana prata',
  price: 5.99,
  imageUrl: 'assets/fruits/banana.png',
  unidadeMedida: 'Un.',
);

ItemModel laranja = ItemModel(
  itemName: 'Laranja',
  title: 'Laranja ',
  description:
      'Laranja super docinha , laranja super docinha, laranja super docinha',
  price: 10.99,
  imageUrl: 'assets/fruits/laranja.png',
  unidadeMedida: 'Kg',
);

ItemModel alface = ItemModel(
  itemName: 'Alface',
  title: 'Alface ',
  description:
      'Alface Americanas super crocante, alface Americanas, alface Americanas',
  price: 5.50,
  imageUrl: 'assets/fruits/alface.png',
  unidadeMedida: 'Un',
);

ItemModel tomate = ItemModel(
  itemName: 'Tomate',
  title: 'Tomate ',
  description: 'Tomate Salada',
  price: 15.99,
  imageUrl: 'assets/fruits/tomate.png',
  unidadeMedida: 'Kg',
);

ItemModel batata = ItemModel(
  itemName: 'Batata',
  title: 'Batata ',
  description: 'Batata Binge ',
  price: 3.25,
  imageUrl: 'assets/fruits/batata.png',
  unidadeMedida: 'Kg',
);

ItemModel beterraba = ItemModel(
  itemName: 'Beterraba',
  title: 'Beterraba ',
  description: 'Beterraba cor de sangue',
  price: 7.30,
  imageUrl: 'assets/fruits/beterraba.png',
  unidadeMedida: 'Kg',
);

List<ItemModel> items = [
  maca,
  banana,
  laranja,
  alface,
  tomate,
  batata,
  beterraba,
];

List<String> obterCategorias() {
  return [
    'Frutas',
    'Verduras',
    'Legumes',
    'Cereais',
    'Grãos',
    'Temperos',
  ];
}

List<CartItemModel> cartItems = [
  CartItemModel(
    item: maca,
    quantity: 10,
    unitPrice: 0.99,
    totalPrice: 9.90,
  ),
  CartItemModel(
    item: alface,
    quantity: 10,
    unitPrice: 5.50,
    totalPrice: 55.00,
  ),
  CartItemModel(
    item: laranja,
    quantity: 1,
    unitPrice: 10.99,
    totalPrice: 10.99,
  ),
  CartItemModel(
    item: beterraba,
    quantity: 100,
    unitPrice: 7.30,
    totalPrice: 730.00,
  ),
];
