import 'package:flutter/material.dart';
import 'package:football_scoreboard/common/common_button.dart';
import 'package:football_scoreboard/common/common_textfield.dart';
import 'package:football_scoreboard/constant/app_color.dart';
import 'package:football_scoreboard/constant/app_font_family.dart';
import 'package:football_scoreboard/constant/team_data.dart';
import 'package:football_scoreboard/controller/league_controller.dart';
import 'package:football_scoreboard/model/league_model.dart';
import 'package:football_scoreboard/model/team_model.dart';
import 'package:provider/provider.dart';

class AddLeague extends StatefulWidget {
  const AddLeague({super.key});

  @override
  State<AddLeague> createState() => _AddLeagueState();
}

class _AddLeagueState extends State<AddLeague> {
  final TextEditingController placeController = TextEditingController();

  final TextEditingController teamNameController = TextEditingController();

  TeamModel? selectedTeam;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.darkGrey,
      appBar: AppBar(
        backgroundColor: AppColor.darkGrey,
        foregroundColor: AppColor.white,
        title: Text('Add League', style: AppFontFamily.txt1),
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
                child: Consumer<LeagueController>(
                  builder: (context, controller, child) {
                    return DropdownButtonFormField<TeamModel>(
                      value: controller.selectedTeam,
                      dropdownColor: AppColor.black70,
                      decoration: InputDecoration(
                        hintText: 'Select Team',
                        hintStyle: AppFontFamily.txtField,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: AppColor.accentGreen),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: AppColor.accentGreen),
                        ),
                      ),
                      items: teamList.map((team) {
                        return DropdownMenuItem<TeamModel>(
                          value: team,
                          child: Row(
                            children: [
                              Image.network(
                                team.logoUrl!,
                                width: 30,
                                height: 30,
                              ),

                              SizedBox(height: 10),

                              Text(team.name!, style: AppFontFamily.txt3),
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        if (value == null) return;

                        controller.setSelecTeam(value);

                        teamNameController.text = value.name!;
                      },
                    );
                  },
                ),
              ),

              SizedBox(height: 10),

              CommonTextfield(
                txt: 'Place',
                controller: placeController,
                obsecureTxt: false,
              ),
            ],
          ),
          Column(
            children: [
              Consumer<LeagueController>(
                builder: (context, controller, child) {
                  return CommonButton(
                    onPressed: () async {
                      final model = LeagueModel(
                        name: teamNameController.text.trim(),
                        place: placeController.text.trim(),
                        imageUrl: controller.selectedTeam?.logoUrl,
                      );

                      await controller.addLeague(model);

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
