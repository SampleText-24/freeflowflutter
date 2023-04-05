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

  List emojiList = [
    {
      'title': '95_CryThumbsUp',
      'imageUrl': 'https://cdn3.emoji.gg/emojis/5163-95-crythumbsup.png',
      'color': Colors.cyan.shade200,
    },
    {
      'title': 'DdogHwat',
      'imageUrl': 'https://cdn.discordapp.com/emojis/1056608003761115186.webp',
      'color': Colors.amberAccent.shade200,
    },
    {
      'title': 'Shy_blushy_cursed',
      'imageUrl': 'https://cdn3.emoji.gg/emojis/9540-shy-blushy-cursed.png',
      'color': Colors.blue.shade200,
    },
    {
      'title': 'EzPepe',
      'imageUrl': 'https://cdn3.emoji.gg/emojis/5492_EzPepe.png',
      'color': Colors.green.shade200,
    },
    {
      'title': 'RickRoll',
      'imageUrl': 'https://cdn3.emoji.gg/emojis/3416-rickroll.gif',
      'color': Colors.orange.shade200,
    },
    {
      'title': 'CatJAM',
      'imageUrl': 'https://cdn3.emoji.gg/emojis/5498_catJAM.gif',
      'color': Colors.lime.shade200,
    },
    {
      'title': 'PeepoWait',
      'imageUrl': 'https://cdn3.emoji.gg/emojis/5911-peepowait.png',
      'color': Colors.yellow.shade200,
    },
    {
      'title': 'Gigachad',
      'imageUrl': 'https://cdn3.emoji.gg/emojis/9588-gigachad.png',
      'color': Colors.lightBlueAccent.shade200,
    },
    {
      'title': 'pain',
      'imageUrl': 'https://cdn3.emoji.gg/emojis/9889-pain.gif',
      'color': Colors.orange.shade200,
    },
    {
      'title': 'trollege',
      'imageUrl': 'https://cdn3.emoji.gg/emojis/5680-trollege.gif',
      'color': Colors.orange.shade200,
    },
  ];

  var favorites = [];

  void toggleFavorite(item) {
    favorites.contains(item)
      ? favorites.remove(item)
      : favorites.add(item);

    notifyListeners();
  }

  void removeFavorite(item) {
    favorites.remove(item);

    notifyListeners();
  }

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
        page = FavoritesPage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return Scaffold(
      appBar: AppBar(
          leading: Icon(Icons.arrow_back_ios_new),
          title: Text('Select favorite',
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
    return GridView.count(
      crossAxisCount: 2,
      padding: EdgeInsets.all(5),
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
    var appState = context.watch<MyAppState>();

    IconData icon;
    if (appState.favorites.contains(imageUrl)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

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
                top: 5,
                right: 0,
                child:
                IconButton(
                  onPressed: () {
                    appState.toggleFavorite(imageUrl);
                  },
                  icon: Icon(icon),
                  color: Colors.red.shade300
                ),
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

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.favorites.isEmpty) {
      return Center(
        child: Text('You can add favorite emoji', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('You have ${appState.favorites.length} favorites:'),
        ),
        Expanded(child: GridView(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 400,
            childAspectRatio: 400 / 100,
            mainAxisSpacing: 20
          ),
          children: [
            for (var fav in appState.favorites)
              ListTile(
                leading: IconButton(
                  icon: Icon(Icons.delete, semanticLabel: 'Delete',),
                  onPressed: () {
                    appState.removeFavorite(fav);
                  },
                ),
                title: Image.network('$fav'),
              ),
          ],
        ))
      ],
    );
  }
}

