import 'dart:math';

import 'package:flutter/material.dart';
import 'package:udm_alias_app/game_controller.dart';
import 'package:udm_alias_app/start_game.dart';

import 'constants.dart';
import 'team.dart';

class TeamScreen extends StatefulWidget {
  @override
  _TeamScreenState createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> {
  List<String> title = [
    'Ӟечокъёс',
    'Шутэтскисьёс',
    'Малпаськисьёс',
    'Лудкечъёс',
    'Уӵыос',
    'Парсьпиос',
    'Кионъёс',
    'Гондыръёс',
    'Визьмоос',
    'Перепечьёс',
    'Небыльтокъёс',
    'Ӵушъялъёс',
    'Шундыос',
    'Чеберикъёс',
    'Чукиндер',
  ];
  List<Team> teams = [];
  late GameController _gameController;

  String generateRandomTeam() {
    int randomIndex = Random().nextInt(title.length - 1);
    var result = title[randomIndex];
    title.removeAt(randomIndex);
    return result;
  }

  @override
  void initState() {
    teams.add(Team(generateRandomTeam()));
    teams.add(Team(generateRandomTeam()));
    _gameController = GameController.getInstance();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Командаос'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                if (index == teams.length) {
                  return Visibility(
                    visible: teams.length != 5,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: OutlineButton(
                          onPressed: () {
                            setState(() {
                              teams.add(Team(generateRandomTeam()));
                            });
                          },
                          borderSide: BorderSide(color: primaryColor, width: 2.0),
                          child: Container(
                            padding: EdgeInsets.all(20),
                            child: Icon(Icons.add, color: primaryColor,),
                          )),
                    ),
                  );
                } else {
                  var team = teams[index];
                  var controller = TextEditingController(text: team.title);
                  controller.addListener(() {
                    team.title = controller.text;
                  });
                  var focusNode = FocusNode();
                  return Card(
                      child: Container(
                    padding: EdgeInsets.all(20),
                    child: Row(children: [
                      Expanded(
                        child: TextField(
                          readOnly: team.readOnly,
                          focusNode: focusNode,
                          decoration: null,
                          controller: controller,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          setState(() {
                            team.readOnly = false;
                          });
                          focusNode.requestFocus();
                        },
                      )
                    ]),
                  ));
                }
              },
              itemCount: teams.length + 1,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              _gameController.reset();
              _gameController.teams = teams;
              return StartGame(_gameController.getFirstTeam());
            },
          ));
        },
      ),
    );
  }
}
