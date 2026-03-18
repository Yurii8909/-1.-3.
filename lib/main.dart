// Імпорт головного пакету Flutter -- дає доступ до всіх базових віджетів (Material Design)
import 'package:flutter/material.dart';

// Головна функція програми -- точка входу (аналог main() у C++/Java/Python)
void main() {
  // runApp() -- запускає весь додаток Flutter
  // Всередину передаємо кореневий віджет (тут MyApp)
  runApp(const MyApp());
}

// MyApp -- кореневий віджет усього додатка
// Зазвичай це StatelessWidget, бо сам додаток рідко змінює свій стан
class MyApp extends StatelessWidget {
  // Конструктор класу. super.key -- передає ключ віджета вгору по дереву (допомагає Flutter оптимізувати оновлення)
  const MyApp({super.key});

  // Метод build -- головний метод будь-якого віджета
  // Flutter викликає його, коли потрібно намалювати/оновити цей віджет
  @override
  Widget build(BuildContext context) {
    // MaterialApp -- головний "контейнер" Material Design додатка
    // Задає: тему, навігацію (routes), локалізацію, home-екран тощо
    return MaterialApp(
      // Вимикає червоний банер "DEBUG" у правому верхньому куті (зручно для демонстрації)
      debugShowCheckedModeBanner: false,

      // ThemeData -- описує глобальну тему додатка (кольори,  шрифти, стилі кнопок тощо)
      theme: ThemeData(
        // colorScheme -- сучасний спосіб задавати кольори (Material  3)
        // fromSeed() -- автоматично генерує гармонійну палітру на основі одного seed-кольору
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),

        // useMaterial3: true -- вмикає новий дизайн Material You (2021+)
        useMaterial3: true,
      ),

      // home -- вказує, який екран показувати першим після запуску
      home: const MyHomePage(),
    );
  }
}

// MyHomePage -- віджет, що представляє головний екран програми
// StatefulWidget -- використовується, коли вміст екрану може змінюватися (тут -- лічильник)
class MyHomePage extends StatefulWidget {
  // Конструктор. super.key -- стандартна практика
  const MyHomePage({super.key});

  // createState() -- обов'язковий метод StatefulWidget
  // Повертає об'єкт стану (State), де живе змінна _counter та логіка
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// _MyHomePageState -- клас стану для MyHomePage
// Саме тут зберігається змінна _counter і методи, що її змінюють
class _MyHomePageState extends State<MyHomePage> {
  // _counter -- приватна змінна стану (змінюється при натисканні кнопки)
  // Початкове значення = 0
  int _counter = 0;

  // _incrementCounter -- метод, який збільшує лічильник
  // Викликається при натисканні на FloatingActionButton
  void _incrementCounter() {
    // setState() -- ключова функція StatefulWidget!
    // Повідомляє Flutter: "змінюється стан → потрібно перебудувати екран"
    // Усе, що всередині setState, викликає оновлення інтерфейсу
    setState(() {
      _counter++; // Збільшуємо значення лічильника на 1
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

  // build -- метод, який описує, як виглядає цей екран
  // Викликається щоразу після setState() або при першому малюванні
  @override
  Widget build(BuildContext context) {
    // Scaffold -- базовий "каркас" екрану в Material Design
    // Містить appBar, body, floatingActionButton, drawer, bottomNavigationBar тощо
    return Scaffold(
      // AppBar -- верхня панель з назвою та діями
      appBar: AppBar(
        // backgroundColor беремо з поточної теми (inversePrimary -- контрастний колір)
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // title -- текст, що відображається в AppBar
        title: const Text('Перша спроба 🚀 '),
      ),
      // body -- основна частина екрану (все, що нижче AppBar)
      body: Center(
        // Center -- автоматично вирівнює дочірній віджет по центру екрану
        child: Column(
          // mainAxisAlignment.center -- розміщує дітей вертикально по центру
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text -- віджет для відображення тексту
            const Text(
              'Все працює як треба 🔥',
              style: TextStyle(
                fontSize: 22, // Розмір шрифту
                fontWeight: FontWeight.bold, // Жирний шрифт
              ),
            ),
            // SizedBox -- простий віджет-відступ (тут вертикальний 40 пікселів)
            const SizedBox(height: 40),

            const Text(
              'Ти натиснув кнопку стільки разів:',
              style: TextStyle(fontSize: 18),
            ),
            // Text -- показує поточне значення _counter
            // Оновлюється автоматично після кожного setState()
            Text(
              '$_counter', // $ -- інтерполяція: вставляє значення змінної в рядок
              style: Theme.of(
                context,
              ).textTheme.headlineMedium, // Стиль з теми (великий текст)
            ),

            const SizedBox(height: 30),

            // Row -- розміщує віджети горизонтально в рядок
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // FloatingActionButton -- кругла плаваюча кнопка дій (FAB)
                // Зазвичай для головної дії екрану (тут -- збільшення лічильника)
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
