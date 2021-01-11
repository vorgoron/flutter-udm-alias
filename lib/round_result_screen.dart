import 'package:flutter/material.dart';
import 'package:udm_alias_app/game_controller.dart';
import 'package:udm_alias_app/start_game.dart';
import 'package:udm_alias_app/team.dart';
import 'package:udm_alias_app/word.dart';

import 'constants.dart';
import 'final_screen.dart';

class RoundResultScreen extends StatefulWidget {
  @override
  _RoundResultScreenState createState() => _RoundResultScreenState();
  GameController _gameController = GameController.getInstance();
  Team team;
  List<Word> words;

  RoundResultScreen(Team this.team, List<Word> this.words);
}

class _RoundResultScreenState extends State<RoundResultScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  var tabs = [
    Tab(
      text: "Счётэз воштыны",
    ),
    Tab(
      text: 'Баллъёс',
    )
  ];
  List<Word> _words;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: tabs.length);
    _words = widget.words.where((element) => element.isUsed).toList();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          leading: Container(),
          bottom: TabBar(
            controller: _tabController,
            tabs: tabs,
          ),
          centerTitle: true,
          title: Text(widget.team.title),
        ),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(controller: _tabController, children: [
                Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        Text('Командалэн баллъёсыз', style: mediumFontStyle),
                        Spacer(),
                        Text(
                          widget.team.score.toString(),
                          style: mediumFontStyle,
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _words.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              height: 50,
                              child: Row(
                                children: [
                                  Text(
                                    _words[index].value,
                                    style: mediumFontStyle,
                                  ),
                                  Spacer(),
                                  IconButton(
                                      iconSize: 30,
                                      icon: Icon(
                                        _words[index].isKnown
                                            ? Icons.star
                                            : Icons.star_border,
                                        color: Colors.orange,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _words[index].isKnown =
                                              !_words[index].isKnown;
                                          if (_words[index].isKnown) {
                                            if (widget._gameController
                                                .minusNegativeScore) {
                                              widget.team.score += 2;
                                            } else {
                                              widget.team.score++;
                                            }
                                          } else {
                                            if (widget._gameController
                                                .minusNegativeScore) {
                                              widget.team.score -= 2;
                                            } else {
                                              widget.team.score--;
                                            }
                                          }
                                        });
                                      })
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ]),
                Column(children: [
                  // Row(
                  //   children: [Text('Командалэн нимыз'), Text(widget.team.score.toString())],
                  // ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: widget._gameController.teams.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              height: 50,
                              child: Row(
                                children: [
                                  Text(
                                    widget._gameController.teams[index].title,
                                    style: mediumFontStyle,
                                  ),
                                  Spacer(),
                                  Text(widget._gameController.teams[index].score
                                      .toString())
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ]),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: RaisedButton(
                onPressed: () {
                  if (widget.team.score >= widget._gameController.scoreToWin) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => FinalScreen(widget.team),
                    ));
                  } else {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => StartGame(widget._gameController.getNextTeam()),
                    ));
                  }
                },
                child: Text(
                  'Азьлань'.toUpperCase(),
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
