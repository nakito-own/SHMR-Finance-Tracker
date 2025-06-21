import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../l10n/app_localizations.dart';
import '../../navigation/pages_enum.dart';

class AppNavigationBar extends StatelessWidget {
  final AppPages selectedPage;
  final void Function(AppPages)? onDestinationSelected;

  const AppNavigationBar({
    super.key,
    required this.selectedPage,
    this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    final items = [
      (AppPages.income, 'assets/icons/uptrend-7.svg', AppLocalizations.of(context)!.income),
      (AppPages.expenses, 'assets/icons/downtrend-7.svg', AppLocalizations.of(context)!.expenses),
      (AppPages.account, 'assets/icons/calculator-7.svg', AppLocalizations.of(context)!.account),
      (AppPages.articles, 'assets/icons/bar-chart-side-7.svg', AppLocalizations.of(context)!.articles),
      (AppPages.settings, 'assets/icons/Vector.svg', AppLocalizations.of(context)!.settings),
    ];

    final selectedIndex = items.indexWhere((e) => e.$1 == selectedPage);

    if (selectedIndex == -1) {
      return const SizedBox.shrink(); // скрываем NavigationBar для экранов вне списка
    }

    return NavigationBar(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      selectedIndex: selectedIndex,
      onDestinationSelected: (index) {
        final page = items[index].$1;
        if (onDestinationSelected != null) {
          onDestinationSelected!(page);
        }
      },
      indicatorColor: Theme.of(context).colorScheme.primary,
      destinations: items.map((e) {
        return NavigationDestination(
          icon: SvgPicture.asset(
            e.$2,
            width: 20,
            height: 20,
            colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.onSurface,
              BlendMode.srcIn,
            ),
          ),
          selectedIcon: SvgPicture.asset(
            e.$2,
            width: 20,
            height: 20,
            colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.primary,
              BlendMode.colorDodge,
            ),
          ),
          label: e.$3,
        );
      }).toList(),
    );
  }
}
