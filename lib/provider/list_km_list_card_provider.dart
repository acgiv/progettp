
import 'package:flutter_riverpod/flutter_riverpod.dart';


final listPageProvider = Provider<List<Page>>((ref) {
  return Page.values.toList();
});
