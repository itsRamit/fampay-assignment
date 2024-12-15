import 'package:flutter/material.dart';

class HC1Card extends StatelessWidget {
  final int height;
  final String bgColor;
  final String imageUrl;
  final String title;
  final String description;
  final String titleColor;
  final String descriptionColor;

  const HC1Card({
    Key? key,
    required this.height,
    required this.bgColor,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.titleColor,
    required this.descriptionColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.only(top: 16, bottom: 16),
      width: double.infinity,
      height: height.toDouble() + 16,
      decoration: BoxDecoration(
        color: convertHexToColor(bgColor),
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Image.network(
            imageUrl,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                return child;
              } else {
                return const Center(
                    child: Icon(
                  Icons.person_2_rounded,
                ));
              }
            },
            errorBuilder:
                (BuildContext context, Object error, StackTrace? stackTrace) {
              return const Center(child: Icon(Icons.person));
            },
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: convertHexToColor(titleColor),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: convertHexToColor(
                        descriptionColor),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper function to convert a single hex string to Color
  Color convertHexToColor(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
