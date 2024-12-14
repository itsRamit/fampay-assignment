import 'package:url_launcher/url_launcher.dart';
import 'package:card_app/models/BgImageModel.dart';
import 'package:card_app/models/CtaModel.dart';
import 'package:flutter/material.dart';

// Helper function to convert hex to Color
Color convertHexToColor(String hexString) {
  final buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}

// Main HC3Card widget
class HC3Card extends StatelessWidget {
  final int height;
  final String formatText;
  final String title;
  final int titleFontSize;
  final String? titleColor;
  final String? description;
  final int descriptionFontSize;
  final String? descriptionColor;
  final Cta? cta;
  final BgImage bgImage;
  final String? url;

  HC3Card({
    required this.height,
    required this.title,
    required this.description,
    required this.formatText,
    required this.titleFontSize,
    required this.descriptionFontSize,
    required this.titleColor,
    required this.descriptionColor,
    required this.cta,
    required this.bgImage,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    // Clean the format text
    String subtitle = formatText.replaceAll(RegExp(r'[\{\}\n]'), '');

    return Container(
      height: height.toDouble(),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xff454AA6),
        image: DecorationImage(
          image: NetworkImage(bgImage.imageUrl),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Title and Subtitle Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: convertHexToColor(titleColor!),
                    fontSize: titleFontSize.toDouble(),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: titleFontSize.toDouble(),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),

            // Description Section
            Text(
              description != ''
                  ? description!
                  : "This is a sample text for the subtitle that you can add to contextual cards",
              style: TextStyle(
                color: convertHexToColor(descriptionColor!),
                fontSize: descriptionFontSize.toDouble(),
              ),
            ),

            // Call-to-Action Button
            ElevatedButton(
              onPressed: () async {
                try {
                  // Launch the URL
                  if (await canLaunch(url!)) {
                    await launch(url!);
                  } else {
                    throw 'Could not launch URL';
                  }
                } catch (e) {
                  // Catch any errors and print them
                  print('Error launching URL: $e');
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: convertHexToColor(cta!.bgColor),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
              child: Text(
                cta!.text.isEmpty ? 'Action' : cta!.text,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
