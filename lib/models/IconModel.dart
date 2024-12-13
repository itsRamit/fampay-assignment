class Icon {
  final String imageType;
  final String imageUrl;
  final String? webpImageUrl;
  final double aspectRatio;

  Icon({
    required this.imageType,
    required this.imageUrl,
    this.webpImageUrl,
    required this.aspectRatio,
  });

  factory Icon.fromJson(Map<String, dynamic> json) {
    return Icon(
      imageType: json['image_type'],
      imageUrl: json['image_url'],
      webpImageUrl: json['webp_image_url'],
      aspectRatio: json['aspect_ratio'],
    );
  }
}