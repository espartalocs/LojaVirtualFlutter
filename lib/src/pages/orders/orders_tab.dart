import 'package:flutter/material.dart';
import 'package:loja_virtual/src/configs/app_data.dart' as appData;
import 'package:loja_virtual/src/pages/orders/components/order_tile.dart';

class OrderTab extends StatelessWidget {
  const OrderTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pedidos'),
      ),
      body: ListView.separated(
          padding: const EdgeInsets.all(16),
          physics: const BouncingScrollPhysics(),
          itemBuilder: (_, index) {
            return OrderTile(order: appData.orders[index]);
          },
          separatorBuilder: (_, index) => const SizedBox(
                height: 10,
              ),
          itemCount: appData.orders.length),
    );
  }
}
