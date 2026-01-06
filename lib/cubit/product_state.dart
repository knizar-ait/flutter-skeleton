import '../data/product.dart';

abstract class ProductState {
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {
  @override
  List<Object> get props => [];
}

class ProductLoaded extends ProductState {
  final List<Product> products;

  ProductLoaded(this.products);

  @override
  List<Object> get props => [];
}

class ProductError extends ProductState {
  final String message;

  ProductError(this.message);

  @override
  List<Object> get props => [message];
}
