import 'package:card_app/models/CardModel.dart';

class HcGroup {
  final int id;
  final String name;
  final String designType;
  final int cardType;
  final List<Card> cards;
  final bool isScrollable;
  final int height;
  final bool isFullWidth;
  final String slug;
  final int level;

  HcGroup({
    required this.id,
    required this.name,
    required this.designType,
    required this.cardType,
    required this.cards,
    required this.isScrollable,
    required this.height,
    required this.isFullWidth,
    required this.slug,
    required this.level,
  });

  factory HcGroup.fromJson(Map<String, dynamic> json) {
    return HcGroup(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      designType: json['design_type'] ?? '',
      cardType: json['card_type'] ?? 0,
      cards: (json['cards'] as List?)
              ?.map((card) => Card.fromJson(card))
              .toList() ??
          [],
      isScrollable: json['is_scrollable'] ?? false,
      height: json['height'] ?? 0,
      isFullWidth: json['is_full_width'] ?? false,
      slug: json['slug'] ?? '',
      level: json['level'] ?? 0,
    );
  }
}
