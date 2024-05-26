import 'package:flutter/material.dart';
import 'package:quitandaapp/src/config/custom_colors.dart';
import 'package:quitandaapp/src/models/item_model.dart';
import 'package:quitandaapp/src/pages/components/quantidade_widget.dart';
import 'package:quitandaapp/src/services/utils_services.dart';

class ProductScreean extends StatefulWidget {
  ProductScreean({
    super.key,
    required this.item,
  });

  late ItemModel item;

  @override
  State<ProductScreean> createState() => _ProductScreeanState();
}

class _ProductScreeanState extends State<ProductScreean> {
  int cartItemQuantidade = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(230),
      body: Stack(
        children: [
          // conteudo
          Column(
            children: [
              Expanded(
                child: Hero(
                  tag: widget.item.imageUrl,
                  child: Image.asset(widget.item.imageUrl),
                ),
              ),
              Expanded(
                  child: Container(
                padding: const EdgeInsets.all(32),
                alignment: Alignment.topLeft,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(50),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              widget.item.itemName,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 26, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              UtilsServices.priceToCurrency(
                                widget.item.price,
                              ),
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: CustomColors.customSwatchColor,
                              ),
                            )
                          ],
                        ),
                        const Spacer(),
                        QuantidadeWidget(
                          value: cartItemQuantidade,
                          sufixo: widget.item.unidadeMedida,
                          result: (quantity) {
                            setState(
                              () {
                                cartItemQuantidade = quantity;
                              },
                            );
                          },
                        ),
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: SingleChildScrollView(
                          child: Text(
                            widget.item.description,
                            maxLines: 30,
                            textAlign: TextAlign.justify,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: CustomColors.customDarkColor,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                        CustomColors.customSwatchColor,
                      )),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 36,
                              right: 10,
                            ),
                            child: Icon(
                              Icons.add_shopping_cart_outlined,
                              color: CustomColors.customCardColor,
                              size: 26,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Adicionar ao carrinho',
                              style: TextStyle(
                                fontSize: 16,
                                color: CustomColors.customCardColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )),
            ],
          ),
          Positioned(
            left: 10,
            top: 10,
            child: SafeArea(
                child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: CustomColors.customSwatchColor,
              ),
            )),
          ),
        ],
      ),
    );
  }
}
