import 'product.dart';

class ProductRepository {
  Future<List<Product>> fetchProducts() async {
    await Future.delayed(const Duration(seconds: 1));

    return [
      Product(
        id: '1',
        name: 'Wireless Headphones',
        description: 'Premium noise-cancelling wireless headphones with 30-hour battery life.',
        price: 299.99,
        imageUrl: 'https://via.placeholder.com/150',
      ),
      Product(
        id: '2',
        name: 'Smart Watch',
        description: 'Fitness tracker with heart rate monitoring and GPS.',
        price: 199.99,
        imageUrl: 'https://via.placeholder.com/150',
      ),
      Product(
        id: '3',
        name: 'Laptop Stand',
        description: 'Ergonomic aluminum laptop stand for better posture.',
        price: 49.99,
        imageUrl: 'https://via.placeholder.com/150',
      ),
      Product(
        id: '4',
        name: 'Mechanical Keyboard',
        description: 'RGB mechanical keyboard with custom switches.',
        price: 129.99,
        imageUrl: 'https://via.placeholder.com/150',
      ),
      Product(
        id: '5',
        name: 'Wireless Mouse',
        description: 'Precision wireless mouse with ergonomic design.',
        price: 79.99,
        imageUrl: 'https://via.placeholder.com/150',
      ),
    ];
  }
}
