import 'package:ecom_clean_architecture/config/routes/route_constant.dart';
import 'package:ecom_clean_architecture/core/utils/colors.dart';
import 'package:ecom_clean_architecture/core/utils/extensions.dart';
import 'package:ecom_clean_architecture/core/widget/app_bar.dart';
import 'package:ecom_clean_architecture/features/categories/presentation/bloc/categories/categories_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StreetMarketCategoriesScreen extends StatefulWidget {
  const StreetMarketCategoriesScreen({super.key});

  @override
  State<StreetMarketCategoriesScreen> createState() =>
      _StreetMarketCategoriesScreenState();
}

class _StreetMarketCategoriesScreenState
    extends State<StreetMarketCategoriesScreen> {
  @override
  void initState() {
    context.read<CategoriesBloc>().add(const CategoriesLoadedEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPicker.primaryColor1,
      appBar: StreetMarketAppBar.appBar(title: 'Categories'),
      body: BlocBuilder<CategoriesBloc, CategoriesState>(
        builder: (context, state) {
          if (state is CategoriesLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CategoriesLoadedState) {
            return ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                itemBuilder: (context, index) {
                  var category = state.categories[index];
                  return GestureDetector(
                    onTap: () => Navigator.of(context)
                        .pushNamed(RouteConstant.category, arguments: category),
                    child: Container(
                      height: context.height * 0.1,
                      decoration: BoxDecoration(
                        color: ColorPicker.whiteColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            width: 1.5, color: ColorPicker.primaryColor4),
                      ),
                      child: Center(
                        child: Text(
                          category.toCamelCase(),
                          style: const TextStyle(
                            fontSize: 17,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                itemCount: state.categories.length);
          }
          return Container();
        },
      ),
    );
  }
}
