part of 'schedulesmainscreen_bloc.dart';

@immutable
abstract class SchedulesMainScreenState {}

class SchedulesMainScreenInitial extends SchedulesMainScreenState {}

class SchedulesMainScreenDataLoadedState extends SchedulesMainScreenState {
  SchedulesMainScreenDataLoadedState(this.schedulesMainScreenResponceModel);
  final SchedulesMainResponseModel schedulesMainScreenResponceModel;
}
