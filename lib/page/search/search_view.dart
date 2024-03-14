import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tin_flutter_book/common/widgets/app.dart';

import '../../common/values/values.dart';
import 'search_logic.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.put(SearchLogic());
    final state = Get.find<SearchLogic>().state;

    return Scaffold(
      appBar: commonAppBar(
        titleWidget: const Text(AStrings.search),
        actions: [
          IconButton(
            onPressed: () {

            },
            icon: const Icon(Icons.delete_forever_outlined),
          ),
        ],
      ),
    );
  }
}
