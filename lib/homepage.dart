import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'plant_detail_page.dart';
import 'menu.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic> allPlants = [];
  List<dynamic> filteredPlants = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadPlants();
    searchController.addListener(() {
      filterPlants();
    });
  }

  Future<void> loadPlants() async {
    final String response = await rootBundle.loadString('assets/plants.json');
    final List<dynamic> data = json.decode(response);
    setState(() {
      allPlants = data;
      filteredPlants = data; // Inicialmente la lista filtrada es la misma que la original
    });
  }

  void filterPlants() {
    final query = searchController.text.toLowerCase();
    setState(() {
      filteredPlants = allPlants.where((plant) {
        final plantName = plant['name'].toLowerCase();
        return plantName.contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary, // Color del texto
      ),
      drawer: const Menu(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                border: const OutlineInputBorder(),
                labelText: 'Búsqueda',
              ),
            ),
          ),
          Expanded(
            child: filteredPlants.isEmpty
                ? const Center(child: Text('No hay resultados'))
                : ListView.builder(
                    itemCount: filteredPlants.length,
                    itemBuilder: (context, index) {
                      final plant = filteredPlants[index];
                      return ListTile(
                        leading: Image.network(plant['image']),
                        title: Text(plant['name']),
                        subtitle: Text(plant['description']),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  PlantDetailPage(plant: plant),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
