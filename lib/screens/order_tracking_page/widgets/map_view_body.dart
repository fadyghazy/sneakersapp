
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:location/location.dart';
import 'package:sneakers_store/constants.dart';
import 'package:sneakers_store/screens/settings/components/darkmode_tile.dart';
import 'package:sneakers_store/services/location_service.dart';
import 'package:sneakers_store/services/polyline_services.dart';

class MapViewBody extends StatefulWidget {
  const MapViewBody({Key? key}) : super(key: key);

  @override
  State<MapViewBody> createState() => _MapViewBodyState();
}

class _MapViewBodyState extends State<MapViewBody> {
 Completer<GoogleMapController>_controller=Completer();
 static final CameraPosition _initialCameraPosition=CameraPosition(target: LatLng(30.013510733092946, 31.286604925928824),zoom:14.4746 );
 LatLng _CurrentLocation =_initialCameraPosition.target;
 Set<Marker>_markers={};
 BitmapDescriptor?_locationIcon;
 Set<Polyline>_polylines={};



  //  حنتعرف على قراءة google maps flutter وحنتعلم ازاى نضيف الخريطه وازاى نعملها customization وازاى نضيفلها الوان وك styling وحنتعرف عن الmarkers وازاى بقدر احط الmarkers على الخريطه وازاى نقدر نرسم polylines بين نقطتين وحنتعامل مع ال services بحيث انى احسب المسافه بين النقطتين على حسب google والزمن المتوقع ودى بتفيدنا فى تطبيقات التوصيل وتطبيقات التاكسى فبنرسم polyline وبيحسبلى المسافه المتوقعه بين النقطتين حسب الازدحام وحسب المدينه اللى انت فيها والمدينه اللى عايز تروحها وحنتعرف كمان على انى ممكن ابحث عن الموقع اللى انا عايزة وهو بيعمل autocomplete  بدايه حتى نبدا نتعامل مع الgoogle map المقدمه من فلاتر لازم نعمل حساب على google cloud ونعمل register للتطبيق اللى احنا بنشتغل عليه ونعمل enable او تفعيل اللى انا عايز استخدمها من هدة الخريطه وهنا حيعطينى ما يسمى بال api key وهدا الشى اللى حيميز حساب مشروعى والخدمات اللى انا مفعلها واللى قدام حنفعلها واللى ممكن تكون مدفوعه وفيه اشتراك سنوى لها وعشان اتمتع بهدة الخدمات لازم اعملها enable فبكل سهوله حندخل على google cloud وحنعمل sign up و sign in للحساب اول شىء وبعد كدة بعمل create ل new project على google cloud فكل project انا بشتغل عليه بعملها registeration بال google cloud فبكل بساطه بكتب اسم المشروع بعد كدة بروح على قسم الapi والخدمات اللى بتوفرها google cloud ل google map يعنى فمبدايا فى هدة المحاضرة حتفعل بس ال maps sdk for android w maps sdk or ios عشان لما افتح الخريطه بس تطلعلى الخريطه مش اكتر من كدة وحروح للcredentials عشان اخد الapi key الخاص بالproject وحاخدة copy
  //   // حروح على الproject بتاعنا واروح على ال pub spec .yaml واللى هى google maps flutter وفى الandroid manifest لازم اضيف api key اللى اخدناة من الconsole الخاص بال google cloud ثم ونضيف الscript بداخل الandroid manifest وبكدة نكون انتهينا من فسم الandroid ثم قسم الios فى الapp delegate حعمل فقط import لل google maps وحضيف ال api key اللى شوفناة ويفضل ان الminimum sdk يكون 24 عشان ميديناش مشاكل ثم عملنا class عادى بيكون stateful wiDget وحستخدم ال widget اللى اسمها google map دلوقتى انا لو عملت run تطلعلى الخريطه بدايه حعمل import للمكتبه اللى هى google maps وبعد كدة بنعمل controller لل map ونوعه google map controller عشان اقدر اتحكم بالخريطه بحيث لو كنت انا عايز اعملها animate او احركها وحعرف متغير من نوع camera position يسمى initialCameraPosition وهو انى لما افتح التطبيق عايز اول لقطه من الكاميرا تظهر فين ؟؟ ودة هو مكان الcamera position وبيكون عبارة عن متغير من نوع CameraPosition بياخد target وبيكون الlat وال long وهى خط الطول وخط العرض والzoom والzoom وهى  معدل تكبير الكاميرا وتقريب الكاميرا على مكان الcamera position واى نفطه بالكرة الارضيه تتمثل بالطول والعرض اى الlat ,long وهى احداثيات اى موقع بالكرة الارضيه عبارة عن ارقام فدلوقتى لو روحنا على الخريطه وهى google maps فاى نقطه انا عايزها بضغط right click عليها واضغط على what,s here فبيدينى المكان اللى انا حروح عليه فبيدينى المكان اللى انا فيه وبيعطينى المكان الخاص بال lat ,long فبديله ببساطه الlat ,long والlat وال long موجودة بداخل الموقع بتاعى على الgoogle maps وحستحددم ال widget اللى هى ال google map وحديلها اول حاجه initial camera position ودى اللى احنا عرفناها فوق وحقوله ان ال map type فيها ويوجد عدة انواع لل maps حتتعامل مع ال normal مبددايا وفى ال on map created حقوله اعملى register لل map controller ودلوقتى لما اعمل run حتطلع معايا الخريطه بالشكل الاتى وحتظهر ال camera اول لما اعمل run على النقطه اللى كنت محددها وهى الموقع بتاعى من  خلال نحديد ال lat ,long الخاص بالموقع بتاعى
 //    اتعلمنا فى المحاضرة السابقه اتعلمنا ازاى نستخدم الgoogle map وازاى نعمل project جديد من الgoogle cloud وخدنا منه الapi key للproject بتاعنا وحطينا فى الapplicattion بتاعنا ثم فى المحاضرة اليوم حنتعلم ازاى نعرف نعمل get لل location ونستخدمه ونجيب الlocation ونستخدمه وهو الlocationال device اللى بيستخدمه المستخدم تمام وهل انا ممكن اعطيه location من عندى وهو يعمل animate لل camera ويحرك الcamera تبعى فى الخريطه لل location اللى انا اعطيته اياة مبدايا بنستخدم مكتبه خاصه بال location وهى الlocation اللى احنا بنتعامل فيها فدلوقتى حنشا location services وحيكون عبارة عن class بانى حنشا folder يسمى services وحنشا بداخله  dart file يسمى location_services وححط فيه كل الservices اللى حتعامل معاهم فحنشا function تسمى get location ودى حتجيبلى الlocation الخاص بال device فاول حاجه حعمل object من ال location وحسميه location وبعد كدة حفحص ال services شغاله ولا لا ويقصد بال services ال services الخاصه بال mobile فالموبايل لو مفيهوش google play services مش حيشتغل ابدا ححنفحص ال permissions ادا كان المستخدم يعطينى الpermission عشان اوصل لل location ولا لا وفيه permission.status  بيكون اما granted او denied فبفحص لو الامور تمام فلو حيدينى المستخدم الpermissions ساعتها اكمل ولو مدانيش ال permissions ساعتها حيرميلى exception لو حصل خطا وبيرجعلى الlocation.get location شى يسمى location data من نوع locationData فيها الaccuracy وفيها الattitude وفيها ال lattitude والlongitude واللى حكينا عنه الدرس الماضى وحفوله return locationdata
 //   ودلوقتى الmap screen اللى بنتعامل معاها عايز لما احرك الخريطه ياخدنى للlocation الجديدة اللى انا بقيت فيها ويطبعلى ال location دة فجعرف متغير من نوع latlng يسمى currentlocation ولاجل الnull safety حديله قيمه ابتدائيه وهى الinitialCameraPosition.target والCameraPosition فيها خاصيه تسمى الtarget من نوع latlng وبالgooglemapwidget حقوله onCameraMove وهى فى حاله تحريك الcamera بيعطينى newCameraPosition فحقوله ساعتها set State وهى انك حتعمل rebuild لل widget اللى انا قيها والcurrent location حيكووون عبارة عن الnew position.target وبكدة حيكون الcameraposition هو مكان اللى بيتحرك له الcamera وحعمل bottomnavigationbar  غبارة عن Container واحط فيه  text عشان اشوف التغير اللى بيحصل فى الpositions اللى بيحصل ولو عملت run حتظهر معايا الواجهه بهددااا الشكل والlat وال long بيطبعوا بداخل الtext وانا كل ما حركت الخريطه بلاحظ ان بتتغير القيمه حسب الlocation الجديدة اللى انا اصبحت فيها وعايزين لما تضغط على الزر ياخد الlocation الخاص بالموبايل وبحالتنا بما اننا على الemulator فحنروح على الاعدادات   ونحط lat ,long افتراضيه فحنشا floating action button عبارة عن icon واحدة ولما اضغط عليها بتجيبلى الget my location والget my location وهى عبارة عن function من نوع future مش بترجعلنا حاجه اول حاجه بعملها انى بستدعى الgetlocation من ال locationService وحترجعلى الmy location وحعمل animate لل camera اللى هى بالخريطه واحط فيها ال location الجديد فحقوله animate camera واعطيه location جديد وال controller اللى استخدمناة بال google map راح اتعامل معاة وحقوله new camera position هى الlocation.lat,lovation,long وال zoom حيكون zoom معين وليكن 17 وحقوله بس print animate camera to camera location.lat,location.longوبعد كدة حقوله controller.animateCamera وحيعمل بالupdate الجديد بتاع الcamera postion ودلوقتى لما اعمل run واضغط على الزر فكدة بقوله يعطينى الlocation الخاص بيا فحيدينا الpermission ان هل انت متاكد انك عايز تحصل على الmobile device location فحضغط على allow فهو كدة حيروح ياخد الlocation  فكدة هو عمل animate للlocation تبع emulator
 // فى المحاضرة السابقه اتعلمنا ازاى نجيب ال location تبع الdevice وفى هدة المحاضرة حنتعلم ابحث عن مواقع معينه سواء باللغه العربيه او الانجليزيه ويقترح اسماء الاماكن الموجودة ضمن المنطقه اللى انا موجود فيها فى البدايه بضم مكتبه تسمى flutter google places بالاضافه اننا حنرجع للgoogle cloud فى الproject اللى احنا عملناة ونعمل enable ل google places api وطبعا هى خدمه مدفوعه وحنشوف التفاصيل كلها بال google cloud تانى حاجه حنضيف بعض الpermissions بداخل الandroid manifest ودلوقتى  بالنسبه للmapscreen حنضيف appbar ويحتوى على زر واحد وهو الsearch icon ودة لما حضغط عليه حيطلعلى dialog وال dialog دة حيكون فيه اسماء الاماكن اللى حبحث فيها فهى عبارة عن مكتبه ضمينها بداخل الpub spec .yaml وحديله الcontext وحديله الapi key تبع مشروعنا على ال google cloud وعملت class يسمى constant يحتوى على static variables منهم ال  google api key تبع  مشروعنا على الgoogle cloud وفيه mode لل map screen سواء كان full screen وبعض الامور الاخرى الخاصه بال design وبعد لما ابحث على search bar  راح يكون فيه الجواب والجواب حيكون فيه place id لان لو شوفنا فى الproperities الموجودة اللى بتظهر لما ببحث description الخاص بالمنطقه وهو  يحمل اسم المنطقه ويوجد الid الخاص بالمنطقه وفيه الplace id فدلوقتى انا عايز لما اطلع اسم المكان احصل على الlocation تبعه من خلاللللل الlat ,long فحعمله functions تسمى geTlocationfromplaceid مهمتها تاخد ال place id وتعطينى الlocation باستخدام ال google map places packages راح اعطيها الapi key اللى جايلى  وراح تغطينى لما اقوله _places,getDetailsByPlaceId حديله الplace id  وحيرجعلى latlng لان الvariable اللى اسمه placeDetailsResponse والvariable دة بيحتوى على الlat ,lng فانا اخر شى حعمله انى بعد لما اختار المكان اللى عايز ابحث عنه راح اعمل animate للcamera بال location الجديد اللى اخترناة فلما حنعمل run حنشوف بهدا الشكل فدلوقتى لما اضغط على الsearch icon ساعتها حيفتح الdialog وينتقل للواجهه الجديدة وحختار اسم المكان اللى عايز اروحله فبلاحظ انه عمل navigate لل location الجديد اللى بحثت عنه
 //   فى هدة المحاضرة ان شاء الله نريد ان نتعلم ازاى ممكن نتعامل مع ال markers بالخريطه وانا ممكن اجيب صورة من ال assets من الملفات اللى عندى واحطها ك marker بالخريطه اللى انا بتعامل معاة فى البدايه انا حملت صورة png عاديه لانشاء icon وضمتها بال pubspec.yaml فى مجلد ال images الموجود بداخل مجلد ال assets وحروح بداخل ال map screen اللى بنتعامل معاها اول شىء عشان احط markers جوة ال MapScreen فحعمل set من شىء يسمى marker وححطه بال google map وهو بياخد set of markers وانا كدة انشاتها وعشان لما اكون بتحرك بالخريطه اعرف فين النقطه اللى بيثبتها فساعتها ححط ال GoogleMap  جوة ال stack وححط icon عبارة عن الصورة بس مجرد صورة ولكن ال markers اللى حتكون بداخل ال google map هى markers ضمن  هدة الخريطه ولكن انا بس بحط صورة جوة هدة الخريطه  عشان اعرف بتحرك فين ودلوقتى عايز اول لما يبنى الواجهه انا اخد الصورة من الasset واحولها لصيغه عم يتعامل مع الmarker وال marker بياخد item او صورة خليناة نسميها item من نوع bitmapdescriptor فانا اول لما حبنى الواجهه حستدعى فى الinit state  function تسمى builtMarkerFromAssets وهى عبارة عن marker انا بنيتها وبقول فيها ان الlocationIcon بتساوى ال null اى ان فى حاله ان مفيش locationIcon ساعتها اعملى bitmapdescriptor وحجيب صورته من ال fromAssetImage وحديله image configuration واللى هى ال size تابعها ومسار الصورة وبعد كدة حعمل set state عشان تظهرلى الصورة بداخل الgoogle map وبعد كدة حضيف floating action button عشان لما اضغط عليه يعملى set marker بال location اللى انا حاليا فيه وال set marker عبارة عن function بتاخد location lat,long وبنشا marker جديد وفى حاله انشاء marker جديد اول شىء بعطى marker جديد وال id ة لازم يكون unique مش حيتكرر ضمن الset كله عشان انا اقدر اميز marker عن marker وحديله الicon فبقوله bitmapdiscreptor.defaultmarker وحديله الposition وهنا حيكون عيارة عن postion ال marker والinfo window هى عبارة عن قائمه صغيرة لما بضغط على الmarker بيدينى شويه information وهى مثلا ما هو الlocation وهنا حديله string جوة string وحقوله marker.add وهنا بقوله انه ضيفلى على الmarkers اللى عندى وعملت set state عشان تتغير الواجهه ولما بنعمل run حنشوف ان راح تكون بهدا المنظر وبنلاحظ ان انا عم بتحرك بتكون هدة الصورة بتكون ثابته بس مجرد انا بعرف انا واقف فين وبعد كدة لما بضغط على الlocation action floating button ساعتها حيثبت الموقع اللى انا فيه وثبت marker بهدة النقطه ولما بضغط على marker معين بيعطينى هددددة الinfo window وفيها الtitle وفيها الdescription
 //    draw polyline function مرحبا يا شباب فى هدة المحاضرة حنتعلم نرسم polyline بين نقطتين اى بين 2 locations على خريطه google maps flutter اول شىء لازم اضم مكتبه flutter polylines points ثم فى المحاضرات السابقه كان عندنا الخريطه الخاصه بال flutter map واتعلمنا ازاى نتعامل مع الmarkers وازاى نجيب الlocation وكل هدة التفاصيل اول شىء حنعرف set<Polyline>وشىء يسمى polylines وحنيجى على خريطه google map وحنديله properity تسمى polylines وبتكون set of polylines  وحنضيف زر خاص مهمته ان يرسم polyline بين نقطتين وحديله نقطه افتراضيه والcurrent location وطيعا الcurrent location بيتحدث كل لما بحرك الكاميرا وبالنسبه لل
 //  بالنسبه لل draw polyline function بياخد from,to بتكون lat ,lng اولا انا بعمل  polylineservice وحنشوفه ونقراة وفيه function واحدة وهى draw polyline وبعطيها الfrom , ال to عادة بترجعلى الpolyline فحضيف polyline حضيفه للpolylineService فحضيف polyline حضيفه للpolyline تبع الخريطه بتاعت google map flutter وححط marker على كل نقطه منهم ودة عشان يكون ال polyline يراسه markers وبعد كدة حعمل set state عشان يعيد بناء الواجهه الخاصه بال Google map وبعد كدة عندى  تسمى polylineService وهو عبارة عن class وفيه function تسمى drawpolyline  وبتاخد from ,to فاول شىء بعمله انى بنشا object من الpolylinepoints واللى حيكون من مكتبه الpoints _flutter_polylines ولازم اروح على ال google cloud وحنفعل الdirections Api ودة عشان نقدر نتعامل مع الpoints وبعد كدة حستدعى function من خلال الpolylines object تسمى getRouteBetweenCoordinates وحديله الapi key اللى عندى انا وحديله متغير من نوع PointLatLng وحديله الlat وال long تبعه وهو حيرجعلى الpolyline وهو الخط اللى حيكون متصل بالنقطتين وهو عبارة عن points فخلينا نقول ان كل متر عندنا points فالmathod دى بترجعلى هدة النقاط فانا حاخد هدة النقاط واحولها للlat و long بحيث يكون فيه coordinates لل lat,long الخاصه بال polyline واضيفها على الpolyline coordinates ولكن الpoints اللى فيها من الlat,long وبعد كدة حرجع شىء يسمى polyline والpolyline بيكون له polylineId ولازم يكون unique لانه انا ممكن ارسم على الخريطه اكثر من polyline بعطيه اللون اللى بريدة وبعطيه الpoints اللى حتكون list من الlat,long واخر حاجه حتكون معانا هى الdistance واخر نقطه معانا وهى حساب الdistance وهى انى بحسب هدة المسافه مثلا بين النقطتين فحروح على اقرب شارع وحطلى نقاط بحيث انى اعرف المسافه بين النقطه الحاليه بتاعت المكان بتاعى وبين اقرب شارع ليا فانا عايز اعرف الdistance بين النقطتين وعشان احسب الdistance عملت function تسمى calc distance وبتاخد الpolycoordinates ومهمتها انها تقسملى الطريق لاقسام صغيرة وتحسبلى المسافه بينهم وهى عبارة عن عمليه رياضيه وبنقدر نحطها مباشرة وبنتعامل معاها انا فقط بحسب المسافه وبحسب المسافه بينهم ولما بعمل run حيطلعلى ال application بهدا الشكل فانا حروح للlocation تبعى واروح على الcuurrent location فحنلاحححححححححححححححححظ انه رسم polyline بين نقطتين بس انا عامل zoom out كتير وطبعا الdistance بينهم عبارة عن  27,8 كيلو متر
 // فى هدة المحاضرة حنتعلم ازاى نغير الوان الخريطه عندنا بالتطبيق لازم نعمل customize للالوان عشان اقدر اغير الوان مثلا البحر او الاماكن او الخطوط والstyle تبعها وهدة التفاصيل اول شىء بنروح على موقع map style .google.com وبنختار الخريطه اللى عايزينها ولنفترض انى عايز ان الtheme العام الخاص بال map ليكن dark فبتكون الخريطه بشكل معين وممكن اعمل more options وبدخل بالتفاصيل كلها فعندى فى ال map فى الdark mode حلاقى ان لون الماء حيكون اسود فممكن اروح على الwater واختار الexternal type يكون geometry وحخلى الcolor تبعه يكون ازرق وممكن اخلى الtheme الخاص بال map يكون silver فبعد لما خلصنا الcustomization للالوان اللى عايزينها حضغط finish وبعد لما اقوله finish حيدينى ملف jason فيه كل التفاصيل اللى انا غيرت الوان الخريطه وحعمل copy لملف الjson ,حروح لمجلد الassets عندنا وحطيت ملف الmap_style.json اللى اخدناة copy بداخل ال assets وححط ملف الjson اللى اخدناة من الموقع  وحروح على ملف الpubspec.yaml وحضيف الpath الخاص بهدا الملف وحعمله pub get و save وحنروح على الgoogle map widget اللى بدنا اياها وضمن الon map created حعرف style جديد واول حاجه بجيب ال style من ملف الassets وبعد كدة حقوله controller وحقوله خلى الmap style يكون الstyle الجديد ولما نعمل run حنشوف ال style الجديد الخاص بال map وان اتغير شكل الstyle الخاص بال map وهو الstyle الخاص بملف الstyles.json وطبعا الالوان الخاصه بال map بحددها على حسب الui اللى جايلى من ال ui ux designer
  @override
  Widget build(BuildContext context) {
    final isDarkMode=Settings.getValue<bool>(DarkModeTile.KeyDarkMode,defaultValue: true);
    void initState(){
      _buildMarkerFromAssets();
      super.initState();

    }
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(icon: Icon(Icons.search),onPressed:_showSearchDialog)
        ],
      ),
        body:
      Stack(
        children:
        [ GoogleMap(initialCameraPosition:_initialCameraPosition,
          markers: _markers,
          polylines: _polylines,

          mapType: MapType.normal,onMapCreated: (GoogleMapController controller)async{
          String Defaultstyle=await DefaultAssetBundle.of(context).loadString("assets/map_style_default.json");
          String Darkstyle=await DefaultAssetBundle.of(context).loadString("assets/map_style.json");
          controller.setMapStyle(Darkstyle);
        _controller.complete(controller);


    },
    onCameraMove: (CameraPosition newPos){
        setState(() {
          _CurrentLocation=newPos.target;

        });
    },


    ),
          SizedBox(width: 40,
          height: 40,
          child: Image.asset("assets/images/user.jpg"),)

      ]
      ),

      floatingActionButton: Column(
        children: [
          FloatingActionButton(onPressed: (){
            _setMarker(_CurrentLocation);},
            child:Icon(Icons.location_on)
          ),
          FloatingActionButton(onPressed: (){
            _drawPolyline(
              LatLng(38.52900200591146,98.54919254779816),_CurrentLocation
            );},
              child:Icon(Icons.settings_ethernet_rounded)
          ),
          FloatingActionButton(onPressed: (){
            _getMyLocation();},
              child:Icon(Icons.gps_fixed)
          ),
        ],
      ),

      bottomNavigationBar: Container(
        height: 20,
        alignment: Alignment.center,
        child: Text("lat:${_CurrentLocation.latitude},long:${_CurrentLocation.longitude}"),
      ),
    );

  }
 Future<void>_drawPolyline(LatLng from,LatLng to)async{
    Polyline polyline =await PolylineService().drawPolyline(from,to);
    _polylines.add(polyline);
    _setMarker(from);
    _setMarker(to);
    setState(() {

    });

 }
 Future<void>_setMarker(LatLng _location)async{
   Marker newMarker=Marker(
     markerId: MarkerId(_location.toString()),
     icon: BitmapDescriptor.defaultMarker,
     position: _location,
     infoWindow: InfoWindow(
     title: "Title",
     snippet: "${_CurrentLocation.latitude},${_CurrentLocation.longitude}"
   ),

   );
   _markers.add(newMarker);
   setState(() {

   });
   }
 Future<void>_buildMarkerFromAssets()async{
    if(_locationIcon == null){
      _locationIcon=await BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(48,48)),"assets/images/user.jpg");
      setState(() {

      });
    }
 }
  Future<void>_getMyLocation()async{
    LocationData _myLocation=await LocationServices().getLocation();
    _animateCamera(_myLocation);
  }
  Future<void>_animateCamera(LocationData _location)async{
    final GoogleMapController controller =await _controller.future;
    CameraPosition _cameraPosition=CameraPosition(target: LatLng(
      _location.latitude!,_location.longitude!),
      zoom: 17.4746
    );
    print("animating camera to (lat:${_location.latitude},long:${_location.longitude}");
    controller.animateCamera(CameraUpdate.newCameraPosition(_cameraPosition));
  }
  Future<void>_showSearchDialog()async{
    var p = await PlacesAutocomplete.show(
      context: context,
      apiKey: google_api_key,
      mode: Mode.fullscreen,
      language: "ar",
      region: "ar",
      offset: 0,
      hint: "Type here...",
      radius: 1000,
      types: [],
      strictbounds: false,
      components: [Component(Component.country,"ar")]);
    _getLocationFromPlaceId(p!.placeId!);
  }
 Future<void>_getLocationFromPlaceId(String placeId)async{
   GoogleMapsPlaces _places=GoogleMapsPlaces(
     apiKey:google_api_key,apiHeaders:await GoogleApiHeaders().getHeaders(),
   );
   PlacesDetailsResponse detail =await _places.getDetailsByPlaceId(placeId);

   final lat = detail.result.geometry!.location.lat;
   final lng = detail.result.geometry!.location.lng;
   final GoogleMapController controller = await _controller.future;
   controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(lat,lng),
       zoom:12)));
 }
}
