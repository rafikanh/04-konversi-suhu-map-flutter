//Nama  : Rafika Nurhayati
//Kelas : MI2F
//NIM   : 2031710081

import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  const Input({
    Key? key,
    required this.etInput,
  }) : super(key: key);

  final TextEditingController etInput;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration:
          const InputDecoration(hintText: 'Masukkan Suhu Dalam Celcius'),
      //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      controller: etInput,
      keyboardType: TextInputType.number,
    );
  }
}
