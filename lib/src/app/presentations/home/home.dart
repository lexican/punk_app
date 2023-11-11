import 'package:flutter/material.dart';
import 'package:motopay_assessment_test/src/app/data/models/punk.dart';
import 'package:motopay_assessment_test/src/app/presentations/home/home_view_model.dart';
import 'package:motopay_assessment_test/src/app/widgets/punk_app_bar/punk_app_bar.dart';
import 'package:motopay_assessment_test/src/app/widgets/punk_item/punk_item.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onViewModelReady: (model) {
        model.onViewModelReady();
      },
      builder: (context, model, child) => Scaffold(
        appBar: const PunkAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: CustomScrollView(
            slivers: [
              SliverGrid(
                key: const PageStorageKey<String>('listview'),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 4),
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 170,
                  crossAxisCount: 3,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    Punk punk = model.punks[index];
                    return PunkItem(
                      punk: punk,
                    );
                  },
                  childCount: model.punks.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
