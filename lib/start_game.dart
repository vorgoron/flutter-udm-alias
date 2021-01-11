import 'package:flutter/material.dart';
import 'package:udm_alias_app/constants.dart';
import 'package:udm_alias_app/game_screen.dart';
import 'package:udm_alias_app/team.dart';

class StartGame extends StatelessWidget {
  Team team;

  StartGame(Team this.team);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(team.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Чиньыеныды выллань яке бур пала шоналтэ кылэз тодӥды ке',
                style: mediumFontStyle,),
               Icon(Icons.keyboard_arrow_up, size: 50,color: Colors.green,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.keyboard_arrow_left, size: 50,color: Colors.red,),
                  SizedBox(
                    height: 175,
                    width: 175,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return GameScreen(team);
                          },
                        ));
                      },
                      child: Text('Кутсконо'.toUpperCase(), style: TextStyle(color: Colors.white, fontSize: 20), ),
                      shape: CircleBorder(),
                      color: primaryColor,

                    ),
                  ),
                  Icon(Icons.keyboard_arrow_right, size: 50,color: Colors.green,)
                ],
              ),
              Icon(Icons.keyboard_arrow_down, size: 50,color: Colors.red,),
              Text('Чиньыеныды уллань яке паллян пала шоналтэ кылэз ӧд тодэ ке',
                  style: mediumFontStyle)
            ],


          ),
        ),
      ),
    );
  }
}
