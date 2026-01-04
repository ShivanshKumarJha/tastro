import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({
    super.key,
    required this.currentFilters,
  });

  final Map<Filter, bool> currentFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

enum Filter {
  glutenFree,
  lactoseFree,
  vegan,
  vegetarian,
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _isGlutenFree = false;
  bool _isLactoseFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;

  @override
  void initState() {
    super.initState();
    _isGlutenFree = widget.currentFilters[Filter.glutenFree]!;
    _isLactoseFree = widget.currentFilters[Filter.lactoseFree]!;
    _isVegan = widget.currentFilters[Filter.vegan]!;
    _isVegetarian = widget.currentFilters[Filter.vegetarian]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Filters'),
        ),
        // drawer: MainDrawer(
        //   onSelectScreen: (identifier) {
        //     Navigator.of(context).pop();
        //     if (identifier == 'filters') {
        //       Navigator.of(context).pushReplacement(
        //           MaterialPageRoute(builder: (_) => const TabsScreen()));
        //     }
        //   },
        // ),
        body: PopScope(
          canPop: false,
          onPopInvoked: (didPop) {
            if (didPop) return;
            Navigator.of(context).pop({
              Filter.glutenFree: _isGlutenFree,
              Filter.lactoseFree: _isLactoseFree,
              Filter.vegan: _isVegan,
              Filter.vegetarian: _isVegetarian,
            });
          },
          child: Column(
            children: [
              SwitchListTile(
                value: _isGlutenFree,
                onChanged: (isChecked) {
                  setState(() {
                    _isGlutenFree = isChecked;
                  });
                },
                title: Text('Gluten-free',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface)),
                subtitle: Text('Only include gluten-free meals',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface)),
                activeThumbColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left: 34, right: 22),
              ),
              SwitchListTile(
                value: _isLactoseFree,
                onChanged: (isChecked) {
                  setState(() {
                    _isLactoseFree = isChecked;
                  });
                },
                title: Text('Lactose-free',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface)),
                subtitle: Text('Only include lactose-free meals',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface)),
                activeThumbColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left: 34, right: 22),
              ),
              SwitchListTile(
                value: _isVegan,
                onChanged: (isChecked) {
                  setState(() {
                    _isVegan = isChecked;
                  });
                },
                title: Text('Vegan',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface)),
                subtitle: Text('Only include vegan meals',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface)),
                activeThumbColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left: 34, right: 22),
              ),
              SwitchListTile(
                value: _isVegetarian,
                onChanged: (isChecked) {
                  setState(() {
                    _isVegetarian = isChecked;
                  });
                },
                title: Text('Vegetarian',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface)),
                subtitle: Text('Only include vegetarian meals',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface)),
                activeThumbColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left: 34, right: 22),
              ),
            ],
          ),
        ));
  }
}
