import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fuzzy/fuzzy.dart';
import 'package:shmr_finance/core/bloc/category/category_cubit.dart';
import 'package:shmr_finance/domain/models/category/category.dart';
import 'package:shmr_finance/l10n/app_localizations.dart';

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
        ),
        body: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            children: [
              Container(
                color: ColorScheme.of(context).secondary,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.searchArticles,
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                    ),
                    textAlignVertical: TextAlignVertical.center,
                    onChanged: (value) => setState(() => _query = value),
                  ),
                ),
              ),
              const Divider(height: 0, color: Colors.grey),
              Expanded(
                child: BlocBuilder<CategoryCubit, List<Category>>(
                  builder: (context, categories) {
                    final filtered = _query.isEmpty
                        ? categories
                        : Fuzzy<Category>(
                      categories,
                      options: FuzzyOptions(
                        keys: [
                          WeightedKey<Category>(
                            name: 'name',
                            getter: (c) => c.name,
                            weight: 1,
                          ),
                        ],
                      ),
                    ).search(_query).map((r) => r.item).toList();

                    if (filtered.isEmpty) {
                      return Center(
                        child: Text(AppLocalizations.of(context)!.npOperationsForPeriod),
                      );
                    }

                    return ListView.separated(
                      itemCount: filtered.length,
                      separatorBuilder: (_, __) => const Divider(height: 0, color: Colors.grey),
                      itemBuilder: (context, index) {
                        final c = filtered[index];
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundColor: ColorScheme.of(context).secondary,
                            child: Text(
                              c.emoji,
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                          title: Text(c.name),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
