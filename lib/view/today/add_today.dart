import 'package:flutter/material.dart';
import 'package:football_scoreboard/common/common_button.dart';
import 'package:football_scoreboard/common/common_textfield.dart';
import 'package:football_scoreboard/constant/app_color.dart';
import 'package:football_scoreboard/constant/app_font_family.dart';
import 'package:football_scoreboard/controller/today_controller.dart';
import 'package:football_scoreboard/model/today_model.dart';
import 'package:provider/provider.dart';

class AddToday extends StatelessWidget {
  final TextEditingController teamAController = TextEditingController();
  final TextEditingController teamBController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  AddToday({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.darkGrey,
      appBar: AppBar(
        backgroundColor: AppColor.darkGrey,
        foregroundColor: AppColor.white,
        title: Text('Today', style: AppFontFamily.txt1),
        centerTitle: true,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              SizedBox(height: 10),

              CommonTextfield(
                txt: 'TeamA',
                controller: teamAController,
                obsecureTxt: false,
              ),

              SizedBox(height: 10),

              CommonTextfield(
                txt: 'TeamB',
                controller: teamBController,
                obsecureTxt: false,
              ),

              SizedBox(height: 10),

              GestureDetector(
                onTap: () async {
                  final TimeOfDay? pickedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                    builder: (context, child) {
                      return Theme(
                        data: ThemeData.dark().copyWith(
                          timePickerTheme: TimePickerThemeData(
                            dayPeriodColor: AppColor.accentGreen,
                            dayPeriodTextColor: AppColor.white,
                            backgroundColor: AppColor.darkGrey,
                            hourMinuteTextColor: AppColor.white,
                            dialHandColor: AppColor.accentGreen,
                            dialBackgroundColor: AppColor.black70,
                          ),
                          colorScheme: ColorScheme.dark(
                            primary: AppColor.accentGreen,
                            onPrimary: AppColor.darkGrey,
                            onSurface: AppColor.white,
                          ),
                        ),
                        child: child!,
                      );
                    },
                  );

                  if (pickedTime != null) {
                    timeController.text = pickedTime.format(context);
                  }
                },
                child: AbsorbPointer(
                  child: CommonTextfield(
                    txt: 'Time',
                    controller: timeController,
                    obsecureTxt: false,
                  ),
                ),
              ),

              SizedBox(height: 10,),

            ],
          ),
          Column(
            children: [
              Consumer<TodayController>(
                builder: (context, controller, child) {
                  return CommonButton(
                    onPressed: () async {
                      final model = TodayModel(
                        teamA: teamAController.text.trim(),
                        teamB: teamBController.text.trim(),
                        time: timeController.text.trim(),
                      );

                      await controller.addMatch(model);

                      Navigator.pop(context);
                    },
                    txt: 'Save',
                  );
                },
              ),

              SizedBox(height: 40),
            ],
          ),
        ],
      ),
    );
  }
}
