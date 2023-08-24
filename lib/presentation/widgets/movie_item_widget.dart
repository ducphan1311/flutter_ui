import 'package:flutter/material.dart';
import 'package:flutter_application/domain/entities/movie_entity.dart';

class MovieItemWidget extends StatelessWidget {
  const MovieItemWidget({Key? key, required this.item}) : super(key: key);
  final MovieEntity item;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black45,
                  blurRadius: 4,
                  offset: const Offset(0, 4),
                ),
              ]),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: FadeInImage(
              placeholder: NetworkImage(
                  'https://i.gifer.com/origin/34/34338d26023e5515f6cc8969aa027bca_w200.gif'),
              image: NetworkImage(
                  'https://image.tmdb.org/t/p/w500${item.posterPath}'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 4, vertical: 6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(200),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: <Color>[
                              Color(0xffffb56b),
                              Color(0xfff39060),
                              Color(0xffe16b5c),
                            ],
                          ),
                        ),
                        child: Row(
                          children: [
                            for (var i = 0;
                                i <
                                    (item.voteAverage ?? 0)
                                        .toStringAsFixed(1)
                                        .split('.')
                                        .length;
                                i++)
                              if (i == 0)
                                Text(
                                  item.voteAverage!
                                      .toStringAsFixed(i)
                                      .split('.')[i],
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                )
                              else
                                Text(
                                    '.${item.voteAverage!.toStringAsFixed(i).split('.')[i]}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14))
                          ],
                        )),
                  ],
                ),
              ),
              Text(item.releaseDate ?? '',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.white70, fontWeight: FontWeight.w600)),
              Text(
                item.title ?? '',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
