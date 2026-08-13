import 'package:flutter/material.dart';
import 'package:contact_app/model/pessoa.dart';

class PessoaWidget extends StatelessWidget {
  final Pessoa entity;
  final ValueChanged<Pessoa> onClick;
  final ValueChanged<Pessoa> onEdit;
  final ValueChanged<Pessoa> onDelete;

  const PessoaWidget({
    super.key,
    required this.entity,
    required this.onClick,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: InkWell(
        onTap: () => onClick(entity),
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: theme.colorScheme.primary,
                foregroundColor: theme.colorScheme.onPrimary,
                child: const Icon(Icons.person),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  entity.nome,
                  style: theme.textTheme.titleLarge,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              IconButton(
                tooltip: 'Editar pessoa',
                onPressed: () => onEdit(entity),
                icon: const Icon(Icons.edit),
              ),
              IconButton(
                tooltip: 'Excluir pessoa',
                onPressed: () => onDelete(entity),
                icon: const Icon(Icons.delete_outline),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
