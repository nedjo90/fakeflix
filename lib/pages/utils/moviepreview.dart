import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movie_explorer/models/moviepreviewpagemodel.dart';
import 'package:movie_explorer/pages/utils/moviepreviewcard.dart';
import 'package:movie_explorer/provider/homepagepositionprovider.dart';
import 'package:movie_explorer/services/movie_service.dart';
import 'package:provider/provider.dart';


class MoviePreview extends StatefulWidget {
  const MoviePreview({super.key});

  @override
  State<MoviePreview> createState() => MoviePreviewState();
}

class MoviePreviewState extends State<MoviePreview> {
  final PagingController<int, dynamic> _pagingController = PagingController(
      firstPageKey: 1);

  final ScrollController _controller = ScrollController();

  _scrollListener()
  {
    if (_controller.hasClients && Provider.of<HomePagePositionProvider>(context, listen: false).position != _controller.offset) {
      Provider.of<HomePagePositionProvider>(context, listen: false).changePosition(_controller.offset);
    }
  }

  @override
  void initState() {
    setState(() {
      _pagingController.addPageRequestListener((pageKey) {
        _fetchPage(pageKey);
      });
      _controller.addListener(_scrollListener);
    });
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback( (_) {
      _controller.jumpTo(Provider.of<HomePagePositionProvider>(context, listen: false).position);
    });
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      dynamic response = await MovieService.readMovies(pageKey);
      MoviePreviewPageModel page = MoviePreviewPageModel.fromJson(response.data);
      final isLastPage = page.page == page.totalPages;
      if (isLastPage) {
        _pagingController.appendLastPage(page.listOfMovies);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(page.listOfMovies, nextPageKey);
      }
    }
    catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
  RefreshIndicator(
    onRefresh: () => Future.sync(
          () => _pagingController.refresh(),
    ),
    child: PagedListView<int, dynamic>.separated(
      scrollController: _controller,
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<dynamic>(
        animateTransitions: true,
        itemBuilder: (_, item, index) => MoviePreviewCard(movie: item)
      ),
      separatorBuilder: (_, index) => const SizedBox.shrink(),
    ),
  );
}
