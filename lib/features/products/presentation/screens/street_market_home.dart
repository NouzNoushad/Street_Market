import 'package:ecom_clean_architecture/core/utils/colors.dart';
import 'package:ecom_clean_architecture/core/utils/strings.dart';
import 'package:ecom_clean_architecture/core/widget/app_bar.dart';
import 'package:ecom_clean_architecture/features/products/presentation/screens/components/category_chip.dart';
import 'package:ecom_clean_architecture/core/widget/products_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/products_bloc/products_bloc.dart';

class StreetMarketHomeScreen extends StatefulWidget {
  const StreetMarketHomeScreen({super.key});

  @override
  State<StreetMarketHomeScreen> createState() => _StreetMarketHomeScreenState();
}

class _StreetMarketHomeScreenState extends State<StreetMarketHomeScreen> {
  @override
  void initState() {
    context.read<ProductsBloc>().add(const ProductsLoadedEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPicker.primaryColor1,
      appBar: StreetMarketAppBar.appBar(
        title: AppStrings.appTitle,
      ),
      body: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          if (state is ProductsLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ProductsLoadedState) {
            var categories =
                state.products.map((e) => e.category).toList().toSet().toList();
            return CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.only(top: 10),
                    sliver: SliverToBoxAdapter(
                      child: SizedBox(
                        height: 40,
                        child: ListView.separated(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            scrollDirection: Axis.horizontal,
                            itemCount: categories.length,
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  width: 5,
                                ),
                            itemBuilder: (context, index) {
                              var category = categories[index];
                              return CategoryChip(category: category);
                            }),
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                    sliver: SliverGrid.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.75,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 8),
                        itemCount: state.products.length,
                        itemBuilder: (context, index) {
                          var product = state.products[index];
                          return ProductsCard(
                            product: product,
                          );
                        }),
                  )
                ]);
          }
          return Container();
        },
      ),
    );
  }
}
