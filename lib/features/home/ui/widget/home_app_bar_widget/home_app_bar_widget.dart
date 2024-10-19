import 'package:fit_track_app/core/helper/Extension/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class HomeAppBarWidget extends StatelessWidget {
  const HomeAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      decoration: const BoxDecoration(
          color: Color(0xFFB0C929),
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(18),
              bottomLeft: Radius.circular(18))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  if (ZoomDrawer.of(context) != null) {
                    ZoomDrawer.of(context)!.toggle();
                  } else {
                    print("ZoomDrawer is not found in the widget tree.");
                  }
                },
                icon: setPhoto(
                  kind: 1,
                  path: 'assets/icons/ic_menu.svg',
                ),
              ),
              Container(
                width: 44,
                height: 44,
                decoration: const ShapeDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://via.placeholder.com/44x44"),
                    fit: BoxFit.fill,
                  ),
                  shape: OvalBorder(),
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: setPhoto(
                  kind: 1,
                  path: 'assets/icons/notification.svg',
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const SizedBox(
            width: 109.50,
            height: 12.51,
            child: Text(
              'Hello, Good Morning',
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            'Youssef !',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'DM Sans',
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: 'Search',
              hintStyle: const TextStyle(
                color: Color(0xFF303841),
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
              prefixIcon: setPhoto(
                kind: 1,
                path: 'assets/icons/search.svg',
                width: 10,
                height: 10,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
