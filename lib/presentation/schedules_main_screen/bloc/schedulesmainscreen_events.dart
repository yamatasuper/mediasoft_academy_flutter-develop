part of 'schedulesmainscreen_bloc.dart';

@immutable
abstract class SchedulesMainScreenEvent {
  const SchedulesMainScreenEvent();
}

class SchedulesMainScreenOpenedEvent extends SchedulesMainScreenEvent {}