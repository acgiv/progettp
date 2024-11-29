import 'package:flutter/material.dart';

import 'package:flutter_svg_icons/flutter_svg_icons.dart';

class CardCar extends StatelessWidget {
  const CardCar({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Card(
        elevation: 2,
        color: Colors.white,
        child: SizedBox(
          width: 350,
          height: 240,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                  padding: EdgeInsets.only(top: 12, left: 16),
                  child: Text(
                    'MERCEDES BENZ',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(167, 168, 170, 1),
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.only(top: 8, left: 16),
                  child: Text(
                    'MERCEDES-BENZ GLE 350 DE 4MATIC EQ-POWER Premium',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                      height: 130,
                      child: Image.asset(
                        'assets/image/svg/auto.png',
                        fit: BoxFit.fill,
                      )),
                  Column(
                    children: [
                      const Text(
                        'Targa Attuale',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Color.fromRGBO(167, 168, 170, 1),
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Stack(
                        alignment:
                            Alignment.center, // Centra il testo sull'immagine
                        children: [
                          // L'immagine di sfondo
                          Image.asset(
                            'assets/image/svg/targa.png',
                            width: 99,
                            fit: BoxFit.contain,
                          ),
                          const Text(
                            'GD724TH',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SvgIcon(
                            icon: const SvgIconData(
                                'assets/image/svg/ico_percorrenza_cerchio.svg'),
                            size: 34,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Km attuali',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Color.fromRGBO(167, 168, 170, 1),
                                ),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                '35.000',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color:
                                        Theme.of(context).colorScheme.primary),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
