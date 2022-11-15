import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/src/configs/custom_dors.dart';
import 'package:loja_virtual/src/home/components/categoty_title.dart';

class HomeTab extends StatefulWidget {
  HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final List<String> categories = [
    'Frutas',
    'Grãos',
    'Verduras',
    'Temperos',
    'Cereais',
  ];

  String selectedCategory = 'Frutas';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text.rich(
          TextSpan(
            style: const TextStyle(fontSize: 30),
            children: [
              TextSpan(
                  text: 'Green',
                  style: TextStyle(color: CustomColors.customSwatchColor)),
              TextSpan(
                  text: 'groucer',
                  style: TextStyle(color: CustomColors.customConstrastColor))
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 15.0, right: 15.0),
            child: GestureDetector(
              onTap: () {},
              child: Badge(
                badgeColor: CustomColors.customConstrastColor,
                badgeContent: const Text(
                  '2',
                  style: TextStyle(color: Colors.white),
                ),
                child: Icon(
                  Icons.shopping_cart,
                  color: CustomColors.customSwatchColor,
                ),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                isDense: true,
                hintText: 'Pesquisar',
                hintStyle: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 14,
                ),
                prefixIcon: Icon(Icons.search,
                    color: CustomColors.customConstrastColor, size: 21),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(60),
                    borderSide:
                        const BorderSide(width: 0, style: BorderStyle.none)),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 25),
            height: 40,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return CategoryTitle(
                    onPressed: () {
                      setState(() {
                        selectedCategory = categories[index];
                      });
                    },
                    category: categories[index],
                    isSelect: categories[index] == selectedCategory,
                  );
                },
                separatorBuilder: (_, index) => const SizedBox(width: 10),
                itemCount: categories.length),
          )
        ],
      ),
    );
  }
}
