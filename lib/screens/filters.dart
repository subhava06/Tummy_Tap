import 'package:flutter/material.dart';

import '../providers/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'package:meals/screens/tabs.dart';
// import '../widgets/main_drawer.dart';



class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});



  @override
  Widget build(BuildContext context, WidgetRef ref) {
   final activeFilters =  ref.watch(filtersProvider);
    return Scaffold( // it is a brand new screen so it has its own scaffold
      appBar: AppBar(
        title: Text('Your filters'),
      ),

      // drawer: MainDrawer(onSelectScreen: (identifier){
      //  Navigator.of(context).pop();
      //  if(identifier == 'meals') {
      //    Navigator.of(context).pushReplacement(
      //      MaterialPageRoute(builder: (ctx)=> TabsScreen()),
      //    );
      //  }
      // }),

      body:
      Column(
          children: [
            //first row in the list of settings
            SwitchListTile(
                value: activeFilters[Filter.glutenFree]!,
                onChanged: (isChecked) {
                  ref.read(filtersProvider.notifier).setFilter(Filter.glutenFree, isChecked);
                },
                title: Text('Gluten-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                ),
              subtitle: Text('Only include gluten-free meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left:34, right: 22),
            ),

            SwitchListTile(
              value: activeFilters[Filter.lactoseFree]!,
              onChanged: (isChecked) {
                ref.read(filtersProvider.notifier).setFilter(Filter.lactoseFree, isChecked);

              },
              title: Text('Lactose-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              subtitle: Text('Only include lactose-free meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left:34, right: 22),
            ),

            SwitchListTile(
              value: activeFilters[Filter.vegetarian]!,
              onChanged: (isChecked) {
                ref.read(filtersProvider.notifier).setFilter(Filter.vegetarian, isChecked);

              },
              title: Text('Vegetarian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              subtitle: Text('Only include vegetarian meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left:34, right: 22),
            ),

            SwitchListTile(
              value: activeFilters[Filter.vegan]!,
              onChanged: (isChecked) {
                ref.read(filtersProvider.notifier).setFilter(Filter.vegan, isChecked);

              },
              title: Text('Vegan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              subtitle: Text('Only include vegan meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left:34, right: 22),
            ),
          ],
        ),

    );
  }
}
