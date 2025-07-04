import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:balance_chart/balance_chart.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shmr_finance/core/bloc/bank_account/bank_account_cubit.dart';
import 'package:shmr_finance/domain/models/account/account.dart';
import 'package:shmr_finance/domain/models/account_update_request/account_update_request.dart';
import 'package:shmr_finance/l10n/app_localizations.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  bool _hidden = true;
  bool _editMode = false;
  late TextEditingController _nameController;
  StreamSubscription<UserAccelerometerEvent>? _shakeSub;
  DateTime? _lastShake;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _initSensors();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
    _shakeSub?.cancel();
  }

  void _initSensors() async {
    final info = DeviceInfoPlugin();
    await info.deviceInfo; // ensure plugin initialized
    _shakeSub = userAccelerometerEvents.listen((event) {
      final gX = event.x / 9.80665;
      final gY = event.y / 9.80665;
      final gZ = event.z / 9.80665;
      final gForce = sqrt(gX * gX + gY * gY + gZ * gZ);
      if (gForce > 2.7) {
        final now = DateTime.now();
        if (_lastShake == null || now.difference(_lastShake!) > const Duration(milliseconds: 800)) {
          _lastShake = now;
          setState(() => _hidden = !_hidden);
        }
      }
    });
  }

  String _symbol(String code) {
    switch (code) {
      case 'USD':
        return '\$';
      case 'EUR':
        return '€';
      case 'RUB':
        return '₽';
      default:
        return code;
    }
  }

  Future<void> _deleteAccount(Account acc) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(AppLocalizations.of(context)!.deleteAccount),
        content: Text(AppLocalizations.of(context)!.confirmDeleteAccount),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(MaterialLocalizations.of(context).cancelButtonLabel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(MaterialLocalizations.of(context).okButtonLabel),
          ),
        ],
      ),
    );
    if (confirm == true) {
      await context.read<BankAccountCubit>().delete();
    }
  }

  Future<void> _editCurrency(Account acc) async {
    final result = await showModalBottomSheet<String>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      clipBehavior: Clip.antiAlias,
      builder: (context) {
        final theme = Theme.of(context);
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 8),
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: theme.dividerColor,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 16),
              ListTile(
                leading: Text(' ₽', style: theme.textTheme.headlineSmall),
                title: const Text('Российский рубль'),
                onTap: () => Navigator.pop(context, 'RUB'),
              ),
              ListTile(
                leading: const Icon(Icons.attach_money),
                title: const Text('Американский доллар'),
                onTap: () => Navigator.pop(context, 'USD'),
              ),
              ListTile(
                leading: const Icon(Icons.euro),
                title: const Text('Евро'),
                onTap: () => Navigator.pop(context, 'EUR'),
              ),
              ListTile(
                tileColor: theme.colorScheme.error,
                leading: const Icon(Icons.close),
                title: Text(
                  'Отмена'
                ),
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      },
    );
    if (result != null && result != acc.currency) {
      context.read<BankAccountCubit>().update(
        AccountUpdateRequest(
          name: acc.name,
          balance: acc.balance,
          currency: result,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          leading: _editMode
              ? IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => setState(() => _editMode = false),
          )
              : null,
          title: Text(AppLocalizations.of(context)!.account),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.primary,
          actions: [
            IconButton(
              icon: Icon(_editMode ? Icons.check : Icons.edit_outlined),
              onPressed: () {
                if (_editMode) {
                  final cubit = context.read<BankAccountCubit>();
                  final acc = cubit.state;
                  if (acc != null) {
                    cubit.update(
                      AccountUpdateRequest(
                        name: _nameController.text.trim(),
                        balance: acc.balance,
                        currency: acc.currency,
                      ),
                    );
                  }
                  setState(() => _editMode = false);
                } else {
                  final acc = context.read<BankAccountCubit>().state;
                  if (acc != null) {
                    _nameController.text = acc.name;
                    setState(() => _editMode = true);
                  }
                }
              },
            ),
          ],
        ),
        body: BlocBuilder<BankAccountCubit, Account?>(builder: (context, acc) {
          if (acc == null) {
            return Center(child: Text(AppLocalizations.of(context)!.noAccount));
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: _editMode
                    ? TextField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: AppLocalizations.of(context)!.name),
                )
                    : Text(
                  acc.name,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              if (!_editMode) const Divider(height: 0, color: Colors.grey),
              ListTile(
                tileColor: Theme.of(context).colorScheme.secondary,
                title: Text(AppLocalizations.of(context)!.balance),
                trailing: GestureDetector(
                  onTap: () => setState(() => _hidden = !_hidden),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    switchInCurve: Curves.easeIn,
                    switchOutCurve: Curves.easeOut,
                    transitionBuilder: (child, animation) => FadeTransition(
                      opacity: animation,
                      child: child,
                    ),
                    child: _hidden
                        ? ClipRect(
                      key: const ValueKey('blurred'),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 1.0),
                        child: Container(
                          alignment: Alignment.center,
                          width: 80,
                          height: 24,
                          color: Colors.transparent,
                          child: Text(
                            acc.balance,
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.transparent),
                          ),
                        ),
                      ),
                    )
                        : Text(
                      acc.balance,
                      key: const ValueKey('visible'),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
              ),
              if (_editMode)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.error,
                      ),
                      onPressed: () => _deleteAccount(acc),
                      child: Text(
                        AppLocalizations.of(context)!.deleteAccount,
                        style: TextStyle(color: Theme.of(context).colorScheme.onError),
                      ),
                    ),
                  ),
                ),
              if (!_editMode) const Divider(height: 0, color: Colors.grey),
              if (!_editMode)
                ListTile(
                  tileColor: Theme.of(context).colorScheme.secondary,
                  title: Text(AppLocalizations.of(context)!.currency),
                  trailing: Text(_symbol(acc.currency), style: const TextStyle(fontSize: 18)),
                  onTap: () => _editCurrency(acc),
                ),
              if (!_editMode) const Divider(height: 0, color: Colors.grey),
              if (!_editMode)
                SizedBox(
                  height: 300,
                  child: Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: BalanceChartView(
                        daysLabel: AppLocalizations.of(context)!.days,
                        monthsLabel: AppLocalizations.of(context)!.months,
                      ),
                    ),
                  ),
                ),
            ],
          );
        }),
      ),
    );
  }
}
