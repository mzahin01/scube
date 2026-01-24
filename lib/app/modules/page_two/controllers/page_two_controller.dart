import 'package:get/get.dart';

class PageTwoController extends GetxController {
  // Tab states
  final selectedMainTab = 0.obs; // 0: Summery, 1: SLD, 2: Data
  final selectedSourceTab = 0.obs; // 0: Source, 1: Load

  // Power data
  final totalPower = '5.53 kw'.obs;

  // Data list
  final dataList = <DataItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadDataList();
  }

  void loadDataList() {
    dataList.value = [
      DataItem(
        title: 'Data View',
        isActive: true,
        data1: '55505.63',
        data2: '58805.63',
        iconColor: DataIconColor.blue,
      ),
      DataItem(
        title: 'Data Type 2',
        isActive: true,
        data1: '55505.63',
        data2: '58805.63',
        iconColor: DataIconColor.orange,
      ),
      DataItem(
        title: 'Data Type 3',
        isActive: false,
        data1: '55505.63',
        data2: '58805.63',
        iconColor: DataIconColor.blue,
      ),
    ];
  }

  void setMainTab(int index) {
    selectedMainTab.value = index;
  }

  void setSourceTab(int index) {
    selectedSourceTab.value = index;
  }

  void onBackTap() {
    Get.back();
  }

  void onNotificationTap() {
    Get.snackbar('Info', 'Notifications');
  }

  void onNavigateToFirstPage() {
    Get.back();
  }

  void onQuickActionTap(String action) {
    Get.snackbar('Action', '$action tapped');
  }

  void onDataItemTap(DataItem item) {
    Get.snackbar('Data', '${item.title} tapped');
  }
}

enum DataIconColor { blue, orange }

class DataItem {
  final String title;
  final bool isActive;
  final String data1;
  final String data2;
  final DataIconColor iconColor;

  DataItem({
    required this.title,
    required this.isActive,
    required this.data1,
    required this.data2,
    required this.iconColor,
  });
}
