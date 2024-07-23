import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/Data/arena_data.dart';
import 'package:flutter_application_1/Widgets/result_card.dart';

class CardProvider extends ChangeNotifier {
  ScrollableCard? _card;

  ScrollableCard? get card => _card;

  set card(ScrollableCard? newCard) {
    _card = newCard;
    notifyListeners();
  }
}
