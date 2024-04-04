import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'faq_provider.g.dart';

class FaqData {
  final String title;
  final String content;

  FaqData(this.title, this.content);
}

@riverpod
FaqRepository faqRepository(FaqRepositoryRef ref) => FaqRepository();

class FaqRepository {
  FaqRepository() {
    addInfoToFaqData();
  }
  final List<bool> isOpenList = [];
  final List<FaqData> faqData = [];

  void validateIsOpen() {
    for (var index = 0; index < faqData.length; index++) {
      isOpenList.add(false);
    }
  }

  bool checkOpenList(bool isOpen, int index) {
    isOpenList[index] = !isOpen;
    return isOpenList[index] = !isOpen;
  }

  void addInfoToFaqData() {
    faqData.add(
      FaqData(
        'Можно ли пройти ваш курс онлайн?',
        'Можно но осторожно',
      ),
    );
    faqData.add(
      FaqData(
        'Почему ваши курсы бесплатные?',
        'Мы не стремимся заработать денег, а стремимся прежде всего научить. Нам не важно, придете вы работать к нам или в другую компанию, нам важно дать актуальные и практически примени-мы знания, так как технологии стремительно развиваются и одному университету не справиться.Развивая учеников мы развиваемся  сами, а в таком обоюдно полезном деле коммерция неприемлема.',
      ),
    );
  }
}
