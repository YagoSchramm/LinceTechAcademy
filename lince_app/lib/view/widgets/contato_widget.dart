import 'package:flutter/material.dart';
import 'package:contact_app/model/contato.dart';

class ContatoWidget extends StatelessWidget {
  final Contato entity;
  final ValueChanged<Contato> onClick;
  final ValueChanged<Contato> onEdit;
  final ValueChanged<Contato> onDelete;

  const ContatoWidget({
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
                backgroundColor: theme.colorScheme.secondary,
                foregroundColor: theme.colorScheme.onSecondary,
                child: const Icon(Icons.contact_phone),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      entity.tipoContato,
                      style: theme.textTheme.titleLarge,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      entity.contato,
                      style: theme.textTheme.bodyMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              IconButton(
                tooltip: 'Editar contato',
                onPressed: () => onEdit(entity),
                icon: const Icon(Icons.edit),
              ),
              IconButton(
                tooltip: 'Excluir contato',
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
