import 'package:app_test_fiap/app/core/network/response_types/error/response_impl.dart';
import 'package:app_test_fiap/app/core/network/response_types/success/success.dart';
import 'package:app_test_fiap/app/features/home/services/categories/categories_service.dart';
import 'package:app_test_fiap/app/features/home/services/products/products_service.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:app_test_fiap/app/features/home/controller/home_cubit.dart';
import 'package:app_test_fiap/app/features/home/model/category_model.dart';
import 'package:app_test_fiap/app/features/home/model/product_model.dart';

class MockCategoriesService extends Mock implements CategoriesService {}

class MockProductService extends Mock implements ProductsService {}

void main() {
  late HomeCubit homeCubit;
  late MockCategoriesService mockCategoriesService;
  late MockProductService mockProductService;

  setUp(() {
    mockCategoriesService = MockCategoriesService();
    mockProductService = MockProductService();
    homeCubit = HomeCubit(
      categoryService: mockCategoriesService,
      productsService: mockProductService,
    );
  });

  final listProduct = [
    ProductModel(id: 1, nome: 'Product 1', preco: 100.0, imagem: 'image1.jpg'),
  ];

  final listCategory = [
    CategoryModel(id: 1, nome: 'Category 1', imagem: 'image1.jpg'),
  ];

  group('HomeCubit', () {
    test('initial state is HomeInitial', () {
      expect(homeCubit.state, HomeInitial());
    });

    blocTest<HomeCubit, HomeState>(
      'emits [HomeLoading, HomeLoaded] when fetchHomeData is successful',
      build: () {
        when(() => mockCategoriesService.getCategories()).thenAnswer(
          (_) async => (
            result: Success(),
            categories: listCategory,
          ),
        );
        when(() => mockProductService.getProducts()).thenAnswer(
          (_) async => (
            result: Success(),
            products: listProduct,
          ),
        );
        return homeCubit;
      },
      act: (cubit) => cubit.getHomeData(),
      expect: () => [
        HomeLoading(),
        HomeLoaded(
          categories: listCategory,
          products: listProduct,
        ),
      ],
    );

    blocTest<HomeCubit, HomeState>(
      'emits [HomeLoading, HomeError] when fetchHomeData fails',
      build: () {
        when(() => mockCategoriesService.getCategories()).thenAnswer(
          (_) async => (
            result: GeneralFailure(),
            categories: <CategoryModel>[],
          ),
        );
        when(() => mockProductService.getProducts()).thenAnswer(
          (_) async => (
            result: GeneralFailure(),
            products: <ProductModel>[],
          ),
        );
        return homeCubit;
      },
      act: (cubit) => cubit.getHomeData(),
      expect: () => [
        HomeLoading(),
        const HomeError(message: 'Ocorreu um erro. Tente novamente mais tarde'),
      ],
    );
  });
}
