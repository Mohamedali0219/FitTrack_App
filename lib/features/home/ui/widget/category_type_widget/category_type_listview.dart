import 'package:fit_track_app/features/category/logic/category_bloc/category_cubit.dart';
import 'package:fit_track_app/features/category/logic/category_bloc/category_state.dart';
import 'package:fit_track_app/features/home/ui/widget/category_type_widget/category_type_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryTypeListview extends StatelessWidget {
  const CategoryTypeListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        else if (state is CategoryLoaded) {
          return SizedBox(
            height: 110,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.categories.length,
              itemBuilder: (context, index) {
                final category = state.categories[index];
                return CategoryTypeItems(categoryName:category);
              },
            ),
          );
        }
        else if (state is CategoryError) {
          return Center(child: Text('Error: ${state.message}'));
        }
        return Container();
      },
    );
  }
}
