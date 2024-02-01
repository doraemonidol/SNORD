import 'package:flutter/material.dart';
import 'package:rehabox/src/utils/controllers_status.dart';

/// Render a widget based on the status of a controller.
/// If [onLoading], [onLoaded] is not provided, onInitial will be used.
/// If the controller is in invalid state, [onDefault] will be used.
/// If [onError] is not provided, [onLoaded] will be used. If [onLoaded] is not provided, [OnDefault] will be used.
/// If [onDefault] is not provided, [SizedBox] will be used instead.
Widget Function(BuildContext context, T value, Widget? child)
    conditionalRenderManager<T extends ControllersStatusInterface>({
  required Widget Function(BuildContext context) onInitial,
  Widget Function(BuildContext context)? onLoading,
  Widget Function(BuildContext context)? onLoaded,
  Widget Function(BuildContext context)? onError,
  Widget? onDefault,
}) =>
        (context, value, child) {
          if (value.isInitial) {
            return onInitial(context);
          }

          if (value.isLoading) {
            return onLoading?.call(context) ?? onInitial(context);
          }

          if (value.isLoaded) {
            return onLoaded?.call(context) ?? onInitial(context);
          }

          if (value.isError) {
            return onError?.call(context) ??
                onLoaded?.call(context) ??
                onDefault ??
                const SizedBox();
          }

          return onDefault ?? const SizedBox();
        };
