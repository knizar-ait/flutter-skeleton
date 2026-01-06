import 'package:flutter/material.dart';

import 'product_cubit.dart';
import 'product_state.dart';

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
