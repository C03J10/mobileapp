import 'dart:io';
import 'package:riverpod_sample/global_providers.dart'; //import global providers file
import 'package:riverpod/riverpod.dart';

void main() {
  final container = ProviderContainer(); //get all the providers
  final productService = container.read(productServiceProdiver);
  final customerService = container.read(customerServiceProdiver);
  final purchaseService = container.read(purchaseServiceProdiver);

  while (true) {
    print('\nStore Management System');
    print('1. Add a product');
    print('2. View all products');
    print('3. Add a customer');
    print('4. View all customers');
    print('5. Add a purchase');
    print('6. View all purchases');
    print('7. Exit');
    print('Enter your choice:');

    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        print('Enter the product name:');
        String? name = stdin.readLineSync();
        print('Enter the product price:');
        double? price = double.tryParse(stdin.readLineSync() ?? '');
        if (name != null && price != null && name.isNotEmpty) {
          productService.addProduct(name, price);
        } else {
          print('Invalid input. Please try again.');
        }
        break;
      case '2':
        productService.viewProducts();
        break;
      case '3':
        print('Enter the customer name:');
        String? name = stdin.readLineSync();
        print('Enter the customer email:');
        String? email = stdin.readLineSync();
        if (name != null &&
            email != null &&
            name.isNotEmpty &&
            email.isNotEmpty) {
          customerService.addCustomer(name, email);
        } else {
          print('Invalid input. Please try again.');
        }
        break;
      case '4':
        customerService.viewCustomers();
        break;
      case '5':
        print('Enter the customer name:');
        String? customerName = stdin.readLineSync();
        print('Enter the product name:');
        String? productName = stdin.readLineSync();
        if (customerName != null &&
            productName != null &&
            customerName.isNotEmpty &&
            productName.isNotEmpty) {
          purchaseService.addPurchase(customerName, productName);
        } else {
          print('Invalid input. Please try again.');
        }
        break;
      case '6':
        purchaseService.viewPurchases();
        break;
      case '7':
        print('Exiting the application...');
        return;
      default:
        print('Invalid choice. Please try again.');
    }
  }
}
