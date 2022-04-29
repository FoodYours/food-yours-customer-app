import 'package:food_yours_customer/auth/login/controller/login_screen_controller.dart';
import 'package:food_yours_customer/common/model/model.dart';

class OnlineCartModel extends Model {
  final String idToken;
  final String foodId;
  final String quantity;
  final String mealAmount;
  final Map extras;
  final Map supplements;
  final String notes;
  final String deliveryDay;
  final String total;

  OnlineCartModel({
    this.idToken = "",
    this.foodId = "",
    this.quantity = "",
    this.mealAmount = "",
    this.extras = const {},
    this.supplements = const {},
    this.notes = "",
    this.deliveryDay = "",
    this.total = "",
  });

  @override
  Map<String, dynamic> toJSON() {
    return <String, dynamic>{
      "idToken": token,
      "foodId": foodId,
      "sKey": sKey,
      "quantity": quantity,
      "mealAmount": mealAmount,
      "suppliments": supplements,
      "extras": extras,
      "notes": notes,
      "deliveryDay": deliveryDay,
      "total": total,
    };
  }
}
