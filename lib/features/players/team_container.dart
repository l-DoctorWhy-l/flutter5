import 'package:flutter/material.dart';
import 'models/player_model.dart';
import 'screens/player_list_screen.dart';
import 'screens/player_form_screen.dart';

enum _Screen { list, form }

class TeamContainer extends StatefulWidget {
  const TeamContainer({Key? key}) : super(key: key);

  @override
  State<TeamContainer> createState() => _TeamContainerState();
}

class _TeamContainerState extends State<TeamContainer> {
  _Screen _currentScreen = _Screen.list;
  final List<Player> _players = [];

  void _addPlayer(String fullName, int age, int jerseyNumber) {
    final newPlayer = Player(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      fullName: fullName,
      age: age,
      jerseyNumber: jerseyNumber,
    );
    setState(() {
      _players.add(newPlayer);
      _currentScreen = _Screen.list;
    });
  }

  void _deletePlayer(String id) {
    final playerIndex = _players.indexWhere((p) => p.id == id);
    if (playerIndex == -1) return;

    final deletedPlayer = _players[playerIndex];
    
    setState(() {
      _players.removeAt(playerIndex);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${deletedPlayer.fullName} удален.'),
        action: SnackBarAction(
          label: 'Отмена',
          onPressed: () {
            setState(() {
              _players.insert(playerIndex, deletedPlayer);
            });
          },
        ),
      ),
    );
  }

  void _showList() {
    setState(() {
      _currentScreen = _Screen.list;
    });
  }

  void _showForm() {
    setState(() {
      _currentScreen = _Screen.form;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screen;
    switch (_currentScreen) {
      case _Screen.list:
        screen = PlayerListScreen(
          players: _players,
          onDelete: _deletePlayer,
          onAdd: _showForm,
        );
        break;
      case _Screen.form:
        screen = PlayerFormScreen(
          onSave: _addPlayer,
          onCancel: _showList,
        );
        break;
    }

    return Scaffold(
      body: screen,
    );
  }
}
