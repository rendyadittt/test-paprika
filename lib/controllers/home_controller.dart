import 'dart:convert';

import 'package:get/get.dart';
import 'package:test_paprika/api_services/api_services.dart';
import 'package:test_paprika/helpers/helpers.dart';
import 'package:test_paprika/model/advertising_model.dart';
import 'package:test_paprika/model/creditcard_model.dart';
import 'package:test_paprika/model/history_transaction_model.dart';
import 'package:test_paprika/model/me_model.dart';
import 'package:test_paprika/utilites/global_print.dart';

class HomeController extends GetxController {
  var loadingMe = DataLoad.loading.obs;
  var me = Rxn<MeModel>();
  var balance = "0".obs;

  var loadingHistory = DataLoad.loading.obs;
  var history = Rxn<HistoryTransactionModel>();

  var loadingCreditCard = DataLoad.loading.obs;
  var creditCard = Rxn<CreditCardModel>();

  var loadingAdvertising = DataLoad.loading.obs;
  var advertising = Rxn<AdvertisingModel>();

  var selectedHolder = Rxn<CreditCardModel>();

  var priceEth = 0.obs;

  @override
  void onInit() {
    loadMe();
    loadHistory();
    loadCreditCard();
    loadAdvertising();
    getEthPrice();
    super.onInit();
  }

  void loadMe() async {
    loadingMe.value = DataLoad.loading;
    me.value = await ApiServices.fetchMeModel();
    if (me.value != null) {
      balance.value = me.value!.record.balance.toString();
      loadingMe.value = DataLoad.done;
    } else {
      loadingMe.value = DataLoad.failed;
    }
  }

  void loadHistory() async {
    loadingHistory.value = DataLoad.loading;
    history.value = await ApiServices.getHistoryTransaction();
    if (history.value != null) {
      loadingHistory.value = DataLoad.done;
    } else {
      loadingHistory.value = DataLoad.failed;
    }
  }

  void loadCreditCard() async {
    loadingCreditCard.value = DataLoad.loading;
    creditCard.value = await ApiServices.getCreditCard();
    if (creditCard.value != null) {
      logPrint(jsonEncode(creditCard.value));
      loadingCreditCard.value = DataLoad.done;
    } else {
      loadingCreditCard.value = DataLoad.failed;
    }
  }

  void loadAdvertising() async {
    loadingAdvertising.value = DataLoad.loading;
    advertising.value = await ApiServices.getAdvertising();
    if (advertising.value != null) {
      logPrint(jsonEncode(advertising.value));
      loadingAdvertising.value = DataLoad.done;
    } else {
      loadingAdvertising.value = DataLoad.failed;
    }
  }

  void deleteCreditCardById(int id) {
    final current = creditCard.value;
    if (current != null) {
      current.record.removeWhere((element) => element.id == id);
      creditCard.refresh();
      Helpers.setSnackbar("Holder Deleted!");
    } else {
      Helpers.setSnackbar("Failed remove holder");
    }
  }

  void addTransaction({
    required bool status,
    required int total,
    required DateTime date,
    required String method,
  }) {
    if (history.value != null) {
      history.value!.record.add(
        HistoryList(
          status: status,
          total: total,
          date: date,
          method: method,
        ),
      );

      history.refresh();
    }
  }

  void getEthPrice() async {
    final ethPrice = await ApiServices.fetchEthIdrPrice();
    if (ethPrice != null) {
      priceEth.value = ethPrice;
    }
  }
}
