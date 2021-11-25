import 'package:elementary/elementary.dart';
import 'package:elementary_weather_flutter/service/model/location.dart';
import 'package:flutter/material.dart';

import 'select_address_wm.dart';
import 'widgets/hightlighted_text.dart';
import 'widgets/search_text_field.dart';

class SelectAddressScreen extends ElementaryWidget<SelectAddressWM> {
  const SelectAddressScreen({Key? key})
      : super(createSelectAddressWM, key: key);

  @override
  Widget build(SelectAddressWM wm) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 40),
          SearchTextField(
            controller: wm.controller,
          ),
          Expanded(
            child: ValueListenableBuilder<List<Location>>(
              valueListenable: wm.predictions,
              builder: (_, data, __) {
                return data.isEmpty
                    ? const Text('Not found')
                    : ListView(
                        children: data
                            .map((e) => GestureDetector(
                                  onTap: () => wm.onTapLocation(e),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 32,
                                      vertical: 12,
                                    ),
                                    child: HighlightedText(
                                      text: e.title,
                                      matcher: wm.controller.text,
                                    ),
                                  ),
                                ))
                            .toList(),
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
