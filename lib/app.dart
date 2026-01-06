import 'package:flutter/material.dart';

import 'cubit/product_cubit.dart';
import 'data/product_repository.dart';
import 'ui/home_page.dart';

class ProductCatalogApp extends StatefulWidget {
  const ProductCatalogApp({super.key});

  @override
  State<ProductCatalogApp> createState() => _ProductCatalogAppState();
}

class _ProductCatalogAppState extends State<ProductCatalogApp> {
  late final ProductCubit _productCubit;

  @override
  void initState() {
    super.initState();
    _productCubit = ProductCubit(ProductRepository());
    _productCubit.loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return ProductCubitProvider(
      cubit: _productCubit,
      child: MaterialApp(
        title: 'Product Catalog',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}

class ProductCubitProvider extends InheritedWidget {
  final ProductCubit cubit;

  const ProductCubitProvider({
    super.key,
    required this.cubit,
    required Widget child,
  }) : super(child: child);

  static ProductCubit of(BuildContext context) {
    final ProductCubitProvider? provider =
        context.dependOnInheritedWidgetOfExactType<ProductCubitProvider>();
    return provider!.cubit;
  }

  @override
  bool updateShouldNotify(ProductCubitProvider oldWidget) => cubit != oldWidget.cubit;
}
