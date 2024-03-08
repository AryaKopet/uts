import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Mahasiswa Politeknik'),
        centerTitle: true, // Menengahkan teks judul appbar
      ),
      body: ListView(
        children: [
          ContainerItem(
            avatar: '',
            name: 'Arya Wijaya',
            bio: 'Teknologi Informasi Reguler',
          ),
          ContainerItem(
            avatar: '',
            name: 'Dita Pitaloka',
            bio: 'Teknologi Informasi Reguler',
          ),
          ContainerItem(
            avatar: '',
            name: 'Nuraina',
            bio: 'Teknologi Informasi Reguler',
          ),
          ContainerItem(
            avatar: '',
            name: 'M. Abdul Latif',
            bio: 'Teknologi Informasi Reguler',
          ),
          ContainerItem(
            avatar: '',
            name: 'Haikal Saputra',
            bio: 'Teknologi Informasi Reguler',
          ),
        ],
      ),
    );
  }
}

class ContainerItem extends StatelessWidget {
  final String avatar;
  final String name;
  final String bio;

  const ContainerItem({
    required this.avatar,
    required this.name,
    required this.bio,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailScreen(avatar: avatar, name: name, bio: bio)),
        );
      },
      child: Container(
        padding: EdgeInsets.all(16.0),
        margin: EdgeInsets.only(top: 25.0, left: 16.0, right: 16.0), // Menambahkan jarak atas dan tidak merubah jarak sisi kiri dan kanan
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 40,
              child: Text(avatar),
            ),
            SizedBox(width: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Text(
                  bio,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String avatar;
  final String name;
  final String bio;

  const DetailScreen({
    required this.avatar,
    required this.name,
    required this.bio,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50.0,
              backgroundColor: Colors.blue,
              child: Text(
                avatar,
                style: TextStyle(fontSize: 36.0, color: Colors.white),
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              name,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              bio,
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
