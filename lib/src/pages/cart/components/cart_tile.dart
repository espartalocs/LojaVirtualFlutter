import 'package:flutter/material.dart';
import 'package:loja_virtual/src/configs/custom_dors.dart';
import 'package:loja_virtual/src/models/cart_item_model.dart';
import 'package:loja_virtual/src/pages/commom_widgets/quantity_widget.dart';
import 'package:loja_virtual/src/service/utils_services.dart';

class CartTile extends StatelessWidget {
  final CartItemModel cartItem;
  CartTile({Key? key, required this.cartItem}) : super(key: key);

  final UtilsServices utilsServices = UtilsServices();
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: Image.asset(
          cartItem.item.imgUrl,
          height: 60,
          width: 60,
        ),
        title: Text(
          cartItem.item.itemName,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          utilsServices.priceToCurrency(cartItem.totalPrice()),
          style: TextStyle(
              color: CustomColors.customSwatchColor,
              fontWeight: FontWeight.bold),
        ),
        trailing: QuantityWidget(
          result: (int quantity) {},
          sufixText: cartItem.item.unit,
          value: cartItem.quantity,
        ),
      ),
    );
  }
}
