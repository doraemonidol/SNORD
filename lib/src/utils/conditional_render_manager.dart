import 'package:flutter/material.dart';
import 'package:rehabox/src/utils/controllers_status.dart';

/// Render a widget based on the status of a controller.
/// If [onLoading], [onLoaded] is not provided, onInitial will be used.
/// If the controller is in invalid state, [onDefault] will be used.
/// If [onDefault] is not provided, [SizedBox] will be used instead.
Widget Function(BuildContext context, T value, Widget? child)
    conditionalRenderManager<T extends ControllersStatusInterface>({
  required Widget Function(BuildContext context) onInitial,
  Widget Function(BuildContext context)? onLoading,
  Widget Function(BuildContext context)? onLoaded,
  required Widget Function(BuildContext context) onError,
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
            return onError(context);
          }

          return onDefault ?? const SizedBox();
        };
