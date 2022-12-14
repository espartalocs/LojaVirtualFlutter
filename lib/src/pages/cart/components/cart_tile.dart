import 'package:flutter/material.dart';
import 'package:loja_virtual/src/configs/custom_dors.dart';
import 'package:loja_virtual/src/models/cart_item_model.dart';
import 'package:loja_virtual/src/pages/commom_widgets/quantity_widget.dart';
import 'package:loja_virtual/src/service/utils_services.dart';

class CartTile extends StatefulWidget {
  final CartItemModel cartItem;
  final Function(CartItemModel) remove;
  const CartTile({Key? key, required this.cartItem, required this.remove})
      : super(key: key);

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: Image.asset(
          widget.cartItem.item.imgUrl,
          height: 60,
          width: 60,
        ),
        title: Text(
          widget.cartItem.item.itemName,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          utilsServices.priceToCurrency(widget.cartItem.totalPrice()),
          style: TextStyle(
              color: CustomColors.customSwatchColor,
              fontWeight: FontWeight.bold),
        ),
        trailing: QuantityWidget(
          result: (int quantity) {
            setState(() {
              widget.cartItem.quantity = quantity;
              if (quantity == 0) {
                widget.remove(widget.cartItem);
              }
            });
          },
          sufixText: widget.cartItem.item.unit,
          value: widget.cartItem.quantity,
          isRemovable: true,
        ),
      ),
    );
  }
}
