import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:note_app/domain/util/order_type.dart';

part 'note_order.freezed.dart';

@freezed
class NoteOrder with _$NoteOrder {
  factory NoteOrder.title(OrderType orderType) = _NoteOrderTitle;
  factory NoteOrder.date(OrderType orderType) = _NoteOrderDate;
  factory NoteOrder.color(OrderType orderType) = _NoteOrderColor;
}
