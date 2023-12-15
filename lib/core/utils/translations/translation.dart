import 'package:arab_therapy_task/core/utils/translations/translations_assets_reader.dart';
import 'package:get/get.dart';

class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': TranslationsAssetsReader.en!,
        'ar': TranslationsAssetsReader.ar!,
      };
}
