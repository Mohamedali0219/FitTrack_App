// category_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:fit_track_app/features/category/logic/services/category_service.dart';


import 'category_event.dart';
import 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryService _categoryService;
  final ImageService _imageService;
  final List<Map<String, dynamic>> _allCategories = [];

  CategoryBloc(this._categoryService, this._imageService) : super(CategoryLoading()) {
    on<FetchCategories>(_onFetchCategories);
  }

  Future<void> _onFetchCategories(FetchCategories event, Emitter<CategoryState> emit) async {
    try {
      emit(CategoryLoading());

      List<Map<String, dynamic>> categories = await _categoryService.getCategories();

      for (var category in categories) {
        String imageUrl = await _imageService.getCategoryImageUrl(category['imagePath']);
        category['imageUrl'] = imageUrl; // Add imageUrl to each category map
      }

      emit(CategoryLoaded(categories));
    } catch (e) {
      emit(CategoryError(e.toString()));
    }
  }

  // Search categories by name
  void searchCategories(String searchTerm) {
    if (searchTerm.isEmpty) {
      emit(CategoryLoaded(_allCategories));
    } else {
      List<Map<String, dynamic>> filteredCategories = _allCategories.where((category) {
        return category['name'].toLowerCase().contains(searchTerm.toLowerCase());
      }).toList();

      emit(CategoryLoaded(filteredCategories));
    }
  }
}
