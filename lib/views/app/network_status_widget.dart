import 'package:flutter/material.dart';
import 'package:shmr_finance/l10n/app_localizations.dart';

class NetworkStatusWidget extends StatelessWidget {
  final bool online;
  const NetworkStatusWidget({super.key, required this.online});

  @override
  Widget build(BuildContext context) {
    final text = online
        ? AppLocalizations.of(context)!.onlineMode
        : AppLocalizations.of(context)!.offlineMode;
    final color = online ? Colors.green : Colors.red;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(color: Colors.white),
      ),
    );
  }
}