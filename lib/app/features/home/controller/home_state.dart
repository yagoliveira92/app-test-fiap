part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();
}

final class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

final class HomeLoading extends HomeState {
  @override
  List<Object> get props => [];
}

final class HomeLoaded extends HomeState {
  final List<CategoryModel> categories;
  final List<ProductModel> products;

  HomeLoaded({
    required this.categories,
    required this.products,
  });

  @override
  List<Object> get props => [categories, products];
}

final class HomeError extends HomeState {
  final String message;

  HomeError({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
