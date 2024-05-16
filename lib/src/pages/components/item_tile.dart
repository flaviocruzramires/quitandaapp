import 'package:flutter/material.dart';
import 'package:quitandaapp/src/config/custom_colors.dart';
import 'package:quitandaapp/src/models/item_model.dart';
import 'package:quitandaapp/src/pages/product/product_screen.dart';
import 'package:quitandaapp/src/services/utils_services.dart';

class ItemTile extends StatelessWidget {
  ItemTile({
    super.key,
    required this.item,
  });

  final ItemModel item;

  UtilsServices utilsServices = UtilsServices();

  Color _selectedColorPrimary = CustomColors.customSwatchColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          elevation: 2,
          shadowColor: Colors.grey.shade300,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProductScreean(item: item),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    item.imageUrl,
                  ),
                  Text(
                    item.itemName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        utilsServices.priceToCurrency(item.price),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: CustomColors.customSwatchColor,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        '/ ${item.unidadeMedida}',
                        style: TextStyle(
                          fontSize: 16,
                          color: CustomColors.customSwatchColor,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 4,
          right: 4,
          child: Container(
            height: 40,
            width: 35,
            decoration: BoxDecoration(
              color: _selectedColorPrimary,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(15),
                topRight: Radius.circular(20),
              ),
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add_shopping_cart_outlined,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        )
      ],
    );
  }
}
