import 'package:card_app/models/BgGradientModel.dart';
import 'package:card_app/models/BgImageModel.dart';
import 'package:card_app/models/CtaModel.dart';
import 'package:card_app/models/FormattedTextModel.dart';

import 'IconModel.dart';

class Card {
  final int id;
  final String name;
  final String slug;
  final String? title;
  final FormattedText? formattedTitle;
  final String? description;
  final FormattedText? formattedDescription;
  final Icon? icon;
  final List<dynamic> positionalImages; // Define specific type if needed
  final List<dynamic> components; // Define specific type if needed
  final String? url;
  final BgImage? bgImage;
  final BgGradient? bgGradient;
  final List<Cta>? cta;
  final bool isDisabled;
  final bool isShareable;
  final bool isInternal;
  final String? bgColor;
  final int? iconSize;

  Card({
    required this.id,
    required this.name,
    required this.slug,
    this.title,
    this.formattedTitle,
    this.description,
    this.formattedDescription,
    this.icon,
    required this.positionalImages,
    required this.components,
    this.url,
    this.bgImage,
    this.bgGradient,
    this.cta,
    required this.isDisabled,
    required this.isShareable,
    required this.isInternal,
    this.bgColor,
    this.iconSize,
  });

  factory Card.fromJson(Map<String, dynamic> json) {
    return Card(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      title: json['title'],
      formattedTitle: json['formatted_title'] != null
          ? FormattedText.fromJson(json['formatted_title'])
          : null,
      description: json['description'],
      formattedDescription: json['formatted_description'] != null
          ? FormattedText.fromJson(json['formatted_description'])
          : null,
      icon: json['icon'] != null ? Icon.fromJson(json['icon']) : null,
      positionalImages: json['positional_images'] ?? [],
      components: json['components'] ?? [],
      url: json['url'],
      bgImage: json['bg_image'] != null
          ? BgImage.fromJson(json['bg_image'])
          : null,
      bgGradient: json['bg_gradient'] != null
          ? BgGradient.fromJson(json['bg_gradient'])
          : null,
      cta: (json['cta'] as List?)?.map((e) => Cta.fromJson(e)).toList(),
      isDisabled: json['is_disabled'],
      isShareable: json['is_shareable'],
      isInternal: json['is_internal'],
      bgColor: json['bg_color'],
      iconSize: json['icon_size'],
    );
  }
}