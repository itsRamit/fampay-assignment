class BgImage {
  final String imageType;
  final String imageUrl;
  final String? webpImageUrl;
  final double aspectRatio;

  BgImage({
    required this.imageType,
    required this.imageUrl,
    this.webpImageUrl,
    required this.aspectRatio,
  });

  factory BgImage.fromJson(Map<String, dynamic> json) {
    return BgImage(
      imageType: json['image_type'] ?? '',
      imageUrl: json['image_url'] ?? '',
      webpImageUrl: json['webp_image_url'],
      aspectRatio: (json['aspect_ratio'] as num?)?.toDouble() ?? 0.0,
    );
  }
}
