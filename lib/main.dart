import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

//StatelessWidget делает приложение виджетом
//extends извлекает свойства и характеристики из другого класса (наследование)
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //MaterialApp создание граф.интерфейса в стиле material design
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        //primarySwatch использует оттенки цвета
        primarySwatch: Colors.blue,
      ),
      //home отображается при загрузке страницы
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  //final значение может быть присвоено один раз, но любое
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  DateTime _dateTime = DateTime(2001);

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    //scaffold реализует базовую структуру визуального макета маериал дезайн
    return Scaffold(
      //appbar панель приложения отображается в верхней части экрана
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // center
      body: Center(
        child: Column(
          //mainAxisSize определяет сколько места row and column может занимать их главные оси
          mainAxisSize: MainAxisSize.min,
          //children виджеты под этим виджетом. Управляет дочерними виджетами
          children: [
            Text(
              '${_dateTime.day}-${_dateTime.month}-${_dateTime.year}',
              style: const TextStyle(fontSize: 40),
            ),
            ElevatedButton(
              onPressed: () async {
                DateTime? _newDate = await showDatePicker(
                    context: context,
                    initialDate: _dateTime,
                    firstDate: DateTime(1800),
                    lastDate: DateTime(3000));
                if (_newDate != null) {
                  setState(() {
                    _dateTime = _newDate;
                  });
                }
              },
              child: const Text("Get date"),
            ),
          ],
        ),
      ),
      //floatingActionButton кнопка с плавающим действием. Применяется для выполнения основного дейсвтия в приложении
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        //tooltip применяется для всплывания подсказок
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
