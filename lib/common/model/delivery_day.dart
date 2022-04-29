import 'package:equatable/equatable.dart';

class DeliveryDay extends Equatable {
  final String dayOfWeek;
  bool enabled;
  DeliveryDay({required this.dayOfWeek, this.enabled = false});

  @override
  List<Object?> get props => [dayOfWeek];
}
