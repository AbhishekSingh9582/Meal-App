import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import 'categories_screen.dart';
import '../models/meal.dart';
import 'favourite_screen.dart';

// class TabScreen extends StatefulWidget {
//   @override
//   _TabScreenState createState() => _TabScreenState();
// }

// class _TabScreenState extends State<TabScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       //initialIndex: 1,
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Meal'),
//           bottom: TabBar(

//             // indicator: BoxDecoration(
//             //     gradient: LinearGradient(
//             //   colors: [Colors.red, Colors.blue],
//             // )),

//             indicatorColor: Colors.green,
//             indicatorWeight: 4,
//             tabs: <Widget>[
//               Tab(icon: Icon(Icons.category), text: 'Categories'),
//               Tab(icon: Icon(Icons.star), text: 'My Favorite'),
//             ],
//           ),
//         ),
//         body: TabBarView(children: [CategoriesScreen(), FavouriteScreen()]),
//       ),
//     );
//   }
// }

class TabScreen extends StatefulWidget {
  final List<Meal> _favoriteList;
  TabScreen(this._favoriteList);
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Map<String, Object>> _page;
  @override
  void initState() {
    super.initState();
    _page = [
      {
        'page': CategoriesScreen(),
        'title': 'Category',
      },
      {
        'page': FavouriteScreen(widget._favoriteList),
        'title': 'Favourite',
      },
    ];
  }

  int _selectedPageIndex = 0;
  _selectPage(index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_page[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _page[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        selectedItemColor: Colors.white,
        elevation: 3,
        selectedFontSize: 18,
        onTap: _selectPage,
        // type: BottomNavigationBarType.shifting, // While using shifting effect we need to manually set background color in each BottomNavigationBarItem
        items: [
          BottomNavigationBarItem(
              // backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              label: 'Categories'),
          BottomNavigationBarItem(
              // backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              label: 'Your Favorite')
        ],
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
