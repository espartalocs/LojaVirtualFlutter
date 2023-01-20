import 'package:flutter/material.dart';
import 'package:loja_virtual/src/models/order_model.dart';
import 'package:loja_virtual/src/service/utils_services.dart';

class OrderTile extends StatelessWidget {
  final OrderModel order;
  OrderTile({Key? key, required this.order}) : super(key: key);

  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Pedido: ${order.id}'),
              Text(
                utilsServices.formatDateTime(order.createdDateTime),
                style: const TextStyle(fontSize: 12, color: Colors.black),
              ),
            ],
          ),
          children: [],
        ),
      ),
    );
  }
}
