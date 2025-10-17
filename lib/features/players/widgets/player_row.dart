import 'package:flutter/material.dart';
import '../models/player_model.dart';

class PlayerRow extends StatelessWidget {
  final Player player;
  final ValueChanged<String> onDelete;

  const PlayerRow({
    Key? key,
    required this.player,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(player.id),
      direction: DismissDirection.endToStart,
      onDismissed: (_) => onDelete(player.id),
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(player.jerseyNumber.toString()),
        ),
        title: Text(player.fullName),
        subtitle: Text('Возраст: ${player.age}'),
      ),
    );
  }
}
