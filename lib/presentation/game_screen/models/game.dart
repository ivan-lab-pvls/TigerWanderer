import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wanderer/presentation/game_screen/models/card_item.dart';
import 'package:wanderer/presentation/game_screen/utils/icons.dart';

class Game {
  Game(this.gridSize) {
    generateCards();
  }
  final int gridSize;
  bool isClickable = true;
  List<CardItem> cards = [];
  bool isGameOver = false;
  Set<Widget> icons = {};

  void generateCards() {
    generateIcons();
    cards = [];
    final List<Color> cardColors = Colors.primaries.toList();
    for (int i = 0; i < (gridSize * gridSize / 2); i++) {
      final cardValue = i + 1;
      final Widget icon = icons.elementAt(i);
      final Color cardColor = cardColors[i % cardColors.length];
      final List<CardItem> newCards =
          _createCardItems(icon, cardColor, cardValue);
      cards.addAll(newCards);
    }
    cards.shuffle(Random());
  }

  void generateIcons() {
    icons = <Widget>{};
    for (int j = 0; j < (gridSize * gridSize / 2); j++) {
      final Widget icon = _getRandomCardIcon();
      icons.add(icon);
      icons.add(icon); // Add the icon twice to ensure pairs are generated.
    }
  }

  void resetGame() {
    generateCards();
    isGameOver = false;
  }

  void onCardPressed(int index) {
    cards[index].state = CardState.visible;
    final List<int> visibleCardIndexes = _getVisibleCardIndexes();
    if (visibleCardIndexes.length == 2) {
      isClickable = false;
      final CardItem card1 = cards[visibleCardIndexes[0]];
      final CardItem card2 = cards[visibleCardIndexes[1]];
      if (card1.value == card2.value) {
        card1.state = CardState.guessed;
        card2.state = CardState.guessed;
        isGameOver = _isGameOver();
        isClickable = true;
      } else {
        Future.delayed(const Duration(milliseconds: 500), () {
          card1.state = CardState.hidden;
          card2.state = CardState.hidden;
          isClickable = true;
        });
      }
    }
  }

  List<CardItem> _createCardItems(
      Widget icon, Color cardColor, int cardValue) {
    return List.generate(
      2,
      (index) => CardItem(
        value: cardValue,
        icon: icon,
        color: cardColor,
      ),
    );
  }

  Widget _getRandomCardIcon() {
    final Random random = Random();
    Widget icon;
    do {
      icon = cardIcons[random.nextInt(cardIcons.length)];
    } while (icons.contains(icon));
    return icon;
  }

  List<int> _getVisibleCardIndexes() {
    return cards
        .asMap()
        .entries
        .where((entry) => entry.value.state == CardState.visible)
        .map((entry) => entry.key)
        .toList();
  }

  bool _isGameOver() {
    return cards.every((card) => card.state == CardState.guessed);
  }


}
