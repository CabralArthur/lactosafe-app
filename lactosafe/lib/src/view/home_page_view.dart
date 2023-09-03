import 'package:LactoSafe/src/components/food_record_widget.dart';
import 'package:LactoSafe/src/components/custom_text_field.dart';
import 'package:LactoSafe/src/http/http_get_user_record.dart';
import 'package:LactoSafe/src/model/info_food_model.dart';
import 'package:LactoSafe/src/repositories/user_record_repository.dart';
import 'package:LactoSafe/src/shared/app_colors.dart';
import 'package:LactoSafe/src/shared/app_settings.dart';
import 'package:flutter/material.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  FoodModel foodTest = FoodModel(nome: "Creme de Leite", helpText: "_helpText", chanceAlimento: 0, lactoseRisk: 0.0, lactoseRiskStr: 'Teste', userFoodImage: null);
  final UserRecordRepository userRecordsStore = UserRecordRepository(client: HttpGetUserRecord());
  Future<List<FoodModel>>? _recordFuture;

  @override
  void initState(){
    super.initState();
    _recordFuture = getRecordFuture();
    
  }

  Future<List<FoodModel>> getRecordFuture() async {
    await Future.delayed(const Duration(seconds: 2));
    Future<List<FoodModel>> userRecords = userRecordsStore.getUserRecord();
    return userRecords;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(26.0),
        child: SizedBox(
          height: AppSettings.screenHeight,
          child: Column(
            children: [
              //Procure Produtos
              SizedBox(
                width: AppSettings.screenWidth,
                child: Text(
                  'Procure produtos ',
                  style: TextStyle(
                    color: AppColors.grey,
                    fontSize: 24,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w900,
                    letterSpacing: 2.40,
                  ),
                ),
              ),

              SizedBox(
                height: AppSettings.screenHeight / 30,
              ),

              //Barra de Pesquisa

              CustomTextField(
                icon: Icons.search_rounded,
                label: "Pesquisar",
                iconSize: 28.0,
                controller: TextEditingController(),
              ),

              SizedBox(
                height: AppSettings.screenHeight / 20,
              ),

              // Historico de pesquisa
              SizedBox(
                width: AppSettings.screenWidth,
                height: AppSettings.screenHeight / 22,
                child: Text(
                  'Histórico de pesquisa',
                  style: TextStyle(
                    color: AppColors.grey,
                    fontSize: 21,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              FutureBuilder(future: _recordFuture, builder: (context, AsyncSnapshot snapshot){
                if(snapshot.data == null) {
                  return const Center(child: CircularProgressIndicator(),);
                } else {
                  return FoodRecord(userFoodsRecords: snapshot.data, filter: snapshot.data,);
                  
                }
              },)
              
            ],
          ),
        ),
      ),
    );
  }
}
