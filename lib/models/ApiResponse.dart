import 'package:card_app/models/HcGroupModel.dart';
import 'dart:convert';

ApiResponse apiResponseFromJson(String str) =>
    ApiResponse.fromJson(json.decode(str));

class ApiResponse {
  final int id;
  final String slug;
  final String? title;
  final String? formattedTitle;
  final String? description;
  final String? formattedDescription;
  final dynamic assets;
  final List<HcGroup> hcGroups;

  ApiResponse({
    required this.id,
    required this.slug,
    this.title,
    this.formattedTitle,
    this.description,
    this.formattedDescription,
    this.assets,
    required this.hcGroups,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      id: json['id'],
      slug: json['slug'],
      title: json['title'] ?? '',
      formattedTitle: json['formatted_title'] ?? '',
      description: json['description'] ?? '',
      formattedDescription: json['formatted_description'] ?? '',
      assets: json['assets'] ?? {},
      hcGroups: (json['hc_groups'] as List?)
              ?.map((group) => HcGroup.fromJson(group))
              .toList() ??
          [],
    );
  }
}
