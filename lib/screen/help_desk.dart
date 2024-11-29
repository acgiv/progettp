import 'package:d4m/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:d4m/widgets/items_botton_bar.dart';

class HelpDesk extends StatelessWidget {
  const HelpDesk({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(
          'Help Desk',
          textAlign: TextAlign.center,
        )),
        drawer: const MainDrawer(),
        body: const Text("Help Desk"),
        bottomNavigationBar: const BottomItemWidget());
  }
}
