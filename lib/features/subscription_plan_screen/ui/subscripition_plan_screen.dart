import 'package:fit_track_app/core/helper/Extension/navigation_extension.dart';
import 'package:fit_track_app/core/themes/colors_manager.dart';
import 'package:fit_track_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class SubscriptionPlanScreen extends StatelessWidget {
  const SubscriptionPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.topLeft,
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: 350,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/subscription.png'),
                      fit: BoxFit.fill),
                ),
              ),
              IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: ColorsManager.blackColor,
                  size: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 17,),
          SizedBox(
            height: MediaQuery.sizeOf(context).height - 400,
            child: ListView(
              children: [
                const Center(
                  child: Text(
                    'Subscription Plan',
                    style: TextStyle(
                      color: Color(0xFF070707),
                      fontSize: 22,
                      fontFamily: 'BebasNeue',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                const Center(
                  child: Text(
                    'It is a long established fact that a reader \nwill be distracted by the readable',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF3A4750),
                      fontSize: 12,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 25,
                        width: 25,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      const Text(
                        'Create your training plan',
                        style: TextStyle(
                          color: ColorsManager.textBaseColor,
                          fontSize: 12,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 25,
                        width: 25,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      const Text(
                        'Lorem Ipsum is simply dummy text of printing',
                        style: TextStyle(
                          color: ColorsManager.textBaseColor,
                          fontSize: 12,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 25,
                        width: 25,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      const Text(
                        'Lorem Ipsum is simply dummy text of printing',
                        style: TextStyle(
                          color: ColorsManager.textBaseColor,
                          fontSize: 12,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 25,
                        width: 25,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      const Text(
                        'Lorem Ipsum is simply dummy text of printing',
                        style: TextStyle(
                          color: ColorsManager.textBaseColor,
                          fontSize: 12,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        height: 125,
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.grey[300],
                          border: Border.all(color: ColorsManager.primaryColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Standard',
                              style: TextStyle(
                                color: ColorsManager.textBaseColor,
                                fontSize: 12,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 20.0,),
                            Text(
                              'Yearly',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF3A4750),
                                fontSize: 12,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 5.0,),
                            Text(
                              '\$6.99',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: ColorsManager.textBaseColor,
                                fontSize: 16,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 125,
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: ColorsManager.primaryColor.withOpacity(0.2),
                          border: Border.all(color: ColorsManager.primaryColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Popular',
                              style: TextStyle(
                                color: ColorsManager.textBaseColor,
                                fontSize: 12,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 20.0,),
                            Text(
                              'Yearly',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF3A4750),
                                fontSize: 12,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 5.0,),
                            Text(
                              '\$29.99',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: ColorsManager.textBaseColor,
                                fontSize: 16,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 125,
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.grey[300],
                          border: Border.all(color: ColorsManager.primaryColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Premium',
                              style: TextStyle(
                                color: ColorsManager.textBaseColor,
                                fontSize: 12,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 20.0,),
                            Text(
                              'Life-Time',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF3A4750),
                                fontSize: 12,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 5.0,),
                            Text(
                              '\$49.99',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: ColorsManager.textBaseColor,
                                fontSize: 16,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: defaultButton(onPressed: (){}, text: 'Go Premium', fontSize: 20, radius: 8,),
                ),
                const Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 264,
                    height: 38,
                    child: Text(
                      'We bring the most deserving ones to flattery with just a hate payment of \$199 those who are softened and corrupted by present pleasures\n',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF696969),
                        fontSize: 10,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
