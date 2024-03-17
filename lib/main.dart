import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/producto_list.dart';
import 'package:shop/pages/cart_page.dart';
import 'package:shop/pages/product_detail_page.dart';
import 'package:shop/pages/products_overview_page.dart';
import 'package:shop/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductList()),
        ChangeNotifierProvider(create: (_) => Cart()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.purple,
            primary: Colors.purple,
            secondary: Colors.deepOrange,
          ),
          textTheme:
              const TextTheme(titleLarge: TextStyle(color: Colors.white)),
          fontFamily: 'Lato',
          useMaterial3: false,
          primaryColor: Colors.purple,
          primarySwatch: Colors.purple,
        ),
        home: const ProductsOverviewPage(),
        routes: {
          AppRoutes.PRODUCT_DETAIL: (ctx) => const ProductDetailPage(),
          AppRoutes.CART: (ctx) => const CartPage(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
