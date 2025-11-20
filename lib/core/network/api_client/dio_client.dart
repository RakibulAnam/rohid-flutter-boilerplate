
import 'package:dio/dio.dart';

class DioClient {

  DioClient._();

  static final DioClient _instance = DioClient._();

  static DioClient get instance => _instance;

//TODO: Configure Dio

  final Dio _dio = Dio();


}