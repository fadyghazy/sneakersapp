import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_html_css/simple_html_css.dart';
import 'package:sneakers_store/business_logic/terms/terms_cubit.dart';
import 'package:sneakers_store/business_logic/terms/terms_state.dart';
import 'package:sneakers_store/screens/Terms/presentation/views/widgets/custom_text.dart';
import 'package:sneakers_store/translate.dart';


//This screen use for get terms and conditions
class TermsScreen extends StatefulWidget
{
  const TermsScreen({Key? key}) : super(key: key);

  @override
  State<TermsScreen> createState() => _TermsScreenState();
}

class _TermsScreenState extends State<TermsScreen> {
  @override
  Widget build(BuildContext context)
  {
    return BlocProvider(
      create: (context) => TermsCubit()..getTermsConditions(),

      child:  BlocConsumer<TermsCubit,TermsState>(
        listener: (BuildContext context, state) {},

        builder: (BuildContext context, Object? state)
    {
    TermsCubit termsCubit = TermsCubit.get(context);
    Size size=MediaQuery.of(context).size;
    return ThemeSwitchingArea(
    child:Builder(builder: (context)=>
    Scaffold(
    appBar: AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    title: Text(
    Translate.TermsConditionsText,style: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w500,

    ),

    ),
    leading: IconButton(
    onPressed: () {
    return Navigator.pop(context);
    },
    icon: const Icon(
    Icons.arrow_back_ios_rounded,
    color: Colors.black, size: 30),
    ),
    ),

    body: SingleChildScrollView(
    child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
    color: Colors.white70,
    child: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
    Padding(
    padding: const EdgeInsets.all(8.0),
    child: (state is !TermsLoading &&
    termsCubit.termsModel?.terms == null)
    ? const Center(child: CircularProgressIndicator())
        : RichText(
    textAlign: TextAlign.center,
    text: HTML.toTextSpan(
    context,
    termsCubit.termsModel?.terms,
    defaultTextStyle: const TextStyle(

    fontWeight: FontWeight.bold,
    color: Color(0xff555555),

    decoration: TextDecoration.none,
    fontSize: 17.0,

    ),

    ))),

    ],
    ),
    ),
    ),
    ),
    )
    )

    );
    }

    )
    );
  }
}
