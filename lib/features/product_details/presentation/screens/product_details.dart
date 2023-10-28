import 'package:ecom_clean_architecture/core/utils/colors.dart';
import 'package:ecom_clean_architecture/core/utils/constant.dart';
import 'package:ecom_clean_architecture/core/utils/extensions.dart';
import 'package:ecom_clean_architecture/core/utils/strings.dart';
import 'package:ecom_clean_architecture/core/widget/app_bar.dart';
import 'package:ecom_clean_architecture/features/carts/domain/entity/carts_entity.dart';
import 'package:ecom_clean_architecture/features/carts/presentation/bloc/carts_bloc/carts_bloc.dart';
import 'package:ecom_clean_architecture/features/product_details/presentation/bloc/product_details/product_details_bloc.dart';
import 'package:ecom_clean_architecture/features/products/presentation/widget/cart_button.dart';
import 'package:ecom_clean_architecture/features/product_details/presentation/screens/components/info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetails extends StatefulWidget {
  final int productId;
  const ProductDetails({super.key, required this.productId});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  void initState() {
    context
        .read<ProductDetailsBloc>()
        .add(ProductDetailsLoadedEvent(widget.productId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPicker.primaryColor1,
      appBar: StreetMarketAppBar.appBar(
          title: AppStrings.detailsTitle, automaticallyImplyLeading: true),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:
          BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
        builder: (context, state) {
          if (state is ProductDetailsLoadedState) {
            return CartButton(
              title: 'Add to Cart',
              onPressed: () {
                CartsEntity cart = CartsEntity(
                  title: state.detailsEntity.title,
                  category: state.detailsEntity.category,
                  image: state.detailsEntity.image,
                  price: state.detailsEntity.price,
                  count: 1,
                );
                context.read<CartsBloc>().add(AddToCartEvent(cart));
                context.toast(message: 'Product Added to Cart');
              },
            );
          }
          return Container();
        },
      ),
      body: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
        builder: (context, state) {
          if (state is ProductDetailsLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ProductDetailsLoadedState) {
            return ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                Container(
                  height: context.height * 0.5,
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                      color: ColorPicker.whiteColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      )),
                  child: state.detailsEntity.image != null
                      ? Image.network(state.detailsEntity.image!)
                      : Container(),
                ),
                sbH(10),
                ProductInfoCard(
                  product: state.detailsEntity,
                ),
                sbH(70),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
