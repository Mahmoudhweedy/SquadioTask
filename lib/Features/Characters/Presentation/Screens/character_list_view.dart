import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:squadio_task/Features/Characters/Domain/Entities/actor.dart';
import 'package:squadio_task/Features/Characters/Presentation/Provider/actors_provider.dart';

import '../../Domain/Entities/actor.dart';
import '../Widgets/character_list_item.dart';

class ActorsListView extends StatefulWidget {
  const ActorsListView({Key? key}) : super(key: key);

  @override
  State<ActorsListView> createState() => _ActorsListViewState();
}

class _ActorsListViewState extends State<ActorsListView> {
  late ActorsProvider actorsProvider;
  final PagingController<int, Actor> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    actorsProvider = context.read<ActorsProvider>();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await actorsProvider.getAllActors(pageKey);

      final isLastPage = newItems.length < 20;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) => RefreshIndicator(
        onRefresh: () => Future.sync(
          () => _pagingController.refresh(),
        ),
        child: PagedListView<int, Actor>.separated(
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate<Actor>(
            animateTransitions: true,
            itemBuilder: (context, item, index) => CharacterListItem(
              actor: item,
            ),
          ),
          separatorBuilder: (context, index) => const Divider(),
        ),
      );

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
