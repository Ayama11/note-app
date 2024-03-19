import 'package:flutter/material.dart';

import '../../const.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onTap, this.isLoding = false});
  final Function()? onTap;
  final bool isLoding;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: kPrimaryColor, borderRadius: BorderRadius.circular(32)),
        child: Center(
            child: isLoding
                ? const CircularProgressIndicator(color: Colors.black)
                : const Text(
                    'Add',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  )),
      ),
    );
  }
}
