import 'package:riverpod/riverpod.dart';
import 'package:riverpod_sample/services/customer_service.dart';
import 'package:riverpod_sample/services/product_service.dart';
import 'package:riverpod_sample/services/purchase_service.dart';

final productServiceProdiver = Provider((ref) => ProductService(ref));
final customerServiceProdiver = Provider((ref) => CustomerService(ref));
final purchaseServiceProdiver = Provider((ref) => PurchaseService(ref));
