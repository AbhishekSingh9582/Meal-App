import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  final Function setFilter;
  final Map<String, bool> filter;
  FilterScreen(this.setFilter, this.filter);
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _lactoseFree = false;
  var _veganFree = false;
  var _glutenFree = false;
  var _vegetarian = false;
  @override
  void initState() {
    super.initState();
    _lactoseFree = widget.filter['lactose'];
    _veganFree = widget.filter['vegan'];
    _glutenFree = widget.filter['gluten'];
    _vegetarian = widget.filter['vegetarian'];
  }

  @override
  Widget build(BuildContext context) {
    // ModalRoute.of(context).settings.arguments
    Widget _buildSwitchListtile(String title, String description,
        bool currentValue, Function updateValue) {
      return SwitchListTile(
        onChanged: updateValue,
        value: currentValue,
        title: Text(title),
        subtitle: Text(description),
      );
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(
                Icons.save,
              ),
              onPressed: () {})
        ],
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Column(
          children: [
            Container(
              child: Text(
                'Adjust your selection ',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              padding: EdgeInsets.all(20),
            ),
            _buildSwitchListtile(
                'Vegan Free', 'Only include Vegan Free meals', _veganFree,
                (currentValue) {
              setState(() {
                _veganFree = currentValue;
                widget.setFilter({
                  'gluten': _glutenFree,
                  'vegan': _veganFree,
                  'vegetarian': _vegetarian,
                  'lactose': _lactoseFree
                });
              });
            }),
            _buildSwitchListtile(
                'Gluten-Free', 'Only include Gluten free meal', _glutenFree,
                (currentValue) {
              setState(() {
                _glutenFree = currentValue;
                widget.setFilter({
                  'gluten': _glutenFree,
                  'vegan': _veganFree,
                  'vegetarian': _vegetarian,
                  'lactose': _lactoseFree
                });
              });
            }),
            _buildSwitchListtile(
                'Vegetarian', 'Only include Vegetarian meal', _vegetarian,
                (currentValue) {
              setState(() {
                _vegetarian = currentValue;
                widget.setFilter({
                  'gluten': _glutenFree,
                  'vegan': _veganFree,
                  'vegetarian': _vegetarian,
                  'lactose': _lactoseFree
                });
              });
            }),
            _buildSwitchListtile(
                'Lactose-free', 'Only include Lactose free meal ', _lactoseFree,
                (currentValue) {
              setState(() {
                _lactoseFree = currentValue;
                widget.setFilter({
                  'gluten': _glutenFree,
                  'vegan': _veganFree,
                  'vegetarian': _vegetarian,
                  'lactose': _lactoseFree
                });
              });
            })
          ],
        ),
      ),
    );
  }
}
