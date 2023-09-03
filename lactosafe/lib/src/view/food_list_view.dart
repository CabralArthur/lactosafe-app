import 'dart:io';
import 'package:LactoSafe/src/http/http_client.dart';
import 'package:LactoSafe/src/model/info_food_model.dart';
import 'package:LactoSafe/src/repositories/food_recognation_repository.dart';
import 'package:LactoSafe/src/shared/app_colors.dart';
import 'package:LactoSafe/src/shared/app_settings.dart';
import 'package:flutter/material.dart';

class FoodListView extends StatefulWidget {
  const FoodListView({super.key});
  static const routeName = '/foodlist';

  @override
  State<FoodListView> createState() => _FoodListViewState();
}

class _FoodListViewState extends State<FoodListView> {
  final FoodRecognizedRepository foodStore =
      FoodRecognizedRepository(client: HttpClientFoodRecognation());
  Future<List<FoodModel>>? _future;

  @override
  void initState() {
    super.initState();
    _future = myFuture();
  }

  Future<List<FoodModel>> myFuture() async {
    await Future.delayed(const Duration(seconds: 2));
    // ignore: use_build_context_synchronously
    final foodImage = ModalRoute.of(context)!.settings.arguments as File;
    Future<List<FoodModel>> foodsRecognized = foodStore.getFoodsRecognation(image: foodImage);
    
   return foodsRecognized;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, '/home');
          },
          icon: const Icon(Icons.arrow_back_rounded),
          color: AppColors.orange,
          iconSize: 40.0,
          alignment: Alignment.topLeft,
        ),
      ),
      body: FutureBuilder(
        future: _future,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  SizedBox(
                    width: AppSettings.screenWidth,
                    height: AppSettings.screenHeight / 5.5,
                    child: const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Lista de ',
                            style: TextStyle(
                              color: Color(0xC11E1E1E),
                              fontSize: 32,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          TextSpan(
                            text: 'Possíveis Alimentos ',
                            style: TextStyle(
                              color: Color(0xFFFF7F2B),
                              fontSize: 32,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          TextSpan(
                            text: 'identificados!\n',
                            style: TextStyle(
                              color: Color(0xBF1E1E1E),
                              fontSize: 32,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return listFoodWidget(
                            context: context,
                            foods: snapshot.data,
                            index: index);
                      },
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    width: AppSettings.screenWidth,
                    height: AppSettings.screenHeight / 10,
                    child: Text(
                      'Nenhum alimento é o correto?\n',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.grey,
                        fontSize: 20,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),

                  
                  Container(
                    alignment: Alignment.center,
                    width: AppSettings.screenWidth / 2,
                    height: AppSettings.screenHeight / 15,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 0.50, color: AppColors.grey),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: InkWell(
                      onTap: () {

                        Navigator.popAndPushNamed(context, "/missingPage");
                      },
                      borderRadius: const BorderRadius.all(Radius.circular(25)),
                      child: SizedBox(
                        width: AppSettings.screenWidth / 2,
                        height: AppSettings.screenHeight / 15,
                        child: Center(
                          child: Text(
                            'Não',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.grey,
                              fontSize: 18,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

Widget listFoodWidget(
    {required BuildContext context,
    required List<FoodModel> foods,
    required int index}) {
  debugPrint(foods[index].getFoodName); //debug
  double cardHeight = AppSettings.screenHeight / 5.5;
  return Container(
    padding: const EdgeInsets.all(8.0),
    margin: const EdgeInsets.all(12),
    height: cardHeight,
    width: AppSettings.screenWidth / 2,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: AppColors.shadow,
              blurRadius: 10,
              offset: Offset.fromDirection(-2, -5),
              spreadRadius: 0.1,
              blurStyle: BlurStyle.normal)
        ]),
    child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: () {
            Navigator.pushNamed(context, '/InfoAlimento',
                arguments: foods[index]);
          },
          splashColor: AppColors.shadow,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ClipPath(
                clipper: const ShapeBorderClipper(shape: CircleBorder()),
                clipBehavior: Clip.hardEdge,
                child: foods[index].getImageUrl != null
                    ? Image.network(foods[index].getImageUrl as String,
                        width: AppSettings.screenWidth / 4,
                        height: AppSettings.screenHeight / 2,
                        fit: BoxFit.cover)
                    : Container(
                        width: AppSettings.screenWidth / 4,
                        height: AppSettings.screenHeight / 2,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: AppColors.grey, shape: BoxShape.circle),
                        child: const Text(
                          "Erro ao carregar imagem",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
              ),
             
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    width: AppSettings.screenWidth / 3,
                    child: Text(
                      foods[index].getFoodName,
                      style: TextStyle(
                        color: AppColors.grey,
                        fontSize: 22,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '${foods[index].getChanceAlimento}% ',
                            style: TextStyle(
                              color: AppColors.orange,
                              fontSize: 16,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: 'de chance.',
                            style: TextStyle(
                              color: AppColors.grey,
                              fontSize: 16,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: cardHeight / 3,
                  ),
                  Text(
                    'Clique para ver mais',
                    style: TextStyle(
                      color: AppColors.orange,
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              )
            ],
          ),
        )),
  );
}
