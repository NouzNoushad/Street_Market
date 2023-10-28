import 'package:ecom_clean_architecture/core/utils/colors.dart';
import 'package:ecom_clean_architecture/core/utils/constant.dart';
import 'package:ecom_clean_architecture/core/utils/extensions.dart';
import 'package:ecom_clean_architecture/core/utils/strings.dart';
import 'package:ecom_clean_architecture/core/widget/app_bar.dart';
import 'package:ecom_clean_architecture/features/carts/presentation/bloc/carts_bloc/carts_bloc.dart';
import 'package:ecom_clean_architecture/features/carts/presentation/screens/components/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StreetMarketCartScreen extends StatefulWidget {
  const StreetMarketCartScreen({super.key});

  @override
  State<StreetMarketCartScreen> createState() => _StreetMarketCartScreenState();
}

class _StreetMarketCartScreenState extends State<StreetMarketCartScreen> {
  @override
  void initState() {
    context.read<CartsBloc>().add(const CartsLoadedEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPicker.primaryColor1,
      appBar: StreetMarketAppBar.appBar(
        title: AppStrings.cartTitle,
      ),
      body: BlocBuilder<CartsBloc, CartsState>(
        builder: (context, state) {
          if (state is CartsLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CartsLoadedState) {
            num total = state.carts.fold(0.0, (p, e) => p + e.price!);
            return Column(
              children: [
                Expanded(
                  child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemCount: state.carts.length,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 10),
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 8,
                          ),
                      itemBuilder: (context, index) {
                        var cart = state.carts[index];
                        return CartItem(
                          cart: cart,
                        );
                      }),
                ),
                Container(
                  color: ColorPicker.whiteColor,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Items: ${state.carts.length}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            sbH(4),
                            Text(
                              'Total: \$ $total',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: context.width * 0.4,
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: ColorPicker.primaryColor4),
                            child: const Text('Checkout')),
                      )
                    ],
                  ),
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
