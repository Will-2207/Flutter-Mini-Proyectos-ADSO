import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Container Avanzado - William Morales y Julian Lancheros')),
        body: Center(
          child: ProductCard(),
        ),
      ),
    );
  }
}

class ProductCard extends StatefulWidget {
  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isPressed = !_isPressed;
        });
      },
      child: Container(
        width: 300,
        height: 200,
        margin: EdgeInsets.all(20), // Espaciado externo
        padding: EdgeInsets.all(16), // Espaciado interno
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.purple], // Fondo degradado
          ),
          border: Border.all(color: Colors.white, width: 2), // Borde blanco
          borderRadius: BorderRadius.circular(20), // Esquinas redondeadas
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 5), // Sombra sutil
            ),
          ],
        ),
        transform: _isPressed
            ? Matrix4.rotationZ(0.1) // Rotación al presionar
            : Matrix4.identity(), // Sin transformación
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_cart, size: 50, color: Colors.white),
            SizedBox(height: 10),
            Text(
              'Producto Especial',
              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              '¡Toca para ver magia!',
              style: TextStyle(color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}