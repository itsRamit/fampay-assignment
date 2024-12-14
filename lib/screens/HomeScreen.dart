import 'package:card_app/models/HcGroupModel.dart';
import 'package:card_app/services/HcGroupsService.dart';
import 'package:card_app/widgets/HC3Card.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<HcGroup> HcGroups = [];
  List<HcGroup> hcGroupHC3 = [];
  List<HcGroup> hcGroupHC6 = [];
  List<HcGroup> hcGroupHC5 = [];
  List<HcGroup> hcGroupHC9 = [];
  List<HcGroup> hcGroupHC1 = [];
  bool isLoading = false;

  getData() async {
    setState(() {
      isLoading = true;
    });
    HcGroups = await HcGroupsService().getHcGroups();
    setState(() {
      isLoading = false;
    });
  }

  void extractHcGroupsByType() {
    for (var group in HcGroups) {
      if (group.designType == "HC3") {
        hcGroupHC3.add(group);
      } else if (group.designType == "HC6") {
        hcGroupHC6.add(group);
      } else if (group.designType == "HC5") {
        hcGroupHC5.add(group);
      } else if (group.designType == "HC9") {
        hcGroupHC9.add(group);
      } else if (group.designType == "HC1") {
        hcGroupHC1.add(group);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF7F6F3),
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            HC3Card(
              height:HcGroups[0].height,
              formatText: HcGroups[0].cards[0].formattedTitle!.text,
              title: HcGroups[0].cards[0].formattedTitle!.entities[0].text,
              description:
                  HcGroups[0].cards[0].formattedTitle!.entities[1].text,
              titleFontSize:
                  HcGroups[0].cards[0].formattedTitle!.entities[0].fontSize!,
              descriptionFontSize:
                  HcGroups[0].cards[0].formattedTitle!.entities[1].fontSize!,
              titleColor:
                  HcGroups[0].cards[0].formattedTitle!.entities[0].color,
              descriptionColor:
                  HcGroups[0].cards[0].formattedTitle!.entities[1].color,
              cta: HcGroups[0].cards[0].cta?[0],
              bgImage: HcGroups[0].cards[0].bgImage!,
              url: HcGroups[0].cards[0].url,
            )
          ],
        ),
      ),
    );
  }
}
