import 'package:flutter/material.dart';
import '../models/player_model.dart';
import '../widgets/player_table.dart';

class PlayerListScreen extends StatelessWidget {
  final List<Player> players;
  final ValueChanged<String> onDelete;
  final VoidCallback onAdd;

  const PlayerListScreen({
    Key? key,
    required this.players,
    required this.onDelete,
    required this.onAdd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Состав команды'),
      ),
      body: PlayerTable(
        players: players,
        onDelete: onDelete,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onAdd,
        child: const Icon(Icons.add),
      ),
    );
  }
}
