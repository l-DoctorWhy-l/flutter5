import 'package:flutter/material.dart';
import '../models/player_model.dart';
import 'player_row.dart';

class PlayerTable extends StatelessWidget {
  final List<Player> players;
  final ValueChanged<String> onDelete;

  const PlayerTable({
    Key? key,
    required this.players,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (players.isEmpty) {
      return const Center(
        child: Text('В команде пока нет игроков.'),
      );
    }

    return ListView.builder(
      itemCount: players.length,
      itemBuilder: (context, index) {
        final player = players[index];
        return PlayerRow(
          key: ValueKey(player.id),
          player: player,
          onDelete: onDelete,
        );
      },
    );
  }
}
