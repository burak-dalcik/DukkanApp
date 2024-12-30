import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/kalem_turu.dart';

class KalemTuruService {
    static const String url = 'http://172.31.140.153:7222/api/Kalem_turu';
  //static const String url = 'https://10.0.2.2:7222/api/Kalem_turu';

  static Future<List<KalemTuru>> fetchKalemTurleri() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<KalemTuru> kalemTurleri = body.map((dynamic item) => KalemTuru.fromJson(item)).toList();
      return kalemTurleri;
    } else {
      throw Exception('Veri yüklenirken bir hata oluştu');
    }
  }
}
