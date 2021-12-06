import 'package:elementary/elementary.dart';
import 'package:elementary_weather_flutter/service/model/location.dart';
import 'package:elementary_weather_flutter/theme/app_typography.dart';
import 'package:elementary_weather_flutter/ui/select_address_screen/widgets/location_tile.dart';
import 'package:flutter/material.dart';

import 'select_address_wm.dart';
import 'widgets/search_text_field.dart';

class SelectAddressScreen extends ElementaryWidget<SelectAddressWM> {
  const SelectAddressScreen({Key? key})
      : super(createSelectAddressWM, key: key);

  @override
  Widget build(SelectAddressWM wm) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 80),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text('Weather', style: AppTypography.header),
          ),
          const SizedBox(height: 30),
          SearchTextField(controller: wm.searchFieldController),
          Expanded(
            child: ValueListenableBuilder<List<Location>>(
              valueListenable: wm.predictions,
              builder: (_, data, __) {
                return data.isEmpty
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Please change searching request',
                            style: AppTypography.body,
                          ),
                        ],
                      )
                    : SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (final location in data)
                              LocationTile(
                                location: location,
                                requestString: wm.searchFieldController.text,
                                onClick: wm.onTapLocation,
                              ),
                          ],
                        ),
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
