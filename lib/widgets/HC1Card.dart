import 'package:card_app/utils/utils.dart';
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
        color: Utils().convertHexToColor(bgColor),
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
                    color: Utils().convertHexToColor(titleColor),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Utils().convertHexToColor(
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
}
