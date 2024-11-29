import 'package:d4m/widgets/items_card_car.dart';
import 'package:flutter/material.dart';
import 'package:d4m/widgets/main_drawer.dart';
import 'package:d4m/widgets/items_botton_bar.dart';
import 'package:d4m/widgets/items_card_list_car.dart';
import 'package:intl/intl.dart';

class PercorrenzaAuto extends StatefulWidget {
  const PercorrenzaAuto({super.key});

  @override
  State<PercorrenzaAuto> createState() => _PercorrenzaAuto();
}

class _PercorrenzaAuto extends State<PercorrenzaAuto> {
  final _formKey = GlobalKey<FormState>();
  final format = DateFormat.yMd();
  final TextEditingController _kmController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    super.dispose();
    _kmController.dispose();
    _scrollController.dispose();
  }

  final List<Map<String, String>> listCard = [
    {'id': '0', 'data': '01/01/2024', 'tipo': 'DRIVERS', 'chilometri': '10333'},
    {
      'id': '1',
      'data': '05/01/2024',
      'tipo': 'AUTOMATICO',
      'chilometri': '12.222'
    },
    {
      'id': '2',
      'data': '05/01/2024',
      'tipo': 'AUTOMATICO',
      'chilometri': '1.233'
    },
    {'id': '3', 'data': '05/01/2024', 'tipo': 'DRIVERS', 'chilometri': '1.222'},
  ];

  void _showInputDialog(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text('Inserisci chilometri'),
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(10), // Arrotondamento meno pronunciato
          ),
          content: Form(
            key: _formKey,
            child: TextFormField(
              keyboardType: TextInputType.number,
              controller: _kmController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Questo campo non può essere vuoto';
                }
                final number = double.tryParse(value);
                if (number == null) {
                  return 'Inserisci un numero valido';
                } else if (number < 0) {
                  return 'Questo campo non può essere negativo';
                } else if (number <=
                    int.parse(listCard.first['chilometri'] ?? '0')) {
                  return 'I chilometri sono minori o uguali ai precedenti';
                }
                return null;
              },
              decoration: const InputDecoration(
                label: Text("Chilometri"),
                hintText: "es 1500",
                prefixText: "Km ",
                isDense: false,
                errorStyle: TextStyle(),
                errorMaxLines: 2, // Limit error text to 1 line
              ),
            ),
          ),
          actions: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, // Posiziona i pulsanti
              children: [
                Material(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  elevation: 3.0,
                  color: Theme.of(context).colorScheme.primary,
                  clipBehavior: Clip.antiAlias,
                  child: MaterialButton(
                    onPressed: _insertKm,
                    child: Text(
                      "Crea",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary),
                    ),
                  ),
                ),
                Material(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    side: BorderSide(
                        color: Theme.of(context).colorScheme.primary, width: 1),
                  ),
                  elevation: 3.0,
                  color: Theme.of(context).colorScheme.tertiary,
                  clipBehavior: Clip.antiAlias,
                  child: MaterialButton(
                    onPressed: () {
                      _kmController.clear();
                      Navigator.pop(context); // Chiude il dialog
                    },
                    child: Text(
                      "Annulla",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  void _insertKm() {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      setState(() {
        String formattedDate = DateFormat('MM/dd/yyyy').format(DateTime.now());

        listCard.insert(0, {
          'id': listCard.length.toString(),
          'data': formattedDate,
          'tipo': 'DRIVERS',
          'chilometri': _kmController.text
        });
        Future.delayed(const Duration(milliseconds: 100), () {
          _scrollController.animateTo(
            0, // Sposta la vista alla prima posizione
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        });
        _kmController.clear();
        Navigator.pop(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Percorrenza Auto',
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 30,
          ),
          const CardCar(),
          const SizedBox(
            height: 12,
          ),
          SizedBox(
            height: 300,
            child: ListView.builder(
                controller: _scrollController,
                itemCount: listCard.length,
                itemBuilder: (context, index) {
                  final item = listCard[index];
                  return ItemsCardListCar(
                    dataKm: item['data'] ?? '',
                    type: item['tipo'] ?? '',
                    numKm: item['chilometri'] ?? '',
                    index: index,
                  );
                }),
          ),
        ],
      ),
      drawer: const MainDrawer(),
      bottomNavigationBar: const BottomItemWidget(),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () => _showInputDialog(context),
        // Icona del FAB
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.tertiary,
        ),
      ),
    );
  }
}
