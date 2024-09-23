import 'package:flutter/material.dart';
import 'package:flutter_one/next_page.dart';
import 'package:flutter_one/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basic Widgets',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const ProfilePage(),
    const NextPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HistoryKy',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        )
        ),
        
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // aksi
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // aksi 
            },
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'Profile') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()),
                );
              } else if (value == 'Logout') {
                // aksi
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem<String>(
                  value: 'Profile',
                  child: Text('Profile'),
                ),
                const PopupMenuItem<String>(
                  value: 'Logout',
                  child: Text('Logout'),
                ),
              ];
            },
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://i.pinimg.com/736x/e2/ae/df/e2aedfc5c96b5ca441f69fe62288d19e.jpg',
              ),
              radius: 20.0,
            ),
          ),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.navigate_next),
            label: 'Library',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
        onTap: _onItemTapped,
      ),
    );
  }
}

class AnimeCard extends StatelessWidget {
  final String title;
  final String date;
  final String text;
  final String imageUrl;

  const AnimeCard({
    Key? key,
    required this.title,
    required this.date,
    required this.text,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            alignment: Alignment.topLeft,
            children: [
              Image.network(
                imageUrl,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Container(
                // aksi jika diperlukan
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(height: 4.0),
                Row(
                  children: [
                    const Icon(Icons.calendar_today, size: 12.0),
                    const SizedBox(width: 4.0),
                    Text(
                      date,
                      style: const TextStyle(fontSize: 12.0),
                    ),
                  ],
                ),
                const SizedBox(height: 4.0),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Text(
                    text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          AnimeCard(
            title: 'Belanda Kembalikan Lagi Objek-objek Budaya ke RI, 288 Artefak "Pulang Kampung"',
            date: '22 Sep',
            text: 'LIhat Lebih Lanjut',
            imageUrl: 'https://akcdn.detik.net.id/community/media/visual/2024/09/20/mendikbudristek-nadiem-anwar-makarim-menyambut-empat-arca-peninggalan-kerajaan-singasari-yang-dikembalikan-belanda-ke-tanah-ai_43.png?w=300&q=80',
          ),
          AnimeCard(
            title: 'Kisah Kapal Pembawa Petaka di Cirebon, Kedatangannya Membuat Kematian Massal',
            date: '22 Sep',
            text: 'LIhat Lebih Lanjut',
            imageUrl: 'https://awsimages.detik.net.id/community/media/visual/2024/07/21/pelabuhan-era-hindia-belanda-di-cirebon-3_169.jpeg?w=700&q=90',
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          AnimeCard(
            title: '2 Pusaka Pangeran Diponegoro Mejeng di Sini, Tombak dan Tongkat Sakti',
            date: '22 Sep',
            text: 'LIhat Lebih Lanjut',
            imageUrl: 'https://awsimages.detik.net.id/community/media/visual/2024/09/18/tombak-pangeran-diponegoro-di-vredeburg-fair-2024_169.jpeg?w=700&q=90',
          ),
          AnimeCard(
            title: 'Teks Cerita Sejarah: Pengertian, Ciri-ciri, dan Struktur',
            date: '23 Sep',
            text: 'LIhat Lebih Lanjut',
            imageUrl: 'https://awsimages.detik.net.id/community/media/visual/2022/03/22/museum-sumpah-pemuda-kembali-dibuka-2.jpeg?w=700&q=90',
          ),
          AnimeCard(
            title: 'Surat Einstein tentang Bom Nuklir Laku Dilelang Rp 60 Miliar',
            date: '24 Sep',
            text: 'LIhat Lebih Lanjut',
            imageUrl: 'https://awsimages.detik.net.id/community/media/visual/2019/12/31/40ec2e64-73ae-4e40-96ba-342868bb9548.jpeg?w=700&q=90',
          ),
        ],
      ),
    );
  }
}
