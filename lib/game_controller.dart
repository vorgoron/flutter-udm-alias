import 'package:udm_alias_app/team.dart';
import 'package:udm_alias_app/word.dart';

class GameController {
  static GameController _instance;
  // game settings:
  double scoreToWin = 45;
  double timeForTeam = 60;
  bool minusNegativeScore = true;

  List<Word> _words;
  List<Word> get words => _words;
  List<Team> teams;
  int _currentTeamIndex = 0;
  int get currentTeamIndex => _currentTeamIndex;

  static GameController getInstance() {
    if (_instance == null) {
      _instance = GameController();
    }
    return _instance;
  }

  void reset() {
    _currentTeamIndex = 0;
  }

  Team getFirstTeam() {
    return teams[0];
  }

  Team getNextTeam() {
    _currentTeamIndex++;
    if (_currentTeamIndex == teams.length) {
      _currentTeamIndex = 0;
    }
    return teams[_currentTeamIndex];
  }

  Future<bool> isCurrentTeamWin() async {
    return teams[_currentTeamIndex].score >= scoreToWin;
  }

  setWordList(List<String> words) {
    _words = words.map((e) => Word(e)).toList();
  }

  List<Word> getRandomWords() {
    List<Word> result = List();
    result.addAll(words.where((element) => !element.isUsed));
    result.shuffle();
    return result;
  }
}