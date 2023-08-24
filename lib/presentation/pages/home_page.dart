import 'package:flutter/material.dart';
import 'package:flutter_application/domain/entities/movie_entity.dart';
import 'package:flutter_application/domain/repositories/movie_repository.dart';
import 'package:flutter_application/presentation/widgets/movie_item_widget.dart';
import 'package:flutter_stream_paging/fl_stream_paging.dart';
import 'package:get_it/get_it.dart';

import '../../data/data_sources/local/list_view_data_source.dart';

class HomePage extends StatefulWidget {
  static const path = 'HomePage';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ListViewDataSource dataSource;
  MovieRepository movieRepository = GetIt.instance.get();

  @override
  void initState() {
    super.initState();
    dataSource = ListViewDataSource(movieRepository);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular list'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: PagingGridView<int, MovieEntity>(
          builderDelegate: PagedChildBuilderDelegate<MovieEntity>(
            itemBuilder: (context, data, child, onUpdate, onDelete) {
              return MovieItemWidget(item: data);
            },
          ),
          pageDataSource: dataSource,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 100 / 150,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            crossAxisCount: 2,
          ),
          errorBuilder: (_, err) => SizedBox(
            child: Center(
              child: Text(err.toString()),
            ),
          ),
          invisibleItemsThreshold: 3,

        ),
      ),
    );
  }
}
