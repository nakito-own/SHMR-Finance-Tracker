import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shmr_finance/core/app_settings_provider.dart';
import 'package:shmr_finance/l10n/app_localizations.dart';

class PinCodeScreen extends StatefulWidget {
  final bool isSetup;
  const PinCodeScreen({super.key, required this.isSetup});

  @override
  State<PinCodeScreen> createState() => _PinCodeScreenState();
}

class _PinCodeScreenState extends State<PinCodeScreen> {
  late TextEditingController _controller;
  String? _error;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final code = _controller.text;
    if (code.length != 4) {
      setState(() => _error = AppLocalizations.of(context)!.fillAllFields);
      return;
    }
    final settings = context.read<AppSettingsProvider>();
    if (widget.isSetup) {
      await settings.setPinCode(code);
    } else {
      if (settings.pinCode != code) {
        setState(() => _error = AppLocalizations.of(context)!.wrongPin);
        return;
      }
    }
    if (mounted) Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isSetup
            ? AppLocalizations.of(context)!.setPin
            : AppLocalizations.of(context)!.enterPin),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              maxLength: 4,
              obscureText: true,
              decoration: InputDecoration(
                errorText: _error,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submit,
              child: Text(AppLocalizations.of(context)!.save),
            )
          ],
        ),
      ),
    );
  }
}