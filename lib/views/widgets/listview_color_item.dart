import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:noteapp/cubit/add_note/add_note_cubit.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isActive, required this.color});

  final bool isActive;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            radius: 35,
            backgroundColor: const Color.fromARGB(255, 218, 216, 216),
            child: CircleAvatar(radius: 30, backgroundColor: color),
          )
        : CircleAvatar(
            radius: 35,
            backgroundColor: color,
          );
  }
}

class ListViewColor extends StatefulWidget {
  const ListViewColor({super.key});

  @override
  State<ListViewColor> createState() => _ListViewColorState();
}

class _ListViewColorState extends State<ListViewColor> {
  int currentIndex = 0;

  List<Color> colors = const [
    Color(0xffffadad),
    Color(0xffffd6a5),
    Color(0xfffdffb6),
    Color(0xffcaffbf),
    Color(0xff9bf6ff),
    Color(0xffa0c4ff),
    Color(0xffbdb2ff),
    Color(0xffffc6ff)
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35 * 2,
      child: ListView.builder(
        itemCount: colors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GestureDetector(
              onTap: () {
                currentIndex = index;
                BlocProvider.of<AddNoteCubit>(context).color = colors[index];
                setState(() {});
              },
              child: ColorItem(
                color: colors[index],
                isActive: currentIndex == index,
              ),
            ),
          );
        },
      ),
    );
  }
}
