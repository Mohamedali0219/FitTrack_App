import 'package:fit_track_app/features/favorite_btn/logic/favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteBtnWidget extends StatefulWidget {
  const FavoriteBtnWidget({
    super.key,
    this.isLocked = false,
    required this.itemId,
  });

  final String itemId;
  final bool isLocked;

  @override
  State<FavoriteBtnWidget> createState() => _FavoriteBtnWidgetState();
}

class _FavoriteBtnWidgetState extends State<FavoriteBtnWidget> {

  @override
  void initState() {
    super.initState();
    context.read<FavoriteCubit>().loadFavoriteStatus(widget.itemId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        if (state is FavoriteLoading) {
          return CircularProgressIndicator();
        } else if (state is FavoriteSuccess) {
          return Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
              shape: BoxShape.rectangle,
            ),
            child: IconButton(
              icon: state.isFavorite
                  ? Icon(
                      Icons.favorite,
                      size: 15,
                      color: Color(0xFFFF6079),
                    )
                  : Icon(
                      Icons.favorite_outline,
                      size: 15,
                      color: Colors.black,
                    ),
              onPressed: () {
                context.read<FavoriteCubit>().toggleFavorite(widget.itemId);
              },
            ),
          );
        } else if (state is FavoriteError) {
          return Icon(Icons.error, color: Colors.red);
        }
        return Container();
      },
    );
  }
}
