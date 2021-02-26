import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:udm_alias_app/game_controller.dart';
import 'package:udm_alias_app/team_screen.dart';

import 'constants.dart';

class GameSettingsScreen extends StatefulWidget {
  @override
  _GameSettingsScreenState createState() => _GameSettingsScreenState();
}

class _GameSettingsScreenState extends State<GameSettingsScreen> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  GameController _gameController = GameController.getInstance();

  @override
  void initState() {
    super.initState();
    _prefs.then((prefs) {
      if (prefs.containsKey(scoreToWinKey)) {
        setState(() {
          _gameController.scoreToWin = prefs.getDouble(scoreToWinKey);
        });
      }
      if (prefs.containsKey(timeForTeamKey)) {
        setState(() {
          _gameController.timeForTeam = prefs.getDouble(timeForTeamKey);
        });
      }
      if (prefs.containsKey(minusScoreKey)) {
        setState(() {
          _gameController.minusNegativeScore = prefs.getBool(minusScoreKey);
        });
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Шудонлэн пуктэтъёсыз'),
      ),
      body: Container(
          margin: EdgeInsets.all(20),
          child: Column(children: [
            Row(
              children: [
                Text(
                  'Вормон понна баллъёс',
                  style: TextStyle(fontSize: 16),
                ),
                Spacer(),
                Text(_gameController.scoreToWin.round().toString())
              ],
            ),
            Slider(
              value: _gameController.scoreToWin,
              min: 10,
              max: 100,
              onChanged: (double value) {
                setState(() {
                  _gameController.scoreToWin = value;
                  _prefs.then((pref) async =>
                    {await pref.setDouble(scoreToWinKey, value)});
                });
              },
            ),
            Row(
              children: [
                Text('Кӧня дыр сётӥське командалы (сек.)',
                    style: TextStyle(fontSize: 16)),
                Spacer(),
                Text(_gameController.timeForTeam.round().toString())
              ],
            ),
            Slider(
              value: _gameController.timeForTeam,
              min: 20,
              max: 120,
              onChanged: (double value) {
                setState(() {
                  _gameController.timeForTeam = value;
                  _prefs.then((pref) async =>
                      {await pref.setDouble(timeForTeamKey, value)});
                });
              },
            ),
            SwitchListTile(
                title: Text('Тодымтэ кыл понна баллэз кулэсмытоно'),
                value: _gameController.minusNegativeScore,
                onChanged: (bool value) {
                  setState(() {
                    _gameController.minusNegativeScore = value;
                    _prefs.then((pref) async =>
                        {await pref.setBool(minusScoreKey, value)});
                  });
                }),
            SwitchListTile(
                title: Text('Ӟуч кылэ берыктонъёсты адӟытоно'),
                value: _gameController.showTranslations,
                onChanged: (bool value) {
                  setState(() {
                    _gameController.showTranslations = value;
                    _prefs.then((pref) async =>
                        {await pref.setBool(showTranslations, value)});
                  });
                }),
            Spacer()
          ])),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return TeamScreen();
            },
          ));
        },
      ),
    );
  }

  void _savePref(String scoreToWinKey, double value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble(scoreToWinKey, value);
  }
}
