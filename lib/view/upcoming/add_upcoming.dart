import 'package:flutter/material.dart';
import 'package:football_scoreboard/common/common_button.dart';
import 'package:football_scoreboard/common/common_textfield.dart';
import 'package:football_scoreboard/constant/app_color.dart';
import 'package:football_scoreboard/constant/app_font_family.dart';
import 'package:football_scoreboard/constant/team_a_logo.dart';
import 'package:football_scoreboard/constant/team_b_logo.dart';
import 'package:football_scoreboard/controller/upcoming_controller.dart';
import 'package:football_scoreboard/model/team_logo_model.dart';
import 'package:football_scoreboard/model/upcoming_model.dart';
import 'package:provider/provider.dart';

class AddUpcoming extends StatelessWidget {
  final TextEditingController teamAnameController = TextEditingController();
  final TextEditingController teamBnameController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  AddUpcoming({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.darkGrey,
      appBar: AppBar(
        backgroundColor: AppColor.darkGrey,
        foregroundColor: AppColor.white,
        title: Text('Add Upcoming', style: AppFontFamily.txt1),
        centerTitle: true,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 23,
                  vertical: 8,
                ),
                child: Consumer<UpcomingController>(
                  builder: (context, controller, child) {
                    return DropdownButtonFormField<TeamALogoModel>(
                      value: controller.selectedTeamA,
                      dropdownColor: AppColor.darkGrey,
                      decoration: InputDecoration(
                        labelText: 'Select TeamA',
                        labelStyle: AppFontFamily.txtField,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: AppColor.accentGreen),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: AppColor.accentGreen),
                        ),
                      ),
                      items: teamAList.map((teamA) {
                        return DropdownMenuItem<TeamALogoModel>(
                          value: teamA,
                          child: Row(
                            children: [
                              Image.network(
                                teamA.logoUrlA!,
                                width: 30,
                                height: 30,
                              ),

                              SizedBox(height: 10),

                              Text(teamA.name!, style: AppFontFamily.txt3),
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        if (value == null) return;

                        controller.setTeamA(value);

                        teamAnameController.text = value.name!;
                      },
                    );
                  },
                ),
              ),

              SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 23,
                  vertical: 8,
                ),
                child: Consumer<UpcomingController>(
                  builder: (context, controller, child) {
                    return DropdownButtonFormField<TeamBLogoModel>(
                      value: controller.selectedTeamB,
                      dropdownColor: AppColor.black70,
                      decoration: InputDecoration(
                        labelText: 'Select TeamB',
                        labelStyle: AppFontFamily.txtField,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: AppColor.accentGreen),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: AppColor.accentGreen),
                        ),
                      ),
                      items: teamBList.map((teamB) {
                        return DropdownMenuItem<TeamBLogoModel>(
                          value: teamB,
                          child: Row(
                            children: [
                              Image.network(
                                teamB.logoUrlB!,
                                width: 30,
                                height: 30,
                              ),

                              SizedBox(height: 10),

                              Text(teamB.name!, style: AppFontFamily.txt3),
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        if (value == null) return;

                        controller.setTeamB(value);

                        teamBnameController.text = value.name!;
                      },
                    );
                  },
                ),
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

              SizedBox(height: 10),
            ],
          ),
          Column(
            children: [
              Consumer<UpcomingController>(
                builder: (context, controller, child) {
                  return CommonButton(
                    onPressed: () async {
                      final model = UpcomingModel(
                        teamALogo: controller.selectedTeamA?.logoUrlA,
                        teamAName: teamAnameController.text.trim(),
                        teamBLogo: controller.selectedTeamB?.logoUrlB,
                        teamBName: teamBnameController.text.trim(),
                        time: timeController.text.trim(),
                      );

                      await controller.addUpcomingMatch(model);

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
