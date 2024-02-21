
import 'package:solution_challenge_front/model/section_model.dart';

String sectionNames(List<SectionModel>? sections) {
  if (sections == null || sections.isEmpty) {
    return 'no section';
  }
  return sections.map((section) => section.name).join(', ');
}


String sectionNamesWithCount(List<SectionModel>? sections) {
  if (sections == null || sections.isEmpty) {
    return 'no section';
  }
  return '${sections.length} sections';
}