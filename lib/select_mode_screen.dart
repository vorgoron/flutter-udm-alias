import 'package:flutter/material.dart';
import 'package:udm_alias_app/game_controller.dart';
import 'package:udm_alias_app/game_settings_screen.dart';
import 'package:udm_alias_app/word_list.dart';

class SelectModeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Секытлыксэ быръе'),
        ),
        body: Container(
          child: ListView(
            children: [
              Card(
                child: ListTile(
                  title: Text('Каньыл'),
                  leading: Image.asset("assets/images/level1.png", width: 55,),
                  subtitle: Text('${easyWords.length} кыл'),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        GameController.getInstance().setWordList(easyWords);
                        return GameSettingsScreen();
                      },
                    ));
                  },
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('Шоро-куспо'),
                  leading: Image.asset("assets/images/level2.png", width: 55,),
                  subtitle: Text('${mediumWords.length} кыл'),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        GameController.getInstance().setWordList(mediumWords);
                        return GameSettingsScreen();
                      },
                    ));
                  },
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('Секыт'),
                  leading: Image.asset("assets/images/level3.png"),
                  subtitle: Text('${hardWords.length} кыл'),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        GameController.getInstance().setWordList(hardWords);
                        return GameSettingsScreen();
                      },
                    ));
                  },
                ),
              ),
              // Card(
              //   child: ListTile(
              //     title: Text('Визьпог'),
              //     leading: Image.asset("assets/images/level4.png"),
              //     subtitle: Text('${hardestWords.length} кыл'),
              //     onTap: () {
              //       Navigator.of(context).push(MaterialPageRoute(
              //         builder: (context) {
              //           GameController.getInstance().setWordList(hardestWords);
              //           return GameSettingsScreen();
              //         },
              //       ));
              //     },
              //   ),
              // ),
            ],
          ),
        ));
  }
}
