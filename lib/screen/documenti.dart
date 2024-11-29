import 'package:d4m/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:d4m/widgets/items_botton_bar.dart';

class DocumentiPage extends StatelessWidget {
  const DocumentiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(
          'Documenti',
          textAlign: TextAlign.center,
        )),
        drawer: const MainDrawer(),
        body: const Text("Documenti"),
        bottomNavigationBar: const BottomItemWidget());
  }
}
