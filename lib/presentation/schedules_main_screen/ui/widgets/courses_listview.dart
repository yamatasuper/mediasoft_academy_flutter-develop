import 'package:flutter/material.dart';
import 'package:mediasoft_academy_flutter/app/style/app_colors.dart';
import 'package:mediasoft_academy_flutter/app/style/app_text_styles.dart';
import 'package:mediasoft_academy_flutter/data/net/model/schedules_main_response_model.dart';
import 'package:mediasoft_academy_flutter/presentation/schedules_main_screen/bloc/schedulesmainscreen_bloc.dart';
import 'package:mediasoft_academy_flutter/presentation/schedules_main_screen/ui/widgets/course_container.dart';

class CoursesListView extends StatefulWidget {
  const CoursesListView({super.key, required this.state, required this.isOpen});
  final SchedulesMainScreenDataLoadedState state;
  final List<bool> isOpen;

  @override
  State<CoursesListView> createState() => _CoursesListViewState();
}

class _CoursesListViewState extends State<CoursesListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: widget
          .state.schedulesMainScreenResponceModel.courses.categories.length,
      itemBuilder: (_, int index) {
        return ExpansionPanelList(
          children: [
            ExpansionPanel(
              backgroundColor: AppColorsLight.schedulesBackground,
              canTapOnHeader: true,
              headerBuilder: (context, isOpen) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Text(
                        widget.state.schedulesMainScreenResponceModel.courses
                            .categories[index].title,
                        style: AppTextStyles.s18w400.copyWith(
                          color: const Color.fromRGBO(47, 47, 47, 1),
                        ),
                      ),
                    ],
                  ),
                );
              },
              body: Align(
                alignment: Alignment.centerLeft,
                child: Wrap(
                  alignment: WrapAlignment.start,
                  runSpacing: 5.0,
                  spacing: 5.0,
                  children: getScheduledCourses(
                      widget.state,
                      widget.state.schedulesMainScreenResponceModel.courses
                          .categories[index].id),
                ),
              ),
              isExpanded: widget.isOpen[index],
            ),
          ],
          expansionCallback: (i, isOpen) =>
              setState(() => widget.isOpen[index] = !isOpen),
        );
      },
    );
  }

  getScheduledCourses(
      SchedulesMainScreenDataLoadedState state, String scheduleId) {
    List<Widget> listWidgets = [];
    Map<String, Iterable<CoursesItem>> mapCourses = {};

    Map<String, List<String>> scheduleData = {};

    for (var item
        in state.schedulesMainScreenResponceModel.courses.categories) {
      for (var courses
          in state.schedulesMainScreenResponceModel.courses.items) {
        for (var codes in courses.categories) {
          if (item.id == codes.toString()) {
            mapCourses.addAll(
              {
                item.id:
                    state.schedulesMainScreenResponceModel.courses.items.where(
                  (element) => element.categories.contains(
                    int.parse(item.id),
                  ),
                ),
              },
            );
          }
        }
      }

      mapCourses.forEach(
        (key, value) {
          for (var element in value) {
            for (var item in element.categories) {
              if (item == int.parse(scheduleId)) {
                if (!scheduleData.keys.contains(element.code)) {
                  scheduleData.addAll(
                    {
                      element.code: [
                        element.status.toString(),
                        element.description
                      ]
                    },
                  );
                  listWidgets.add(
                    CourseContainer(course: element),
                  );
                }
              }
            }
          }
        },
      );
    }

    return listWidgets;
  }
}
