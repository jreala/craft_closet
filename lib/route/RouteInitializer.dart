import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:craft_closet/route/NavBarRoutes.dart';
import 'package:craft_closet/view/DashboardView.dart';
import 'package:craft_closet/view/InventoryView.dart';
import 'package:craft_closet/view/InvoiceView.dart';
import 'package:craft_closet/view/OrderFormView.dart';
import 'package:craft_closet/view/TransactionHistoryView.dart';

class RouteInitializer {
  final Map<String, WidgetBuilder> _routes = Map<String, WidgetBuilder>();
  static List<String> _routeNames = List<String>();

  RouteInitializer(BuildContext context) {
    _addRoute(NavBarRoutes.dashboard, (context) => DashboardView());
    _addRoute(NavBarRoutes.inventory, (context) => InventoryView());
    _addRoute(NavBarRoutes.invoice, (context) => InvoiceView());
    _addRoute(NavBarRoutes.orderForm, (context) => OrderFormView());
    _addRoute(NavBarRoutes.transactionHistory, (context) => TransactionHistoryView());
  }

  void _addRoute(String route, WidgetBuilder view) {
    _routes[route] = view;
    _routeNames.add(route);
  }

  Map<String, WidgetBuilder> build() {
    return _routes;
  }

  static String getRoute(int index) {
    if(_routeNames.length < index) {
      return '/dashboard';
    }

    return _routeNames[index];
  }
}