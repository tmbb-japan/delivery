import 'package:delivery/common/model/cursor_pagination_model.dart';
import 'package:delivery/restaurant/model/restaurant_model.dart';
import 'package:delivery/restaurant/repository/restaurant_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final restaurantProvider =
    StateNotifierProvider<RestaurantStateNotifier, CursorPaginationBase>(
  (ref) {
    final repository = ref.watch(RestaurantRepositoryProvider);
    final notifier = RestaurantStateNotifier(repository: repository);

    return notifier;
  },
);

class RestaurantStateNotifier extends StateNotifier<CursorPaginationBase> {
  final RestaurantRepository repository;
  RestaurantStateNotifier({
    required this.repository,
  }) : super(CursorPaginationLoading()) {
    paginate();
  }

  paginate() async {
    final resp = await repository.paginate();

    state = resp;
  }
}
