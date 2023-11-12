import 'package:flutter/material.dart';
import 'package:motopay_assessment_test/src/app/data/models/punk.dart';
import 'package:motopay_assessment_test/src/app/presentations/home/home_view_model.dart';
import 'package:motopay_assessment_test/src/app/widgets/loader/loader.dart';
import 'package:motopay_assessment_test/src/app/widgets/no_internet/no_internet.dart';
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
        body: model.isLoading
            ? const Loader()
            : (model.errorMessage.isNotEmpty && model.punks.isEmpty)
                ? NoInternet(
                    retry: model.fetchPunks,
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: CustomScrollView(
                      slivers: [
                        SliverGrid(
                          key: const PageStorageKey<String>('listview'),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio:
                                MediaQuery.of(context).size.width /
                                    (MediaQuery.of(context).size.height / 4),
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 10,
                            mainAxisExtent: 170,
                            crossAxisCount: 3,
                          ),
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              Punk punk = model.punks[index];
                              if (index == model.punks.length - 3 &&
                                  !model.isLoadingMore &&
                                  !model.hasReachedMax) {
                                WidgetsBinding.instance.addPostFrameCallback(
                                  (_) {
                                    if (model.errorMessage.isEmpty) {
                                      model.fetchPunks();
                                    }
                                  },
                                );
                              }
                              return PunkItem(
                                punk: punk,
                              );
                            },
                            childCount: model.punks.length,
                          ),
                        ),
                        const SliverToBoxAdapter(
                          child: SizedBox(height: 12),
                        ),
                        if (model.isLoadingMore)
                          const SliverToBoxAdapter(
                            child: Loader(),
                          ),
                        if (model.errorMessage.isNotEmpty &&
                            !model.isLoadingMore &&
                            model.punks.isNotEmpty)
                          SliverToBoxAdapter(
                            child: Center(
                              child: TextButton(
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    const RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                    ),
                                  ),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.blue),
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                ),
                                onPressed: () {
                                  model.fetchPunks();
                                },
                                child: const Text(
                                  'Retry',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
      ),
    );
  }
}
