import 'package:flutter/material.dart';
import 'package:loja_virtual/src/configs/custom_dors.dart';
import 'package:loja_virtual/src/models/item_model.dart';
import 'package:loja_virtual/src/pages/commom_widgets/quantity_widget.dart';
import 'package:loja_virtual/src/service/utils_services.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key, required this.item}) : super(key: key);
  final ItemModel item;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final UtilsServices utilsServices = UtilsServices();

  int cartItemQuantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(230),
      body: Stack(
        children: [
          //conteudo
          Column(
            children: [
              Expanded(
                child: Hero(
                    tag: widget.item.imgUrl,
                    child: Image.asset(widget.item.imgUrl)),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(50),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade600,
                          offset: const Offset(0, 2)),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              widget.item.itemName,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 27, fontWeight: FontWeight.bold),
                            ),
                          ),
                          QuantityWidget(
                            sufixText: widget.item.unit,
                            value: cartItemQuantity,
                            result: (quantity) {
                              setState(() {
                                cartItemQuantity = quantity;
                              });
                            },
                          )
                        ],
                      ),
                      Text(
                        utilsServices.priceToCurrency(widget.item.price),
                        style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: CustomColors.customSwatchColor),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: SingleChildScrollView(
                            child: Text(
                              widget.item.description,
                              style: const TextStyle(height: 1.5),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 55,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15))),
                          onPressed: () {},
                          icon: const Icon(Icons.shopping_cart_outlined),
                          label: const Text(
                            'Add no Carrinho',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: 10,
            top: 10,
            child: SafeArea(
                child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.arrow_back_ios))),
          )
        ],
      ),
    );
  }
}
