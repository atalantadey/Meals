import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/fliter_provider.dart';
//import 'package:meals/presentations/tabs.dart';
//import 'package:meals/widgets/my_drawer.dart';


class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key,});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final activefilters= ref.watch(filterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      // ignore: deprecated_member_use
      body:  Column(
          children: [
            SwitchListTile(
              value: activefilters[Filter.glutenFree]!,
              onChanged: (isChecked) {
                ref.read(filterProvider.notifier).setFilter(Filter.glutenFree, isChecked);
              },
              title: Text(
                'Gluten-Free',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Only include Gluten Free meals.',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: activefilters[Filter.lactoseFree]!,
              onChanged: (isChecked) {
                ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.lactoseFree, isChecked);
              },
              title: Text(
                'Lactose-Free',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Only include Lactose-free meals.',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: activefilters[Filter.vegetarian]!,
              onChanged: (isChecked) {
                ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.vegetarian, isChecked);
              },
              title: Text(
                '🥦 Vegetarian',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Only include Vegetarian meals.',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: activefilters[Filter.vegan]!,
              onChanged: (isChecked) {
                ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.vegan, isChecked);
              },
              title: Text(
                'Vegan',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Only include Vegan meals.',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
          ],
        ),
      );
    
  }
}
