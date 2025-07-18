import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../core/bloc/bank_account/bank_account_cubit.dart';
import '../../core/bloc/category/category_cubit.dart';
import '../../domain/models/category/category.dart';
import '../../domain/models/transaction_response/transaction_response.dart';
import '../../l10n/app_localizations.dart';

class TransactionFormScreen extends StatefulWidget {
  final TransactionResponse? transaction;
  final bool isIncome;

  const TransactionFormScreen({super.key, this.transaction, required this.isIncome});

  @override
  State<TransactionFormScreen> createState() => _TransactionFormScreenState();
}

class _TransactionFormScreenState extends State<TransactionFormScreen> {
  int? _accountId;
  Category? _category;
  late DateTime _date;
  late TextEditingController _amountController;
  late TextEditingController _commentController;

  @override
  void initState() {
    super.initState();
    final tx = widget.transaction;
    _amountController = TextEditingController(text: tx?.amount ?? '');
    _commentController = TextEditingController(text: tx?.comment ?? '');
    _date = tx?.transactionDate ?? DateTime.now();
    _accountId = tx?.account.id;
    _category = tx?.category;
    context.read<CategoryCubit>().loadByType(widget.isIncome);
  }

  @override
  void dispose() {
    _amountController.dispose();
    _commentController.dispose();
    super.dispose();
  }

  String get _separator {
    final locale = Localizations.localeOf(context).toLanguageTag();
    final format = NumberFormat.decimalPattern(locale);
    return format.symbols.DECIMAL_SEP;
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      locale: Localizations.localeOf(context),
    );
    if (picked != null) setState(() => _date = picked);
  }

  Future<void> _selectAccount() async {
    final acc = context.read<BankAccountCubit>().state;
    if (acc == null) return;
    final result = await showModalBottomSheet<int>(
      context: context,
      builder: (_) => SafeArea(
        child: ListTile(
          title: Text(acc.name),
          onTap: () => Navigator.pop(context, acc.id),
        ),
      ),
    );
    if (result != null) setState(() => _accountId = result);
  }

  Future<void> _selectCategory() async {
    final categories = context.read<CategoryCubit>().state;
    if (categories.isEmpty) return;
    final result = await showModalBottomSheet<Category>(
      context: context,
      builder: (_) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Theme.of(context).dividerColor,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 16),
            ...categories.map(
                  (c) => ListTile(
                leading: Text(c.emoji, style: const TextStyle(fontSize: 20)),
                title: Text(c.name),
                onTap: () => Navigator.pop(context, c),
              ),
            ),
          ],
        ),
      ),
    );
    if (result != null) setState(() => _category = result);
  }

  void _save() {
    final amount = _amountController.text.trim();
    final comment = _commentController.text.trim();
    if (_accountId == null || _category == null || amount.isEmpty || comment.isEmpty) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          content: Text(AppLocalizations.of(context)!.fillAllFields),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(MaterialLocalizations.of(context).okButtonLabel),
            ),
          ],
        ),
      );
      return;
    }
    Navigator.pop(context); // логику сохранения потом добавим
  }

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context).toLanguageTag();
    final sep = _separator;
    return SafeArea(
      top: true,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          primary: true,
          toolbarHeight: 100,
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.primary,
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            widget.transaction == null
                ? AppLocalizations.of(context)!.createOperation
                : AppLocalizations.of(context)!.editOperation,
          ),
          actions: [
            IconButton(
                onPressed: _save,
                icon: Icon(Icons.check))
          ],
        ),
        body: ListView(
          primary: true,
          children: [
            ListTile(
              tileColor: Theme.of(context).colorScheme.secondary,
              title: Text(AppLocalizations.of(context)!.account),
              trailing: Text(
                _accountId?.toString() ?? '',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              onTap: _selectAccount,
            ),
            Divider(
              height: 0,
              color: Theme.of(context).colorScheme.outlineVariant,
            ),
            ListTile(
              tileColor: Theme.of(context).colorScheme.secondary,
              title: Text(AppLocalizations.of(context)!.category),
              trailing: Text(
                _category?.name ?? '',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              onTap: _selectCategory,
            ),
            Divider(
              height: 0,
              color: Theme.of(context).colorScheme.outlineVariant,
            ),
            ListTile(
              tileColor: Theme.of(context).colorScheme.secondary,
              title: Text(AppLocalizations.of(context)!.date),
              trailing: Text(
                DateFormat.yMd(locale).format(_date),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              onTap: _pickDate,
            ),
            Divider(
              height: 0,
              color: Theme.of(context).colorScheme.outlineVariant,
            ),
            Container(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  controller: _amountController,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    TextInputFormatter.withFunction((oldValue, newValue) {
                      final reg = RegExp('^[0-9]*(${RegExp.escape(sep)}[0-9]*)?');
                      if (!reg.hasMatch(newValue.text)) return oldValue;
                      if (newValue.text.split(sep).length > 2) return oldValue;
                      return newValue;
                    }),
                  ],
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.sum,
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
            ),
            Divider(
              height: 0,
              color: Theme.of(context).colorScheme.outlineVariant,
            ),
            Container(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  controller: _commentController,
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.comment,
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
            ),
            Divider(
              height: 0,
              color: Theme.of(context).colorScheme.outlineVariant,
            ),
          ],
        ),
      ),
    );
  }
}
