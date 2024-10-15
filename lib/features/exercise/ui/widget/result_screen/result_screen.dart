import 'package:fit_track_app/core/helper/Extension/navigation_extension.dart';
import 'package:fit_track_app/core/themes/colors_manager.dart';
import 'package:fit_track_app/core/widgets/custom_appbar.dart';
import 'package:fit_track_app/core/widgets/custom_button.dart';
import 'package:fit_track_app/features/home/ui/home_screen.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Result',
        isback: true,
        onPressed: () => context.pop(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Workout',
              style: TextStyle(
                color: ColorsManager.textBaseColor,
                fontSize: 16,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 10.0,),
            const Text(
              'Exercises with Sitting Dumbbells',
              style: TextStyle(
                color: ColorsManager.textBaseColor,
                fontSize: 12,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12.0,),
            const Text(
              'Completed on 24/02/2022',
              style: TextStyle(
                color: Color(0xFF3A4750),
                fontSize: 10,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 11.0,),
            const Text(
              'Exercise 3/12',
              style: TextStyle(
                color: Color(0xFF3A4750),
                fontSize: 10,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 24.0,),
            const Text(
              'Workout summary',
              style: TextStyle(
                color: ColorsManager.textBaseColor,
                fontSize: 16,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 20.0,),
            Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Chip(
                 backgroundColor: Colors.grey[300],
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(8),
                   side: BorderSide(color: Colors.grey[300] ?? Colors.transparent),
                 ),
                 label: const Column(
                   children: [
                     Text(
                       'Total time',
                       style: TextStyle(
                         color: Color(0xFF303841),
                         fontSize: 16,
                         fontFamily: 'Montserrat',
                         fontWeight: FontWeight.w600,
                       ),
                     ),
                     SizedBox(height: 10,),
                     Text(
                       '00:45 min',
                       style: TextStyle(
                         color: Color(0xFF191919),
                         fontSize: 16,
                         fontFamily: 'Montserrat',
                         fontWeight: FontWeight.w500,
                       ),
                     ),
                   ],
                 ),
               ),
               Chip(
                 backgroundColor: Colors.grey[300],
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(8),
                   side: BorderSide(color: Colors.grey[300] ?? Colors.transparent),
                 ),
                 label: const Column(
                   children: [
                     Text(
                       'Total calories',
                       style: TextStyle(
                         color: Color(0xFF303841),
                         fontSize: 16,
                         fontFamily: 'Montserrat',
                         fontWeight: FontWeight.w600,
                       ),
                     ),
                     SizedBox(height: 10,),
                     Text(
                       '120 kcal',
                       style: TextStyle(
                         color: Color(0xFF191919),
                         fontSize: 16,
                         fontFamily: 'Montserrat',
                         fontWeight: FontWeight.w500,
                       ),
                     ),
                   ],
                 ),
               ),
             ],
            ),
            const SizedBox(height: 25.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Chip(
                  backgroundColor: Colors.grey[300],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(color: Colors.grey[300] ?? Colors.transparent),
                  ),
                  label: const Column(
                    children: [
                      Text(
                        'Total weight',
                        style: TextStyle(
                          color: Color(0xFF303841),
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        '59kg',
                        style: TextStyle(
                          color: Color(0xFF191919),
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Chip(
                  backgroundColor: Colors.grey[300],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(color: Colors.grey[300] ?? Colors.transparent),
                  ),
                  label: const Column(
                    children: [
                      Text(
                        'Heart rate',
                        style: TextStyle(
                          color: Color(0xFF303841),
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        '115 bmp',
                        style: TextStyle(
                          color: Color(0xFF191919),
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            defaultButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen(),),);}, text: 'Save', fontSize: 22)
          ],
        ),
      ),
    );
  }
}
