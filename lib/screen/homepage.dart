import 'package:d4m/widgets/items_botton_bar.dart';
import 'package:d4m/widgets/items_card_car.dart';
import 'package:d4m/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Device4 mobility',
          textAlign: TextAlign.center,
        ),
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: 40, // Altezza della barra
                color: Theme.of(context)
                    .colorScheme
                    .onSurface, // Colore della barra
              ),
              const Positioned(child: CardCar())
            ],
          ),
        ],
      ),
      drawer: const MainDrawer(),
      bottomNavigationBar: const BottomItemWidget(),
    );
  }
}
