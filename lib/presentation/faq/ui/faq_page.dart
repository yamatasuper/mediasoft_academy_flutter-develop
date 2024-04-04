import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mediasoft_academy_flutter/app/providers/faq_provider.dart';

@RoutePage()
class FaqPage extends ConsumerWidget {
  const FaqPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final faqRepository = ref.watch(faqRepositoryProvider);
    faqRepository.validateIsOpen();

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: faqRepository.faqData.length,
            itemBuilder: (_, int index) {
              return Consumer(
                builder: (context, ref, _) {
                  return ExpansionPanelList.radio(
                    elevation: 1,
                    expandedHeaderPadding: EdgeInsets.zero,
                    expansionCallback: (int panelIndex, bool isExpanded) {
                      ref
                          .read(faqRepositoryProvider)
                          .checkOpenList(isExpanded, panelIndex);
                    },
                    children: [
                      ExpansionPanelRadio(
                        value: index,
                        canTapOnHeader: true,
                        headerBuilder: (context, isExpanded) {
                          return Row(
                            children: [
                              Text(
                                faqRepository.faqData[index].title,
                                style: const TextStyle(
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 18.0,
                                  color: Color.fromRGBO(47, 47, 47, 1),
                                ),
                              ),
                            ],
                          );
                        },
                        body: Align(
                          alignment: Alignment.centerLeft,
                          child: Wrap(
                            alignment: WrapAlignment.start,
                            runSpacing: 5.0,
                            spacing: 5.0,
                            children: [
                              Wrap(
                                alignment: WrapAlignment.start,
                                runSpacing: 5.0,
                                spacing: 5.0,
                                children: [
                                  Text(faqRepository.faqData[index].content),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
        const Text('задать свой вопрос')
      ],
    );
  }
}
