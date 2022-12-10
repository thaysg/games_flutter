import 'package:flutter/material.dart';

class GameButton extends StatelessWidget {
  final Function()? onTap;
  final String image;
  final Color color;

  const GameButton({
    Key? key,
    this.onTap,
    required this.image,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.4,
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(
              color: color,
              width: 10,
            ),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Image.asset(
                image,
                color: color,
                height: 100,
              ),
            ),
          ),
        ),
      ),
    ); /* GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: MediaQuery.of(context).size.width * 0.2,
        backgroundColor: color,
        child: CircleAvatar(
          radius: MediaQuery.of(context).size.width * 0.18,
          backgroundColor: primaryDark,
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Image.asset(
              image,
              color: color,
            ),
          ),
        ),
      ),
    ); */
  }
}
