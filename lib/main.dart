import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/products_screen.dart';
import 'services/cart_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartService(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Professional Home',
        theme: ThemeData(
          colorScheme:
              ColorScheme.fromSeed(seedColor: const Color(0xFF1565C0)),
          useMaterial3: true,
          scaffoldBackgroundColor: const Color(0xFFF7F8FA),
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: const Color(0xFF1F2937),
                displayColor: const Color(0xFF111827),
              ),
        ),
        home: const ProductsScreen(),
      ),
    );
  }
}
