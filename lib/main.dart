import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

// MyApp -- кореневий віджет усього додатка
class MyApp extends StatelessWidget {

  const MyApp({super.key});
  // Метод build -- головний метод будь-якого віджета
  @override
  Widget build(BuildContext context) {
    // MaterialApp -- головний "контейнер" Material Design додатка
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),

      home: const MyHomePage(),
    );
  }
}

// MyHomePage -- віджет, що представляє головний екран програми
class MyHomePage extends StatefulWidget {
  // Конструктор. super.key
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// _MyHomePageState -- клас стану для MyHomePage
class _MyHomePageState extends State<MyHomePage> {

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++; 
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Перша спроба 🚀 '),
      ),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            const Text(
              'Все працює як треба 🔥',
              style: TextStyle(
                fontSize: 22, 
                fontWeight: FontWeight.bold, 
              ),
            ),
            const SizedBox(height: 40),

            const Text(
              'Ти натиснув кнопку стільки разів:',
              style: TextStyle(fontSize: 18),
            ),
            // Text -- показує поточне значення _counter
            Text(
              '$_counter', 
              style: Theme.of(
                context,
              ).textTheme.headlineMedium, 
            ),

            const SizedBox(height: 30),

            // Row -- розміщує віджети горизонтально в рядок
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // FloatingActionButton -- кругла плаваюча кнопка дій (FAB)
                FloatingActionButton(
                  onPressed: _incrementCounter,
                  tooltip: 'Додати',
                  backgroundColor: const Color.fromARGB(55, 212, 228, 174),
                  elevation: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [Colors.purpleAccent, Colors.blueAccent],
                      ),
                    ),

                    child: const Icon(Icons.add, color: Colors.white),
                  ),
                ),
                const SizedBox(width: 20),

                // Кнопка Скинути
                FloatingActionButton(
                  onPressed: _resetCounter,
                  tooltip: 'Скинути',
                  backgroundColor: Colors.red,
                  child: const Text("Скинути"),
                ),

                const SizedBox(width: 20),

                // Кнопка Відняти
                FloatingActionButton(
                  onPressed: _decrementCounter,
                  tooltip: 'Відняти',
                  backgroundColor: Colors.blue[700],
                  child: const Text("Відняти"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
