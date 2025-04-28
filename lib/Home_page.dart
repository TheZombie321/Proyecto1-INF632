import 'package:flutter/material.dart';
import 'Detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, String>> categoria = const [
    {
      'Titulo': 'Reciclaje',
      'imagen': 'https://media.istockphoto.com/id/1796599593/photo/young-man-recycling-a-water-bottle-in-malmo-in-sweden.jpg?s=2048x2048&w=is&k=20&c=rUoITj0sCvORZpOxqfB7a_jiGRw4VoNP3Tyd5Eg3Uj0=',
      
    },
    {
      'Titulo': 'Agua',
      'imagen': 'https://cdn.pixabay.com/photo/2017/02/02/15/15/bottle-2032980_960_720.jpg',
      
    },
    {
      'Titulo': 'Energía',
      'imagen': 'https://media.istockphoto.com/id/2140070730/photo/aerial-view-of-wind-turbines.jpg?s=2048x2048&w=is&k=20&c=Q5Ig8Lme4kB2BIFbOInStbt9CbQpax2HhNUTJTZZsg0=',
      
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EcoTips'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: categoria.length,
        itemBuilder: (context, index) => _creandoBloques(context, categoria[index]),
      ),
      drawer: _drawer(),
    );
  }

  Widget _creandoBloques(BuildContext context, Map<String, String> category) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Hero(tag: 'hero-${category['Titulo']}', 
            child:  ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(
                category['imagen']!,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category['Titulo']!,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green,
                    ),
                    onPressed: () => _mandarParametros(context, category['Titulo']!,category['imagen']!),
                    child: const Text('Ver más'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _mandarParametros(BuildContext context, String title,String image) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>  const DetailPage(),
        settings: RouteSettings(
          arguments: {
            'Titulo': title,
            'imagen':image
          }
        )
      ),
    );
  }
  Drawer _drawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green,
              image: DecorationImage(
                image: NetworkImage(
                  'https://media.istockphoto.com/id/1497379890/es/foto/cielo-azul-en-verano-sol-d%C3%ADa-soleado.jpg?s=2048x2048&w=is&k=20&c=kW68yAvANLGzORy8vBsBTiwnTEkdjY2EkxsyCeI0Rn8=',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Text(
              'Menú EcoTips',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home, color: Colors.green),
            title: const Text('Inicio'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.info, color: Colors.green),
            title: const Text('Acerca de'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}