import 'package:LactoSafe/src/controller/Info_food_controllers/info_food_controller.dart';
import 'package:LactoSafe/src/model/info_food_model.dart';
import 'package:LactoSafe/src/shared/app_colors.dart';
import 'package:flutter/material.dart';
import '../components/info_food_widgets/build_food_information.dart';

class InfoFoodPage extends StatefulWidget {
  const InfoFoodPage({super.key});
  static const routeName = '/InfoAlimento';

  @override
  State<InfoFoodPage> createState() => _InfoFoodPageState();
}

class _InfoFoodPageState extends State<InfoFoodPage> {
  Future<FoodModel>? _future;

  @override
  void initState() {
    super.initState();
    _future = myFuture();
  }

  Future<FoodModel> myFuture() async {
    await Future.delayed(const Duration(seconds: 2));
    // ignore: use_build_context_synchronously
    final food = ModalRoute.of(context)!.settings.arguments as FoodModel;
    Future<FoodModel> foodRisk = getFoodRisk(food: food);
    
   return foodRisk;
  }

  @override
  Widget build(BuildContext context) {
    final food = ModalRoute.of(context)!.settings.arguments as FoodModel;
    getFoodRisk(food: food);
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_rounded),
            color: AppColors.orange,
            iconSize: 40.0,
            alignment: Alignment.topLeft,
          ),
        ),
        body: FutureBuilder(future: _future, builder: (context, AsyncSnapshot snapshot) {
          if(snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return buildFoodInformation(food: food);
          }
        }
        ));
        
        
            
  }
}
