import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneakers_store/constants/end_points.dart';
import 'package:sneakers_store/data/data_provider/remote/dio_helper.dart';
import 'package:sneakers_store/data/models/main/settings/terms_model.dart';
import 'terms_state.dart';

class TermsCubit extends Cubit<TermsState> {
  TermsCubit() : super(TermsInitial());
  static TermsCubit get(context) => BlocProvider.of(context);
  TermsModel? termsModel;

  //use for get Terms & Conditions from api
  void getTermsConditions() async {
    DioHelper.getData(url: termsEndPoint).then((value) {
      termsModel = TermsModel.fromJson(json: value.data);
      emit(TermsSuccess());
    }).catchError((error) {
      emit(TermsError());
    });
  }
}
