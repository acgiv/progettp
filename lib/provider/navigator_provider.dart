import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Page { home, doumenti, percorrenza, helpDesk }

class PageNotifier extends StateNotifier<Map<Page, bool>> {
  static Map<Page, bool> initialPage() {
    var elem = restState();
    return {...elem, Page.home: true};
  }

  PageNotifier() : super(initialPage());

  static Map<Page, bool> restState() {
    var elem = {};
    for (final item in Page.values) {
      elem = {...elem, item: false};
    }
    return {...elem};
  }

  int getIndex() {
    final index = state.entries.firstWhere((e) => e.value == true).key;
    return Page.values.indexOf(index);
  }

  void setPage(Page page, bool isActive) {
    state = {...restState(), page: isActive};
  }
}
// buttato il commento

final pageProvider =
    StateNotifierProvider<PageNotifier, Map<Page, bool>>((ref) {
  return PageNotifier();
});

final listPageProvider = Provider<List<Page>>((ref) {
  return Page.values.toList();
});
