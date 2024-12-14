class BgGradient {
  final int angle;
  final List<String> colors;

  BgGradient({
    required this.angle,
    required this.colors,
  });

  factory BgGradient.fromJson(Map<String, dynamic> json) {
    return BgGradient(
      angle: json['angle'] ?? 0,
      colors: (json['colors'] as List?)?.map((e) => e.toString()).toList() ?? [],
    );
  }
}
