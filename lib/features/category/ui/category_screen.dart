import 'package:fit_track_app/core/helper/Extension/navigation_extension.dart';
import 'package:fit_track_app/core/widgets/custom_appbar.dart';
import 'package:fit_track_app/features/category/logic/category_bloc/category_cubit.dart';
import 'package:fit_track_app/features/category/logic/category_bloc/category_state.dart';
import 'package:fit_track_app/features/home/ui/widget/category_type_widget/category_type_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

TextEditingController _searchController = TextEditingController();

class _CategoryScreenState extends State<CategoryScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Category',
        isback: true,
        onPressed: () {
          context.pop();
        },
      ),
      body: BlocBuilder<CategoryBloc, CategoryState>(builder: (context, state) {
        if (state is CategoryLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is CategoryLoaded) {
          return ListView(
            padding: const EdgeInsets.all(20.0),
            children: [
              TextField(
                controller: _searchController,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  constraints: const BoxConstraints(minHeight: 50.0),
                  filled: true,
                  fillColor: const Color(0xFFF5F5F5),
                  hintText: 'Search',
                  hintStyle: const TextStyle(
                    color: Color(0xFF303841),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                  prefixIcon: const Icon(
                    Icons.search_outlined,
                    color: Colors.black,
                    size: 20,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onChanged: (value) {
                  // Trigger the search when the input changes
                  context.read<CategoryBloc>().searchCategories(value);
                },
              ),
              GridView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: state.categories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (BuildContext context, int index) {
                  final category = state.categories[index];
                  return CategoryTypeItems(
                    categoryName: category,
                  );
                },
              ),
            ],
          );
        } else if (state is CategoryError) {
          return Center(child: Text('Error: ${state.message}'));
        }
        return Container();
      },
      ),
    );
  }
}
