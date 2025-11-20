import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Container Animado - William Morales y Julian Lancheros')),
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
      child: AnimatedContainer(
        duration: Duration(milliseconds: 400),  // Velocidad de animación
        curve: Curves.easeOutBack,             // Movimiento suave y elegante
        width: 300,
        height: 200,
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(16),

        // Cambiamos decoración según estado
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: _isPressed
                ? [Colors.pinkAccent, Colors.deepPurpleAccent] // Cambia el color al tocar
                : [Colors.blue, Colors.purple],
          ),
          border: Border.all(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(_isPressed ? 30 : 20), // Animar esquinas
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: _isPressed ? 20 : 10, // Más sombra si está presionado
              offset: Offset(0, _isPressed ? 10 : 5),
            ),
          ],
        ),

        // Animación de transformación
        transform: Matrix4.rotationZ(_isPressed ? 0.1 : 0),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_cart,
                size: 50, color: Colors.white),
            SizedBox(height: 10),
            Text(
              'Producto Especial',
              style: TextStyle(
                color: Colors.white,
                fontSize: _isPressed ? 22 : 20, // Texto se agranda con animación
                fontWeight: FontWeight.bold,
              ),
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
