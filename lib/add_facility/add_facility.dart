import 'package:findrecycler/add_facility/widgets/add_facility_btn.dart';
import 'package:findrecycler/add_facility/widgets/image_card.dart';
import 'package:findrecycler/app_level/constants/constants.dart';
import 'package:findrecycler/app_level/models/dropdown_data.dart';
import 'package:findrecycler/app_level/models/freezed/facility.dart';
import 'package:findrecycler/app_level/styles/colors.dart';
import 'package:findrecycler/app_level/utilities/screen_size.dart';
import 'package:findrecycler/app_level/widgets/dropdown.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddFacilityScreen extends StatelessWidget {
  const AddFacilityScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //

    return ChangeNotifierProvider<CenterFormData>(
      create: (_) => CenterFormData(),
      child: Consumer<CenterFormData>(
        builder: (_, formModel, child) {
          //
          return Scaffold(
            appBar: AppBar(title: const Text('Add Facility')),
            bottomNavigationBar: AddFacilityButton(model: formModel),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  //PHOTO TITLE
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'Facility Photo',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  ImageCard(model: formModel),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: AppColors.backgroundGrey,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Name of Facility',
                        border: InputBorder.none,
                      ),
                      onChanged: (val) => formModel.name = val,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: AppColors.backgroundGrey,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    height: ScreenQueries.instance
                        .customHeightPercent(context, 0.15),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      maxLines: 2,
                      decoration: InputDecoration(
                        hintText: 'Facility Address',
                        alignLabelWithHint: false,
                        border: InputBorder.none,
                      ),
                      onChanged: (val) => formModel.address = val,
                    ),
                  ),
                  const SizedBox(height: 8),

                  ChangeNotifierProvider<DropdownValue>(
                    create: (_) => DropdownValue(),
                    child: Consumer<DropdownValue>(
                      builder: (_, value, child) {
                        final _model = value;

                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            color: AppColors.backgroundGrey,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: AppDropDown(
                            hintText: AppLevelConstants.dpDwnDefault,
                            items: AppLevelConstants.dpDwnOptions,
                            onChange: (val) {
                              _model.changeDropDownValue(val);
                              formModel.type = val;
                            },
                            value: _model.currentValue,
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
