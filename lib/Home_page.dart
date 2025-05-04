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
        title: const Text('EcoTips',
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
            colors: [Colors.green[700]!, Colors.green[500]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            ),
          ),
        ),
        actions: [
          IconButton(onPressed: (){},
            icon: const Icon(Icons.edit),
            tooltip: 'Editar Perfil',
          )
        ],
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
      elevation: 6,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      shadowColor: Colors.green.withOpacity(0.3),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
         /* onTap: (){},*/
        onTap: () => _mandarParametros(context, category['Titulo']!, category['imagen']!),
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
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.green[50]!, Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.eco, color: Colors.green, size: 20),
                      SizedBox(width: 8),
                      Text(
                        category['Titulo']!,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[800],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.green[400]!, Colors.green[600]!],
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextButton(
                        onPressed: () => _mandarParametros(context, category['Titulo']!, category['imagen']!),
                        child: Text(
                          'Ver más',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
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
    width: 280, 
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        UserAccountsDrawerHeader(
          accountName: Text("Usuario EcoTips", style: TextStyle(fontWeight: FontWeight.bold)),
          accountEmail: Text("usuario@ecotips.com"),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.eco, color: Colors.green, size: 40),
          ),
          decoration: BoxDecoration(
            color: Colors.green[700],
            image: DecorationImage(
              image: NetworkImage(
                'https://media.istockphoto.com/id/1497379890/es/foto/cielo-azul-en-verano-sol-d%C3%ADa-soleado.jpg?s=2048x2048&w=is&k=20&c=kW68yAvANLGzORy8vBsBTiwnTEkdjY2EkxsyCeI0Rn8=',
              ),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.green[800]!.withOpacity(0.4),
                BlendMode.darken,
              ),
            ),
          ),
        ),
        _IconosDrawer(
          icon: Icons.home,
          title: "Inicio",
          onTap: () {},
        ),
        _IconosDrawer(
          icon: Icons.category,
          title: "Categorías",
          onTap: () {},
        ),
        _IconosDrawer(
          icon: Icons.favorite,
          title: "Favoritos",
          onTap: () {},
        ),
        Divider(color: Colors.grey[300], thickness: 1),
        _IconosDrawer(
          icon: Icons.info,
          title: "Acerca de",
          onTap: () {},
        ),
        _IconosDrawer(
          icon: Icons.settings,
          title: "Configuración",
          onTap: () {},
        ),
        _IconosDrawer(
          icon: Icons.exit_to_app,
          title: "Cerrar sesión",
          onTap: () {},
        ),
      ],
    ),
  );
}

Widget _IconosDrawer({required IconData icon, required String title, VoidCallback? onTap}) {
  return ListTile(
    leading: Container(
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.green[100],
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.green[800]),
    ),
    title: Text(title, style: TextStyle(fontSize: 16)),
    onTap: onTap,
  );
}
}
                  