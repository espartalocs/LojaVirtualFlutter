import 'package:flutter/material.dart';
import 'package:loja_virtual/src/pages/home/home_tab.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int currentItem = 0;
  final pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [
          HomeTab(),
          Container(),
          Container(),
          Container(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentItem,
          onTap: (index) {
            setState(() {
              currentItem = index;
              pageController.jumpToPage(index);
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.green,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withAlpha(100),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined), label: 'Carrinho'),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Pedidos'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), label: 'Perfil'),
          ]),
    );
  }
}