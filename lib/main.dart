import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this, // the SingleTickerProviderStateMixin
      duration: const Duration(seconds: 2),
    );
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Variable Font Animation Demo'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (_, __) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              for (final entry in {
                'VF': [
                  for (final c
                      in '!*,.0123456789;?ABCDEFGHIJKLMNOPQRSTUVWXabcdeghijkmnopqstuvwxyz'
                          .characters)
                    Text(
                      c,
                      style: TextStyle(
                        fontFamily: 'AniconsGX',
                        fontSize: 30,
                        fontVariations: [
                          FontVariation('TIME', _controller.value * 99 + 1)
                        ],
                      ),
                    )
                ],
                'VF+COLRv0': [
                  for (final c
                      in '01235679ABCDEFGHILMNORSTUWabceghikmnoqstv'.characters)
                    Text(
                      c,
                      style: TextStyle(
                        fontFamily: 'AniconsColorGX',
                        fontSize: 30,
                        fontVariations: [
                          FontVariation('TIME', _controller.value * 99 + 1)
                        ],
                      ),
                    )
                ],
                'VF+COLRv1': [
                  for (final entry in {
                    'a-circle': 51,
                    'bounce-gradient': 95,
                    'cat-simple': 123,
                    'cat': 40,
                    'cigratte-man': 38,
                    'crying': 80,
                    'fire': 263,
                    'gear': 28,
                    'gear2': 28,
                    'legs': 38,
                    'rabbit': 90,
                    'rabbit2': 151,
                    'square': 28,
                    'sweat-grin': 51,
                    'sweat': 51,
                    'tongue': 95,
                    'wumpus-hi': 120,
                  }.entries)
                    SizedBox(
                      width: 30,
                      height: 40,
                      child: Text(
                        'a',
                        style: TextStyle(
                          fontFamily: entry.key,
                          fontSize: 40,
                          fontVariations: [
                            FontVariation(
                                'ANIM', _controller.value * entry.value)
                          ],
                        ),
                      ),
                    )
                ],
              }.entries)
                Flexible(
                  child: Column(
                    children: [
                      Text(entry.key),
                      Wrap(
                        direction: Axis.horizontal,
                        children: entry.value,
                      )
                    ],
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
