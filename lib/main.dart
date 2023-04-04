import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Sample App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
          fontFamily: 'Roboto',
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {

  List<Map<String, dynamic>> emojiList = [
    {
      'title': '95_CryThumbsUp',
      'imageUrl': 'https://cdn3.emoji.gg/emojis/5163-95-crythumbsup.png',
      'color': Colors.red,
    },
    {
      'title': 'Shy_blushy_cursed',
      'imageUrl': 'https://cdn3.emoji.gg/emojis/9540-shy-blushy-cursed.png',
      'color': Colors.blue,
    },
    {
      'title': 'EzPepe',
      'imageUrl': 'https://cdn3.emoji.gg/emojis/5492_EzPepe.png',
      'color': Colors.green,
    },
    {
      'title': 'RickRoll',
      'imageUrl': 'https://cdn3.emoji.gg/emojis/3416-rickroll.gif',
      'color': Colors.orange,
    },
  ];


}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = MainList();
        break;
      case 1:
        page = Placeholder();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return Scaffold(
      appBar: AppBar(
          leading: Icon(Icons.arrow_back_ios_new),
          title: Text('Смайлики',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
          backgroundColor: Colors.teal.shade100),
      body: page,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'favorite',
          ),
        ],
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
      ),
    );
  }
}

class MainList extends StatelessWidget {
  const MainList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    print(appState.emojiList);
    return GridView.count(
      crossAxisCount: 2,
      children: [
        for (var el in appState.emojiList)
          MyCard(title: el['title'], imageUrl: el['imageUrl'], color: el['color'])
      ],
    );
  }
}

class MyCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final Color color;

  const MyCard({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.color,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      shape:
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Column(
        children: [
          Stack(
            children: [
              Image.network(
                  imageUrl,
                  height: 150),
              Positioned(
                top: 10,
                right: 0,
                child:
                Icon(Icons.favorite_border, color: Colors.red.shade100),
              ),
            ],
          ),
          Center(
            heightFactor: 2,
            child: Text(title),
          )
        ],
      ),
    );
  }
}

