import 'package:flutter_application_1/core/network/dio_factory.dart';
import 'package:flutter_application_1/core/path.dart';
import 'package:flutter_application_1/features/clean%20arch/domain/usecases/login.dart';
import 'package:flutter_application_1/features/clean%20arch/presentation/screens/pages/home_model.dart';

abstract class BaseRemoteDatasource {
  Future Login(
    Inputt inputt,
  );
  Future Home();
  Future Reset(
    Inputt inputt,
  );
  Future Regester(
    Inputt inputt,
  );
}

class LoginRemoteDatasource extends BaseRemoteDatasource {
  @override
  Future Login(
    Inputt inputt,
  ) async {
    await DioHelper.postData(url: AppConstant.logindio, data: inputt.data);
    final Responses = DioHelper.result;
    print(Responses);

    print('yasssssssssssssssss');
    return Responses;
  }

  Future Regester(
    Inputt inputt,
  ) async {
    await DioHelper.postData(url: AppConstant.regester, data: inputt.data);
    final Responses = DioHelper.result;
    print(Responses);

    print('yasssssssssssssssss');
    return Responses;
  }

  @override
  Future Reset(Inputt inputt) async {
    await DioHelper.postForgetPassword();
    final Responses = DioHelper.result;
    print(Responses);

    print('yasssssssssssssssss');
    return Responses;
  }

  @override
  Future Home() async {
    await DioHelper.Gethome();

    List? model = DioHelper.model1;
    print('تمام');
    return model;
  }
}
