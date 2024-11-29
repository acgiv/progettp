import 'package:flutter/material.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:d4m/provider/navigator_provider.dart';

class BottomItemWidget extends ConsumerStatefulWidget {
  const BottomItemWidget({super.key});

  @override
  ConsumerState<BottomItemWidget> createState() => _BottomItemWidget();
}

class _BottomItemWidget extends ConsumerState<BottomItemWidget> {
  int _selectedPageIdex = 0;

  void _selectPage(int index) {
    final pages = ref.watch(listPageProvider);
    setState(() {
      _selectedPageIdex = index;
    });
    ref.read(pageProvider.notifier).setPage(pages[index], true);
  }

  @override
  Widget build(BuildContext context) {
    _selectedPageIdex = ref.watch(pageProvider.notifier).getIndex();

    return Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Theme.of(context)
                  .colorScheme
                  .primary, // Colore del bordo superiore
              width: 4.0, // Larghezza del bordo
            ),
          ),
        ),
        child: BottomNavigationBar(
          onTap: _selectPage,
          currentIndex: _selectedPageIdex,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                activeIcon: SvgIcon(
                  icon: const SvgIconData('assets/image/svg/ico_home.svg'),
                  color: Theme.of(context).colorScheme.primary,
                ),
                icon: const SvgIcon(
                    icon: SvgIconData('assets/image/svg/ico_home.svg')),
                label: 'Home'),
            BottomNavigationBarItem(
                activeIcon: SvgIcon(
                  icon: const SvgIconData('assets/image/svg/ico_documenti.svg'),
                  color: Theme.of(context).colorScheme.primary,
                ),
                icon: const SvgIcon(
                    icon: SvgIconData('assets/image/svg/ico_documenti.svg')),
                label: 'Documenti'),
            BottomNavigationBarItem(
                activeIcon: SvgIcon(
                  icon:
                      const SvgIconData('assets/image/svg/ico_percorrenza.svg'),
                  color: Theme.of(context).colorScheme.primary,
                ),
                icon: const SvgIcon(
                    icon: SvgIconData('assets/image/svg/ico_percorrenza.svg')),
                label: 'Percorrenza'),
            BottomNavigationBarItem(
                activeIcon: SvgIcon(
                  icon: const SvgIconData('assets/image/svg/ico_helpdesk.svg'),
                  color: Theme.of(context).colorScheme.primary,
                ),
                icon: const SvgIcon(
                    icon: SvgIconData('assets/image/svg/ico_helpdesk.svg')),
                label: 'Help Desk'),
          ],
        ));
  }
}
