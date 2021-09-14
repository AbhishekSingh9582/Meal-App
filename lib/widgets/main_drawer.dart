import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  static const String routeNamed = '/filter-screen';
  @override
  Widget build(BuildContext context) {
    Widget buildListTile(String title, IconData icon, Function tapHandler) {
      return ListTile(
        leading: Icon(
          icon,
          size: 26,
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        subtitle: Divider(
          thickness: 2,
        ),
        onTap: () => tapHandler(),
      );
    }

    return Drawer(
      child: Column(
        children: [
          Container(
            height: 110,
            width: double.infinity,
            padding: EdgeInsets.all(10),
            color: Theme.of(context).accentColor,
            alignment: Alignment.centerLeft,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(height: 18),
          buildListTile('Categories', Icons.restaurant,
              () => Navigator.of(context).pushReplacementNamed('/')),
          // Divider(
          //   thickness: 2,
          // ),
          buildListTile('Filters', Icons.settings,
              () => Navigator.of(context).pushReplacementNamed(routeNamed)),
        ],
      ),
    );
  }
}
