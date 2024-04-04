import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediasoft_academy_flutter/data/net/model/schedules_main_response_model.dart';
import 'package:mediasoft_academy_flutter/data/net/use_cases/schedules_main_screen_use_case.dart';

part 'schedulesmainscreen_events.dart';
part 'schedulesmainscreen_states.dart';

class SchedulesMainScreenBloc
    extends Bloc<SchedulesMainScreenEvent, SchedulesMainScreenState> {
  SchedulesMainScreenBloc() : super(SchedulesMainScreenInitial()) {
    on<SchedulesMainScreenOpenedEvent>(_mapPageOpenedToState);
  }

  Future<void> _mapPageOpenedToState(SchedulesMainScreenOpenedEvent event,
      Emitter<SchedulesMainScreenState> emit) async {
    try {
      SchedulesMainResponseModel? promocodesResponceModel =
          (await SchedulesMainScreenUseCase.executeSchedulesMain());
      emit(SchedulesMainScreenDataLoadedState(promocodesResponceModel!));
    } catch (_) {
      rethrow;
    }
  }
}
