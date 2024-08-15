import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      backgroundColor: Colors.blue,
      radius: 38,
    );
  }
}

class ColorsListView extends StatelessWidget {
  const ColorsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 2 * 38,
      child: ListView.builder(
        itemCount: 4,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const ColorItem();
        },
      ),
    );
  }
}
