import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quitandaapp/src/config/custom_colors.dart';
import 'package:quitandaapp/src/pages/cart/card_tab.dart';
import 'package:quitandaapp/src/pages/home_tab.dart';
import 'package:quitandaapp/src/pages/order/pedido_tab.dart';
import 'package:quitandaapp/src/pages/profile/profile_tab.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int currentIndex = 0;

  final pageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    FToast().init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: appBar(),

      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: const [
          HomeTab(),
          CardTab(),
          PedidoTab(),
          ProfileTab(),
        ],
      ),
      // BottomNavigationBar Section
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(
            () {
              currentIndex = value;
              pageController.jumpToPage(currentIndex);
            },
          );
        },
        selectedItemColor: CustomColors.customContrastColor,
        unselectedItemColor: CustomColors.customSwatchColor,
        currentIndex: currentIndex,
        backgroundColor: CustomColors.customCardColor,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: CustomColors.customSwatchColor,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: CustomColors.customSwatchColor,
            ),
            label: 'Carrinho',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list,
              color: CustomColors.customSwatchColor,
            ),
            label: 'Pedidos',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: CustomColors.customSwatchColor,
            ),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
