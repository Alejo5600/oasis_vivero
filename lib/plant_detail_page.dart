import 'package:flutter/material.dart';

class PlantDetailPage extends StatelessWidget {
  final Map<String, dynamic> plant;

  const PlantDetailPage({super.key, required this.plant});

  @override
  Widget build(BuildContext context) {
     final screenWidth = MediaQuery.of(context).size.width; // Obtener el ancho de la pantalla

    return Scaffold(
      appBar: AppBar(
        title: Text(plant['name']),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary, // Color del texto
      ),
      body: SingleChildScrollView(  // Solución para el desbordamiento
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      plant['name'],
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      ' \$${plant['price']}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
              ],
            ),
            
            Image.network(
              plant['image'],
              width: screenWidth, // Ajusta el ancho de la imagen al ancho de la pantalla
              fit: BoxFit.cover, // Ajusta la imagen para cubrir el área disponible
            ),   
            const SizedBox(height: 8),
            Text(
              plant['description'],
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            
          ],
        ),
      ),
    );
  }
}
