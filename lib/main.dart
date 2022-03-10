//Nama  : Rafika Nurhayati
//Kelas : MI2F
//NIM   : 2031710081

import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:konversi_suhu_map/widget/dropdown.dart';
import 'package:konversi_suhu_map/widget/history.dart';

import 'widget/convert.dart';
import 'widget/input.dart';
import 'widget/result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  TextEditingController etInput = new TextEditingController();
  //state
  double _inputUser = 0;
  double _result = 0;
  final inputController = TextEditingController();
  String _selectedDropdown = "Pilih Suhu";
  final _listSatuanSuhu = ["Pilih Suhu", "Kelvin", "Reamur"];
  final List<String> _listHasil = [];

  _onChangedDropdown(String value) {
    setState(() {
      _selectedDropdown = value;
    });
    konversi();
  }

  konversi() {
    setState(() {
      if (etInput.text.isNotEmpty) {
        _inputUser = double.parse(etInput.text);
        switch (_selectedDropdown) {
          case "Kelvin":
            _result = _inputUser + 273;
            _listHasil
                .add("Konversi dari $_inputUser Celcius ke $_result Kelvin");
            break;
          case "Reamur":
            _result = _inputUser * 4 / 5;
            _listHasil
                .add("Konversi dari $_inputUser Celcius ke $_result Reamur");
            break;
          default:
            _listHasil.add("Suhu belum dipilih");
            break;
        }
      } else {
        _listHasil.add("Suhu belum dipilih dan Celcius kosong");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Konversi Suhu',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Konverter Suhu - 2031710081 Rafika Nurhayati"),
        ),
        body: Container(
          margin: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Input(etInput: etInput),
              Dropdown(
                  selectedDropdown: _selectedDropdown,
                  listSatuanSuhu: _listSatuanSuhu,
                  onChangedDropdown: _onChangedDropdown),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Result(
                    result: _result,
                  ),
                ],
              ),
              Convert(konversi: konversi),
              History(
                listHasil: _listHasil,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
