import 'dart:convert';

import 'package:test_paprika/api_services/endpoint.dart';
import 'package:test_paprika/model/advertising_model.dart';
import 'package:test_paprika/model/creditcard_model.dart';
import 'package:test_paprika/model/history_transaction_model.dart';
import 'package:test_paprika/model/me_model.dart';
import 'package:http/http.dart' as http;
import 'package:test_paprika/utilites/global_print.dart';

class ApiServices {
  static Future<MeModel?> fetchMeModel() async {
    final url = Uri.parse("$kBaseUrl${ApiEndpoint.me}");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        return meModelFromJson(response.body);
      } else {
        logPrint("Gagal load data: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      logPrint("Terjadi kesalahan: $e");
      return null;
    }
  }

  static Future<HistoryTransactionModel?> getHistoryTransaction() async {
    final url = Uri.parse("$kBaseUrl${ApiEndpoint.history}");
    logPrint("$url");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        return HistoryTransactionModel.fromJson(jsonResponse);
      } else {
        logPrint('Gagal ambil data: ${response.statusCode}');
      }
    } catch (e) {
      logPrint('Error: $e');
    }
    return null;
  }

  static Future<CreditCardModel?> getCreditCard() async {
    final url = Uri.parse("$kBaseUrl${ApiEndpoint.creditCard}");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        return CreditCardModel.fromJson(jsonResponse);
      } else {
        logPrint('Gagal ambil data: ${response.statusCode}');
      }
    } catch (e) {
      logPrint('Error: $e');
    }
    return null;
  }

  static Future<AdvertisingModel?> getAdvertising() async {
    final url = Uri.parse("$kBaseUrl${ApiEndpoint.advertising}");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        return AdvertisingModel.fromJson(jsonResponse);
      } else {
        logPrint('Gagal ambil data: ${response.statusCode}');
      }
    } catch (e) {
      logPrint('Error: $e');
    }
    return null;
  }

  static Future<int?> fetchEthIdrPrice() async {
  final url = Uri.parse(
    '$kBaseUrlCoinGecko${ApiEndpoint.priceEth}',
  );

  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final int price = data['ethereum']['idr'];
      return price;
    } else {
      logPrint("Gagal load harga ETH: ${response.statusCode}");
      return 0;
    }
  } catch (e) {
    logPrint("Terjadi kesalahan saat fetch harga ETH: $e");
    return 0;
  }
}

}
