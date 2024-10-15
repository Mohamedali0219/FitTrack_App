import 'dart:async';

import 'package:fit_track_app/core/themes/colors_manager.dart';
import 'package:fit_track_app/core/widgets/custom_button.dart';
import 'package:fit_track_app/features/exercise/ui/widget/result_screen/result_screen.dart';
import 'package:flutter/material.dart';

class TrainingTimeScreen extends StatefulWidget {
  const TrainingTimeScreen({super.key});

  @override
  State<TrainingTimeScreen> createState() => _TrainingTimeScreenState();
}

class _TrainingTimeScreenState extends State<TrainingTimeScreen> {
  late Timer _timer;
  int _start = 1800; // 60 minutes in seconds (60 * 60)
  bool isRunning = false;

  void startTimer() {
    if (isRunning) return; // Prevent multiple timers from being started
    isRunning = true;
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            isRunning = false;
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  void stopTimer() {
    if (_timer.isActive) {
      _timer.cancel();
    }
    setState(() {
      isRunning = false;
    });
  }

  void resetTimer(int seconds) {
    stopTimer();
    setState(() {
      _start = seconds;
      startTimer(); // Optionally, restart the timer immediately after reset
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    int minutes = _start ~/ 60;
    int seconds = _start % 60;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 380,
            width: MediaQuery.sizeOf(context).width,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              image: DecorationImage(
                image: AssetImage('assets/images/exercise2.png'),
                fit: BoxFit.cover
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height - 503,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(
                children: [
                  const Text(
                    'Exercise 3/12',
                    style: TextStyle(
                      color: Color(0xFF3A4750),
                      fontSize: 10,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 5,),
                  const Text(
                    'Stretching Workout Length',
                    style: TextStyle(
                      color: ColorsManager.textBaseColor,
                      fontSize: 22,
                      fontFamily: 'BebasNeue',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 30,),
                  Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          height: 80,
                          width: 80,
                          child: CircularProgressIndicator(
                            value: seconds / minutes,
                            valueColor: const AlwaysStoppedAnimation(ColorsManager.blackColor),
                            strokeWidth: 8,
                            backgroundColor: Colors.grey[300],
                          ),
                        ),
                        Text(
                          '$minutes:${seconds.toString().padLeft(2, '0')}',
                          style: const TextStyle(
                            color: ColorsManager.textBaseColor,
                            fontSize: 14,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      defaultButton(
                        onPressed: (){
                          stopTimer();
                        },
                        text: 'Stop',
                        fontSize: 14,
                        radius: 8,
                        textColor: ColorsManager.textBaseColor,
                        height: 50,
                        width: 100,
                        background: Colors.white,
                        broder: ColorsManager.textBaseColor,
                      ),
                      defaultButton(
                        onPressed: (){
                          resetTimer(_start);
                        },
                        text: 'Next Training',
                        fontSize: 20,
                        radius: 8,
                        textColor: ColorsManager.whiteColor,
                        height: 50,
                        width: 170,
                        background: ColorsManager.primaryColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: defaultButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const ResultScreen(),),);}, text: 'Finish', fontSize: 22),
      ),
    );
  }
}