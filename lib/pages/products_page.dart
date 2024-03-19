import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/app_drawer.dart';
import 'package:shop/components/product_item.dart';
import 'package:shop/utils/app_routes.dart';

import '../models/producto_list.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductList products = Provider.of(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Gerenciar Produtos'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.PRODUCT_FORM,
                );
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        drawer: const AppDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: ListView.builder(
            itemBuilder: (ctx, i) => Column(
              children: [
                ProductItem(products.items[i]),
                const Divider(),
              ],
            ),
            itemCount: products.itemsCount,
          ),
        ));
  }
}
