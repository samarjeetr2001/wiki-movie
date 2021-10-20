import 'package:assignment/app/home/domain/entity/movie_detail_entity.dart';
import 'package:assignment/core/app_theme/app_theme.dart';
import 'package:assignment/core/app_theme/core_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MovieDetailView extends StatefulWidget {
  final MovieDetailEntity movieDetailEntity;
  const MovieDetailView({Key? key, required this.movieDetailEntity})
      : super(key: key);

  @override
  _MovieDetailViewState createState() => _MovieDetailViewState();
}

class _MovieDetailViewState extends State<MovieDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 600,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    widget.movieDetailEntity.metaData.posterUrl,
                  ),
                ),
              ),
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Container(
                    width: double.infinity,
                    height: 220,
                    padding: const EdgeInsets.all(CoreTheme.spaceSizeMedium),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: CoreTheme.backGroundColor.withOpacity(0.95),
                          blurRadius: 200,
                          offset: const Offset(0, 20),
                          spreadRadius: 100,
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.movieDetailEntity.metaData.title,
                          style: AppTheme.textStyleTitle,
                        ),
                        const SizedBox(height: CoreTheme.spaceSizeMedium),
                        Text(
                          widget.movieDetailEntity.genre,
                          style: AppTheme.textStyleNormal.copyWith(
                              color: CoreTheme.textColor.withOpacity(.6)),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 30,
                    left: 20,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                            color: CoreTheme.primaryColor.withOpacity(.8),
                            borderRadius: const BorderRadius.all(
                                Radius.circular(CoreTheme.spaceSizeMedium))),
                        child: Center(
                          child: SvgPicture.asset(
                              'assets/images/eva_arrow-ios-back-fill.svg'),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: const BoxDecoration(
                            color: CoreTheme.primaryColor,
                            borderRadius: BorderRadius.all(
                                Radius.circular(CoreTheme.spaceSizeMedium))),
                        child: Center(
                          child:
                              SvgPicture.asset('assets/images/Vector 27.svg'),
                        ),
                      ),
                      Container(
                        width: 70,
                        height: 70,
                        decoration: const BoxDecoration(
                            color: CoreTheme.primaryColor,
                            borderRadius: BorderRadius.all(
                                Radius.circular(CoreTheme.spaceSizeMedium))),
                        child: Center(
                          child: SvgPicture.asset('assets/images/Path-1.svg'),
                        ),
                      ),
                      Container(
                        width: 70,
                        height: 70,
                        decoration: const BoxDecoration(
                            color: CoreTheme.primaryColor,
                            borderRadius: BorderRadius.all(
                                Radius.circular(CoreTheme.spaceSizeMedium))),
                        child: Center(
                          child: SvgPicture.asset('assets/images/Path.svg'),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(CoreTheme.spaceSizeMedium),
              margin: const EdgeInsets.all(CoreTheme.spaceSizeMedium),
              decoration: const BoxDecoration(
                color: CoreTheme.primaryColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    CoreTheme.spaceSizeMedium,
                  ),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      for (int i = 0;
                          i <
                              widget.movieDetailEntity.metaData.imdbRating
                                  .floor();
                          i += 2)
                        SvgPicture.asset('assets/images/Star 1.svg'),
                      if (widget.movieDetailEntity.metaData.imdbRating % 2 != 0)
                        const Icon(
                          Icons.star_half,
                          color: CoreTheme.secondaryColor,
                        ),
                      Expanded(child: Container()),
                      Text(
                        widget.movieDetailEntity.metaData.imdbRating.toString(),
                        style: AppTheme.textStyleSmall
                            .copyWith(color: CoreTheme.secondaryColor),
                      ),
                    ],
                  ),
                  for (int i = 0;
                      i < widget.movieDetailEntity.ratings.length;
                      i++)
                    Padding(
                      padding:
                          const EdgeInsets.only(top: CoreTheme.spaceSizeMedium),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.movieDetailEntity.ratings[i].source,
                            style: AppTheme.textStyleSmall,
                          ),
                          Text(
                            widget.movieDetailEntity.ratings[i].value,
                            style: AppTheme.textStyleSmall,
                          ),
                        ],
                      ),
                    )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(CoreTheme.spaceSizeMedium),
              margin: const EdgeInsets.all(CoreTheme.spaceSizeMedium),
              decoration: const BoxDecoration(
                color: CoreTheme.primaryColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    CoreTheme.spaceSizeMedium,
                  ),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('assets/images/Group 357.svg'),
                      const SizedBox(width: CoreTheme.spaceSizeMedium),
                      Text(
                        widget.movieDetailEntity.releasedYear.toString(),
                        style: AppTheme.textStyleSmall,
                      ),
                    ],
                  ),
                  const SizedBox(height: CoreTheme.spaceSizeMedium),
                  Row(
                    children: [
                      SvgPicture.asset('assets/images/Vector.svg'),
                      const SizedBox(width: CoreTheme.spaceSizeMedium),
                      Text(
                        widget.movieDetailEntity.country.toString(),
                        style: AppTheme.textStyleSmall,
                      ),
                    ],
                  ),
                  const SizedBox(height: CoreTheme.spaceSizeMedium),
                  Row(
                    children: [
                      SvgPicture.asset('assets/images/Group 356.svg'),
                      const SizedBox(width: CoreTheme.spaceSizeMedium),
                      Text(
                        '${widget.movieDetailEntity.metaData.duration.hours * 60 + widget.movieDetailEntity.metaData.duration.minutes} Min',
                        style: AppTheme.textStyleSmall,
                      ),
                    ],
                  ),
                  const SizedBox(height: CoreTheme.spaceSizeMedium),
                  Row(
                    children: [
                      SvgPicture.asset('assets/images/Group 357.svg'),
                      const SizedBox(width: CoreTheme.spaceSizeMedium),
                      Flexible(
                        child: Text(
                          widget.movieDetailEntity.language,
                          style: AppTheme.textStyleSmall,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(CoreTheme.spaceSizeMedium),
              margin: const EdgeInsets.all(CoreTheme.spaceSizeMedium),
              decoration: const BoxDecoration(
                color: CoreTheme.primaryColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    CoreTheme.spaceSizeMedium,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Plot',
                    style: AppTheme.textStyleHeading,
                  ),
                  const SizedBox(height: CoreTheme.spaceSizeMedium),
                  Text(
                    widget.movieDetailEntity.plot,
                    style: AppTheme.textStyleSmall,
                  ),
                  const SizedBox(height: CoreTheme.spaceSizeLarge),
                  Text(
                    'Director',
                    style: AppTheme.textStyleHeading,
                  ),
                  const SizedBox(height: CoreTheme.spaceSizeMedium),
                  Wrap(
                    direction: Axis.horizontal,
                    children: [
                      for (int i = 0;
                          i < widget.movieDetailEntity.director.length;
                          i++)
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: CoreTheme.spaceSizeSmall,
                              vertical: CoreTheme.spaceSizeSmall),
                          margin: const EdgeInsets.symmetric(
                              vertical: CoreTheme.spaceSizeSmall,
                              horizontal: CoreTheme.spaceSizeSmall),
                          decoration: BoxDecoration(
                            color: CoreTheme.textColor.withOpacity(0.3),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(
                                CoreTheme.spaceSizeSmall,
                              ),
                            ),
                          ),
                          child: Text(
                            widget.movieDetailEntity.director[i],
                            style: AppTheme.textStyleSmall,
                          ),
                        )
                    ],
                  ),
                  const SizedBox(height: CoreTheme.spaceSizeLarge),
                  Text(
                    'Actors',
                    style: AppTheme.textStyleHeading,
                  ),
                  const SizedBox(height: CoreTheme.spaceSizeMedium),
                  Wrap(
                    direction: Axis.horizontal,
                    children: [
                      for (int i = 0;
                          i < widget.movieDetailEntity.actors.length;
                          i++)
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: CoreTheme.spaceSizeSmall,
                              vertical: CoreTheme.spaceSizeSmall),
                          margin: const EdgeInsets.symmetric(
                              vertical: CoreTheme.spaceSizeSmall,
                              horizontal: CoreTheme.spaceSizeSmall),
                          decoration: BoxDecoration(
                            color: CoreTheme.textColor.withOpacity(0.3),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(
                                CoreTheme.spaceSizeSmall,
                              ),
                            ),
                          ),
                          child: Text(
                            widget.movieDetailEntity.actors[i],
                            style: AppTheme.textStyleSmall,
                          ),
                        )
                    ],
                  ),
                  const SizedBox(height: CoreTheme.spaceSizeLarge),
                  Text(
                    'Writer',
                    style: AppTheme.textStyleHeading,
                  ),
                  const SizedBox(height: CoreTheme.spaceSizeMedium),
                  Wrap(
                    direction: Axis.horizontal,
                    children: [
                      for (int i = 0;
                          i < widget.movieDetailEntity.writers.length;
                          i++)
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: CoreTheme.spaceSizeSmall,
                              vertical: CoreTheme.spaceSizeSmall),
                          margin: const EdgeInsets.symmetric(
                              vertical: CoreTheme.spaceSizeSmall,
                              horizontal: CoreTheme.spaceSizeSmall),
                          decoration: BoxDecoration(
                            color: CoreTheme.textColor.withOpacity(0.3),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(
                                CoreTheme.spaceSizeSmall,
                              ),
                            ),
                          ),
                          child: Text(
                            widget.movieDetailEntity.writers[i],
                            style: AppTheme.textStyleSmall,
                          ),
                        )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
