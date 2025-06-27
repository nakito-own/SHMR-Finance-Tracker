import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shmr_finance/core/bloc/category/category_cubit.dart';
import 'package:shmr_finance/domain/models/category/category.dart';
import 'package:shmr_finance/l10n/app_localizations.dart';

bool _fuzzyMatch(String text, String pattern) {
  text = text.toLowerCase();
  pattern = pattern.toLowerCase();
  int j = 0;
  for (int i = 0; i < text.length && j < pattern.length; i++) {
    if (text[i] == pattern[j]) j++;
  }
  return j == pattern.length;
}

class ArticlesScreen extends StatefulWidget {
  const ArticlesScreen({super.key});

  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  String _query = '';

  @override
  void initState() {
    super.initState();
    context.read<CategoryCubit>().loadAll();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.articles),
          centerTitle: true,
          backgroundColor: ColorScheme.of(context).primary,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.search,
                  prefixIcon: const Icon(Icons.search),
                ),
                onChanged: (value) => setState(() => _query = value),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: BlocBuilder<CategoryCubit, List<Category>>(builder: (context, categories) {
                  final filtered = _query.isEmpty
                      ? categories
                      : categories.where((c) => _fuzzyMatch(c.name, _query)).toList();
                  if (filtered.isEmpty) {
                    return Center(child: Text(AppLocalizations.of(context)!.npOperationsForPeriod));
                  }
                  return ListView.separated(
                    itemCount: filtered.length,
                    separatorBuilder: (_, __) => const Divider(height: 0),
                    itemBuilder: (context, index) {
                      final c = filtered[index];
                      return ListTile(
                        leading: Text(c.emoji, style: const TextStyle(fontSize: 20)),
                        title: Text(c.name),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}