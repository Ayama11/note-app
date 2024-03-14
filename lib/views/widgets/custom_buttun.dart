import 'package:flutter/material.dart';

import '../../const.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: kPrimaryColor, borderRadius: BorderRadius.circular(32)),
      child: const Center(
          child: Text(
        'Add',
        style: TextStyle(color: Colors.black, fontSize: 20),
      )),
    );
  }
}
