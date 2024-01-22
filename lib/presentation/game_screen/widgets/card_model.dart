// Модель карточки
import 'package:flutter/material.dart';

class CardModel {
  final int id;
  final String imagePath;

  CardModel({required this.id, required this.imagePath});
}

// Виджет карточки
class CardWidget extends StatelessWidget {
  final CardModel card;
  final VoidCallback onTap;

  CardWidget({required this.card, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(card.imagePath),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
