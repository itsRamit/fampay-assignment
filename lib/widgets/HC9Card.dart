import 'package:flutter/material.dart';

class HC9Card extends StatelessWidget {
  final List<String> hexGradientColors;
  final int height;
  final double angle;
  final String imageUrl;
  final double aspectRatio;

  const HC9Card({
    Key? key,
    required this.hexGradientColors,
    required this.height,
    required this.imageUrl,
    required this.aspectRatio,
    this.angle = 0.0, // Default angle is 0 degrees
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Using the passed aspect ratio to calculate the width
    double width = height * aspectRatio;

    return Container(
      width: width,
      height: height.toDouble(),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: _convertHexToColors(
              hexGradientColors), // Converting hex to Colors
          transform: GradientRotation(
              angle * 3.14159 / 180), // Converting degrees to radians
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          width: width,
          height: height.toDouble(),
        ),
      ),
    );
  }

  // Helper function to convert a list of hex strings to Color objects
  List<Color> _convertHexToColors(List<String> hexStrings) {
    return hexStrings.map((hex) => convertHexToColor(hex)).toList();
  }

  // Helper function to convert a single hex string to Color
  Color convertHexToColor(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
