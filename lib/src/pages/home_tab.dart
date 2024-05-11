import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quitandaapp/src/auth/components/category_tile.dart';
import 'package:quitandaapp/src/auth/components/custom_app_bar.dart';
import 'package:quitandaapp/src/config/custom_colors.dart';

class HomeTab extends StatefulWidget {
  HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
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

  String selectCategory = 'Frutas';

  CustomAppBar appBar() => CustomAppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              right: 10,
            ),
            child: GestureDetector(
              onTap: () {
                print('Clicou');
              },
              child: Badge(
                backgroundColor: CustomColors.customContrastColor,
                label: const Text('0'),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 6,
                    right: 6,
                    bottom: 10,
                  ),
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    color: CustomColors.customCardColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            // Botao de Pesquisa Section
            child: TextFormField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  isDense: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(60),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      )),
                  hintText: "Pesquisar",
                  prefixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search),
                  )),
              keyboardType: TextInputType.text,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          // ListView de Categorias
          Container(
            padding: const EdgeInsets.only(left: 25),
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return CategoryTile(
                    category: obterCategorias()[index],
                    isSelected: obterCategorias()[index] == selectCategory,
                    onPressed: () {
                      setState(() {
                        selectCategory = obterCategorias()[index];
                      });
                    });
              },
              separatorBuilder: (_, index) => const SizedBox(height: 10),
              itemCount: obterCategorias().length,
            ),
          ),
        ],
      ),
    );
  }
}
