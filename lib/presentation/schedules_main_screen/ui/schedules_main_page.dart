import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediasoft_academy_flutter/app/style/app_colors.dart';
import 'package:mediasoft_academy_flutter/data/net/model/schedules_main_response_model.dart';
import 'package:mediasoft_academy_flutter/presentation/schedules_main_screen/bloc/schedulesmainscreen_bloc.dart';
import 'package:mediasoft_academy_flutter/presentation/schedules_main_screen/ui/widgets/courses_listview.dart';
import 'package:mediasoft_academy_flutter/presentation/widgets/loading_widget.dart';

@RoutePage()
class SchedulesMainPage extends StatefulWidget {
  const SchedulesMainPage({Key? key}) : super(key: key);

  @override
  State<SchedulesMainPage> createState() => _SchedulesMainPageState();
}

class _SchedulesMainPageState extends State<SchedulesMainPage> {
  final List<bool> _isOpen = [];

  @override
  void initState() {
    context
        .read<SchedulesMainScreenBloc>()
        .add(SchedulesMainScreenOpenedEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorsLight.schedulesBackground,
      body: BlocBuilder<SchedulesMainScreenBloc, SchedulesMainScreenState>(
        builder: (_, state) {
          if (state is SchedulesMainScreenDataLoadedState) {
            validateIsOpen(state);
            return CoursesListView(
              state: state,
              isOpen: _isOpen,
            );
          }
          return const LoadingWidget();
        },
      ),
    );
  }

  void validateIsOpen(SchedulesMainScreenDataLoadedState state) {
    for (var index = 0;
        index <
            state.schedulesMainScreenResponceModel.courses.categories.length;
        index++) {
      _isOpen.add(false);
    }
  }
}

Map<String, List<CoursesItem>> getCoursesMap(
    SchedulesMainScreenDataLoadedState state) {
  Map<String, List<CoursesItem>> resultMap = {};
  for (var category
      in state.schedulesMainScreenResponceModel.courses.categories) {
    List<CoursesItem> coursesList =
        state.schedulesMainScreenResponceModel.courses.items
            .where(
              (course) => course.categories.contains(
                int.parse(category.id),
              ),
            )
            .toList();
    if (coursesList.isNotEmpty) {
      resultMap[category.id] = coursesList;
    }
  }
  return resultMap;
}

bool scheduleCourseExists(List<Widget> widgets) {
  return widgets.isNotEmpty;
}
