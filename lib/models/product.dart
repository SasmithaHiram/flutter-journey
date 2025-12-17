class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}

const demoProducts = <Product>[
  Product(
    id: 'p1',
    name: 'Wireless Headphones',
    description: 'Noise-cancelling over-ear with 30h battery life.',
    price: 129.99,
    imageUrl:
        'https://images.unsplash.com/photo-1518449073231-39ebb4567d11?q=80&w=800&auto=format&fit=crop',
  ),
  Product(
    id: 'p2',
    name: 'Smart Watch',
    description: 'Health tracking and notifications on your wrist.',
    price: 89.50,
    imageUrl:
        'https://images.unsplash.com/photo-1517433456452-f9633a875f6f?q=80&w=800&auto=format&fit=crop',
  ),
  Product(
    id: 'p3',
    name: 'Mechanical Keyboard',
    description: 'Tactile switches with RGB backlight.',
    price: 74.00,
    imageUrl:
        'https://images.unsplash.com/photo-1595225476474-87563907a212?q=80&w=800&auto=format&fit=crop',
  ),
  Product(
    id: 'p4',
    name: '4K Monitor',
    description: 'Ultra HD IPS panel for crisp visuals.',
    price: 299.00,
    imageUrl:
        'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?q=80&w=800&auto=format&fit=crop',
  ),
  Product(
    id: 'p5',
    name: 'Portable Speaker',
    description: 'Waterproof Bluetooth speaker with deep bass.',
    price: 45.99,
    imageUrl:
        'https://images.unsplash.com/photo-1512436991641-6745cdb1723f?q=80&w=800&auto=format&fit=crop',
  ),
];
