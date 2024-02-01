import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rehabox/src/models/models.dart';
import 'package:rehabox/src/repositories/repositories.dart';
import 'package:rehabox/src/screens/coupons/controllers/coupons_controllers.dart';
import 'package:rehabox/src/screens/coupons/coupon_item.dart';
import 'package:rehabox/src/utils/conditional_render_manager.dart';
import 'package:rehabox/src/widgets/custom_app_bar.dart';
import 'package:rehabox/src/widgets/extensions/build_context_extensions.dart';
import 'package:rehabox/src/widgets/navigation_bar/custom_nav_bar.dart';
import 'package:rehabox/src/widgets/shimmer_items_list.dart';

class CouponsScreen extends StatelessWidget {
  const CouponsScreen({super.key});

  static const routeName = '/coupons';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CouponsControllers(
        userRepository: context.read<UserRepositoryInterface>(),
      )..getAvailableCoupons(),
      child: Scaffold(
        appBar: const CustomAppBar(
          appBarHeight: 72,
          title: Text(
            'Coupons',
          ),
        ),
        body: Consumer<CouponsControllers>(
          builder: conditionalRenderManager<CouponsControllers>(
            onInitial: (BuildContext context) => const CouponsListView(
              isInitial: true,
            ),
            // onLoading: (BuildContext context) {
            //   return const Center(
            //     child: Column(
            //       children: [
            //         const Text('Pl'),
            //         CircularProgressIndicator(),
            //       ],
            //     ),
            //   );
            // },
            onLoaded: (BuildContext context) => const CouponsListView(),
            onError: (BuildContext context) => Center(
              child: Text(
                'No coupons available',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: context.textScaleFactor(24),
                ),
              ),
            ),
          ),
        ),
        extendBody: true,
        bottomNavigationBar: const CustomNavigationBar(),
      ),
    );
  }
}

class CouponsListView extends StatelessWidget {
  const CouponsListView({
    this.isInitial = false,
    super.key,
  });

  final bool isInitial;

  void Function(BuildContext context) _onCollectCoupon(Coupon coupon) {
    return (BuildContext context) =>
        context.read<CouponsControllers>().collectCoupon(coupon);
  }

  @override
  Widget build(BuildContext context) {
    if (isInitial) {
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.widthPercent(0.03) + 8,
          vertical: context.heightPercent(0.02),
        ),
        child: const ShimmerItemsList(),
      );
    }
    return Selector<CouponsControllers, List<Coupon>>(
      builder: (BuildContext context, List<Coupon> value, Widget? child) {
        if (value.isEmpty) {
          return const Center(
            child: Text('No coupons available'),
          );
        }
        return ListView.separated(
          padding: EdgeInsets.only(
            left: context.widthPercent(0.03) + 8,
            right: context.widthPercent(0.03) + 8,
            top: context.heightPercent(0.02),
            bottom: kBottomNavigationBarHeight * 1.8,
          ),
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: value.length,
          itemBuilder: (BuildContext context, int index) {
            if (value[index].type == CouponType.timer) {
              return TimeDeductedCoupon(
                points: value[index].price.toInt(),
                onCollected: _onCollectCoupon(value[index]),
              );
            }
            return StreakSaverCoupon(
              points: value[index].price.toInt(),
              onCollected: _onCollectCoupon(value[index]),
            );
          },
          separatorBuilder: (BuildContext context, int index) => child!,
        );
      },
      selector: (BuildContext context, CouponsControllers controllers) =>
          controllers.state.availableCoupons,
      child: const SizedBox(
        height: 12,
      ),
    );
  }
}
