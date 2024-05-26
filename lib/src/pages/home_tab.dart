import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:flutter/material.dart';
import 'package:quitandaapp/src/pages/cart/card_tab.dart';
import 'package:quitandaapp/src/pages/components/category_tile.dart';
import 'package:quitandaapp/src/pages/components/custom_app_bar.dart';
import 'package:quitandaapp/src/config/custom_colors.dart';
import 'package:quitandaapp/src/config/app_data.dart' as app_data;
import 'package:quitandaapp/src/pages/components/custom_shimmer.dart';
import 'package:quitandaapp/src/pages/components/item_tile.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  String selectCategory = 'Frutas';

  GlobalKey<CartIconKey> cartKey = GlobalKey<CartIconKey>();

  late Function(GlobalKey) runAddToCartAnimation;

  void itemSelectedCartAnimations(GlobalKey gkImage) {
    runAddToCartAnimation(gkImage);
  }

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  CustomAppBar appBar() => CustomAppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              right: 10,
            ),
            child: GestureDetector(
              onTap: () {
                // print('Clicou');
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const CardTab()),
                );
              },
              child: AddToCartIcon(
                badgeOptions: const BadgeOptions(active: true),
                key: cartKey,
                icon: Badge(
                  backgroundColor: CustomColors.customContrastColor,
                  label: const Text(
                    '99',
                  ),
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    color: CustomColors.customSwatchColor,
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
      body: AddToCartAnimation(
        // AddToCartAnimation Section
        cartKey: cartKey,
        createAddToCartAnimation: (addToCardAnimationMethod) {
          runAddToCartAnimation = addToCardAnimationMethod;
        },
        dragAnimation: const DragToCartAnimationOptions(
          duration: Duration(milliseconds: 800),
          curve: Curves.ease,
          rotation: true,
        ),
        jumpAnimation: const JumpAnimationOptions(
          duration: Duration(milliseconds: 800),
          curve: Curves.ease,
        ),
        child: Column(
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
                      ),
                    ),
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
              child: !isLoading
                  ? ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) {
                        return CategoryTile(
                          category: app_data.obterCategorias()[index],
                          isSelected: app_data.obterCategorias()[index] ==
                              selectCategory,
                          onPressed: () {
                            setState(() {
                              selectCategory =
                                  app_data.obterCategorias()[index];
                            });
                          },
                        );
                      },
                      separatorBuilder: (_, index) =>
                          const SizedBox(height: 10),
                      itemCount: app_data.obterCategorias().length,
                    )
                  : ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(
                        app_data.obterCategorias().length,
                        (index) {
                          return CustomShimmer(
                            height: 40,
                            width: 80,
                            borderRadius: BorderRadius.circular(20),
                            isRounded: false,
                            baseColor: CustomColors.customSwatchColor,
                            highlightColor:
                                CustomColors.customSwatchColor.shade300,
                          );
                        },
                      ),
                    ),
            ),
            Expanded(
              child: !isLoading
                  ? GridView.builder(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      physics: const BouncingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 9 / 11.5,
                      ),
                      itemCount: app_data.items.length,
                      itemBuilder: (_, index) {
                        return ItemTile(
                          item: app_data.items[index],
                          cartAnimationMethod: itemSelectedCartAnimations,
                        );
                      },
                    )
                  : GridView.count(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      physics: const BouncingScrollPhysics(),
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 9 / 11.5,
                      children: List.generate(
                        10,
                        (index) => CustomShimmer(
                          width: double.infinity,
                          height: double.infinity,
                          baseColor: CustomColors.customSwatchColor,
                          highlightColor:
                              CustomColors.customSwatchColor.shade50,
                          borderRadius: BorderRadius.circular(20),
                          isRounded: false,
                        ),
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
