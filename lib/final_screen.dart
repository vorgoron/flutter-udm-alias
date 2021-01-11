import 'package:flutter/material.dart';
import 'package:udm_alias_app/constants.dart';
import 'package:udm_alias_app/game_controller.dart';
import 'package:udm_alias_app/home.dart';
import 'package:udm_alias_app/team.dart';

class FinalScreen extends StatefulWidget {
  FinalScreen(this.team);

  Team team;
  final GameController _gameController = GameController.getInstance();

  @override
  _FinalScreenState createState() => _FinalScreenState();
}

class _FinalScreenState extends State<FinalScreen> {
  List<Team> _teams = List();

  @override
  void initState() {
    _teams.addAll(widget._gameController.teams);
    _teams.sort((a, b) => b.score.compareTo(a.score));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
         centerTitle: true,
        title: Text('Шудон быриз'),
      ),
      body: Center(
        child: Column(
          children: [
            Card(

              color: primaryColor,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(children: [
                  Text('Вормиз команда', style: TextStyle(fontSize: 20, color: Colors.white)),
                  Text(widget.team.title,
                    style: TextStyle(fontSize: 30, color: Colors.white,))


                ]),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _teams.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        height: 50,
                        child: Row(
                          children: [
                            Text('${index+1}. ${_teams[index].title}',
                              style: mediumFontStyle,
                            ),
                            Spacer(),
                            Text(_teams[index].score
                                .toString())
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                      builder: (context) {
                        return HomeScreen();
                      },
                    ), (route) => false);
                  },
                  color: primaryColor,
                  child: Text('Доре'.toUpperCase(), style: TextStyle(color: Colors.white),),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ],

        ),
      ),
    );
  }
}
