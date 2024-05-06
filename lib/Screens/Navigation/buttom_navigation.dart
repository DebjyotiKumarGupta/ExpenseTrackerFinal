import 'package:expenseapp/Screens/Home/home_screen.dart';
import 'package:expenseapp/Screens/Transaction/transaction_screen.dart';
import 'package:get/get.dart';

class ButtomNavigationController extends GetxController {
  final RxInt pageIndex = 0.obs;
  List pageList = [
    const HomeScreen(),
    const TransactionDcreen(),
  ];
}
