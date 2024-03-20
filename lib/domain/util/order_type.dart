import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_type.freezed.dart';

@freezed
class OrderType with _$OrderType {
  factory OrderType.ascending() = _Ascending;
  factory OrderType.descending() = _Descending;
}
