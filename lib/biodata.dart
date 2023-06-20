// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

class Biodata extends StatefulWidget {
  const Biodata({super.key});

  @override
  State<Biodata> createState() => _BiodataState();
}

class _BiodataState extends State<Biodata> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resume'),
        centerTitle: true,
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: const [
              BuildTop(),
            ],
          ),
          const BuildContent(),
        ],
      ),
    );
  }
}

class BuildContent extends StatelessWidget {
  const BuildContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: const [
          Text(
            'Faris Anas',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'Flutter Programmer',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: EdgeInsets.only(left: 40),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Tentang',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(40),
            child: Text(
                style: TextStyle(
                  fontSize: 18,
                ),
                textAlign: TextAlign.left,
                'Saya Mahasiswa Semester 6 Program Studi Informatika Universitas Nusa Mandiri Margonda angkatan tahun 2020. Saya memiliki minat berkarir dalam di dunia programmer dan bisa menguasai flutter sesuai kemampuan. Pengalaman saya pernah mengikuti Akademi Mobile App Developer di Kampus Merdeka Studi Independent Bersertifikat Batch 3 PT. Nurul Fikri Cipta Inovasi'),
          ),
        ],
      ),
    );
  }
}

class BuildTop extends StatelessWidget {
  const BuildTop({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          child: Container(
            margin: const EdgeInsets.only(bottom: 80),
            child: const BuildCoverImage(),
          ),
        ),
        const Positioned(
          top: 180,
          child: BuildImageProfile(),
        ),
      ],
    );
  }
}

class BuildImageProfile extends StatelessWidget {
  const BuildImageProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 144 / 2,
      backgroundImage: AssetImage('assets/foto1.png'),
      backgroundColor: Colors.grey,
    );
  }
}

class BuildCoverImage extends StatelessWidget {
  const BuildCoverImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      width: double.infinity,
      height: 250,
      child: Image.asset(
        'assets/foto2.png',
        fit: BoxFit.fill,
      ),
    );
  }
}
