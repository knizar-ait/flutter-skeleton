import 'package:flutter/material.dart';

import '../cubit/product_cubit.dart';
import '../cubit/product_state.dart';
import 'detail_page.dart';
import 'product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final productCubit = ProductCubitProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Catalog'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Our Products',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          ListBuilder<ProductCubit>(
            cubit: productCubit,
            builder: (context, state) {
              if (state is ProductLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ProductLoaded) {
                return ListView.builder(
                  itemCount: state.products.length,
                  itemBuilder: (context, index) {
                    final product = state.products[index];
                    return ProductCard(
                      product: product,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPage(product: product),
                          ),
                        );
                      },
                    );
                  },
                );
              } else if (state is ProductError) {
                return Center(child: Text(state.message));
              }
              return const SizedBox.shrink();
            },
          ),
        ],
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
    final ProductCubitProvider? provider = context
        .dependOnInheritedWidgetOfExactType<ProductCubitProvider>();
    return provider!.cubit;
  }

  @override
  bool updateShouldNotify(ProductCubitProvider oldWidget) =>
      cubit != oldWidget.cubit;
}

class ListBuilder<T extends Listenable> extends StatefulWidget {
  final T cubit;
  final Widget Function(BuildContext, ProductState) builder;

  const ListBuilder({super.key, required this.cubit, required this.builder});

  @override
  State<ListBuilder<T>> createState() => _ListBuilderState<T>();
}

class _ListBuilderState<T extends Listenable> extends State<ListBuilder<T>> {
  @override
  void initState() {
    super.initState();
    widget.cubit.addListener(_listener);
  }

  @override
  void dispose() {
    widget.cubit.removeListener(_listener);
    super.dispose();
  }

  void _listener() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, (widget.cubit as ProductCubit).state);
  }
}
