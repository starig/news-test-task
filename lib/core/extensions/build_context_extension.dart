import 'package:flutter/material.dart';

extension BuildContextRouteX on BuildContext {
  bool get isCurrentRoute => ModalRoute.of(this)?.isCurrent ?? true;
}
