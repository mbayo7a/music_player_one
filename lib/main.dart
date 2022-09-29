import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_player_one/player_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: ''),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        title: Text(widget.title, style: const TextStyle(fontSize: 20)),
        actions: const [
          Icon(Icons.search),
          SizedBox(
            width: 10, 
          ),
          Icon(Icons.more_vert),
        ],
        backgroundColor: Colors.white.withOpacity(0),
      ),
      drawer: Drawer(
        child: ListView(
          children: const [
            ListTile(
              minVerticalPadding: 30,
              title: Text(
                'My Play List',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(),
            ListTile(
              title: Text(
                'Mes favorites',
              ),
              leading: Icon(   
                Icons.favorite,
                color: Colors.red,
              ),
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.music_note,
                color: Colors.black,
              ),
              title: Text('Morceaux recents'),
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.download,
                color: Colors.black,
              ),
              title: Text('Telechargements'),
            ),
            Divider(),
            ListTile(
                leading: Icon(
                  Icons.delete,
                  color: Colors.black,
                ),
                title: Text('morceaux supprimés')),
            Divider(),
            ListTile(
                leading: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                title: Text('morceaux recherchés')),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderSection(),
            PlaylistSection(),
          ],
        ),
      ),
      bottomNavigationBar: const BottomSection(),
    );
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      decoration: const BoxDecoration(
          color: Colors.green,
          image: DecorationImage(
            image: AssetImage('images/boite3.jpg'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50))),
      child: Stack(
        children: [
          Positioned(
            child: Text(
              'Arianna Grande',
              style: GoogleFonts.arizonia(
                fontSize: 35,
                color: Colors.white,
                fontWeight: FontWeight.w800,
              ),
            ),
            left: 20,
            bottom: 20,
          ),
          Positioned(
            child: MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Player()),
                );
              },
              shape: const CircleBorder(),
              color: Colors.blue,
              child: const Padding(
                padding: EdgeInsets.all(17),
                child: Icon(
                  Icons.play_arrow_rounded,
                  color: Colors.white,
                ),
              ),
            ),
            bottom: 15,
            right: 5,
          )
        ],
      ),
    );
  }
}

class PlaylistSection extends StatelessWidget {
  final Set<Map> playlist = {
    {'title': 'Love Me Header', 'duration': '3.16', 'played': false},
    {'title': 'Dangerous Women', 'duration': '3.45', 'played': true},
    {'title': 'One Last Time', 'duration': '3.50', 'played': false},
    {'title': 'Break Free', 'duration': '3.22', 'played': false},
    {'title': 'Right There', 'duration': '3.36', 'played': false},
    {'title': 'Into You', 'duration': '3.15', 'played': false},
    {'title': 'Be Alright', 'duration': '3.22', 'played': false},
    {'title': 'Bang Bang', 'duration': '3.31', 'played': false},
    {'title': 'Positions', 'duration': '3.08', 'played': false},
    {'title': 'Thank you', 'duration': '3.14', 'played': false},
  };
  PlaylistSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Popular',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              Text(
                'Show All',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: playlist.map((song) {
              return SizedBox(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      song["title"],
                      style: TextStyle(
                          color: song['played'] ? Colors.blue : Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    Row(
                      children: [
                        Text(
                          song["duration"],
                          style: TextStyle(
                              color:
                                  song['played'] ? Colors.blue : Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        Icon(
                          Icons.more_vert,
                          color: song['played'] ? Colors.blue : Colors.grey,
                          size: 16,
                        )
                      ],
                    )
                  ],
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}

class BottomSection extends StatelessWidget {
  const BottomSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: Colors.blue,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.pause,
              color: Colors.white,
            ),
            label: 'Pause',
          ),
          BottomNavigationBarItem(
            icon: Text(
              'Thank you-Arianna Grande',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_circle_up, color: Colors.white),
            label: '',
          ),
        ]
        );
  }
}
