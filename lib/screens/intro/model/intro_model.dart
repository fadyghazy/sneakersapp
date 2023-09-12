import 'package:sneakers_store/translate.dart';
import 'package:sneakers_store/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
class Items {
  final String img;
  final String title;
  final String subTitle;

  ///
  Items({
    required this.img,
    required this.title,
    required this.subTitle,
  });
}

List<Items> listOfItems = [
  Items(
    img: "https://assets3.lottiefiles.com/packages/lf20_zzbz9na6.json",
    title:Translate.IntroPage1NameTitle,
    subTitle:
    Translate.IntroPage1NameSubtitle,
  ),
  Items(
    img: "https://assets6.lottiefiles.com/packages/lf20_yzoqyyqf.json",
    title: Translate.IntroPage2NameTitle,
    subTitle:
    Translate.IntroPage2NameSubtitle,
  ),
  Items(
    img: "https://assets10.lottiefiles.com/packages/lf20_fxr713lj.json",
    title:Translate.IntroPage3NameTitle,
    subTitle: Translate.IntroPage3NameSubtitle,
  ),
];