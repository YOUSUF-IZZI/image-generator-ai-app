import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

void saveNetworkImage(String? url) async {
  var response = await Dio().get(
    url ?? "https://ss0.baidu.com/94o3dSag_xI4khGko9WTAnF6hhy/image/h%3D300/sign=a62e824376d98d1069d40a31113eb807/838ba61ea8d3fd1fc9c7b6853a4e251f94ca5f46.jpg",
    options: Options(responseType: ResponseType.bytes),
  );
  final result = await ImageGallerySaver.saveImage(
    Uint8List.fromList(response.data),
    quality: 60,
    name: "hello",
  );
  if (kDebugMode) {
    print(result["isSuccess"]);
  }
}
