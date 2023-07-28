import 'dart:io';
import 'package:LactoSafe/src/controller/info_food_controller.dart';
import 'package:LactoSafe/src/model/info_food_model.dart';
import 'package:LactoSafe/src/shared/app_colors.dart';
import 'package:flutter/material.dart';

class InfoFoodPage extends StatefulWidget {
  const InfoFoodPage({super.key});
  static const routeName = '/InfoAlimento';

  @override
  State<InfoFoodPage> createState() => _InfoFoodPageState();
}

class _InfoFoodPageState extends State<InfoFoodPage> {

  
  late Future _dataFoodInformation;
  late final File? _foodImage = Foods[0].getImage;

  @override
  void initState(){
    super.initState();
    _dataFoodInformation = setFoodInformation(_foodImage);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, '/home');
          },
          icon: Icon(Icons.arrow_back_rounded),
          color: AppColors.orange,
          iconSize: 40.0,
          alignment: Alignment.topLeft,
        ),
      ),
      body: FutureBuilder(
        future: _dataFoodInformation,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
            
          } else {
            return buildFoodInformation(food: Foods[0]);
          }
        },
      ),
    );
  }

  Widget buildFoodInformation({required InfoFood food}) {
    File? foodImage = food.getImage;
    return Container(
      padding: const EdgeInsets.all(30.0),
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Food Name
            SizedBox(
              width: 262,
              height: 100,
              child: Text(
                food.getFoodName,
                //'Creme de leite sem lactose',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.grey,
                  fontSize: 36,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w900,
                ),
              ),
            ), 
            
            Stack(
              alignment: Alignment.center,
              children: 
              <Widget>[
                Container(width: 284, height: 267.67, child: ClipPath(
                clipper: const ShapeBorderClipper(shape: CircleBorder()),
                clipBehavior: Clip.hardEdge,
                child: foodImage != null
                ? Image.file(File(foodImage.path),
                    width: 284, height: 267.67, fit: BoxFit.fitWidth)
                : const Text("Erro ao exibir imagem"),
            ),), 

            Stack(
              alignment: Alignment.topRight, 
              children: <Widget>[ Column(children: [Align(alignment: Alignment.centerRight, child: FloatingActionButton(backgroundColor: AppColors.orange, onPressed: () {}, child: Icon(Icons.favorite),),),
              const SizedBox(height: 10.0,),
              Align(alignment: Alignment.bottomRight, child: FloatingActionButton(backgroundColor: AppColors.orange, onPressed: () {}, child: Icon(Icons.question_mark_sharp),),)],) 
              ],
              ) 
            
            ]),
            // Container(
            //   color: AppColors.orange, 
            //   height: AppSettings.screenHeight/10, 
            //   child: const Text("Teste"),
            //   ),
          
      // TESTE
            // Container(
            //   width: 390,
            //   height: 844,
            //   clipBehavior: Clip.antiAlias,
            //   decoration: ShapeDecoration(
            //     color: Color.fromARGB(255, 60, 179, 114),
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(30),
            //     ),
            //   ),
            //   child: Stack(
            //     children: [
            //       Positioned(
            //         left: -0,
            //         top: 0,
            //         child: Container(
            //           width: 390,
            //           height: 865,
            //           child: Stack(
            //             children: [
            //               Positioned(
            //                 left: 0,
            //                 top: 0,
            //                 child: Container(
            //                   width: 390,
            //                   height: 865,
            //                   decoration: ShapeDecoration(
            //                     color: Colors.white
            //                         .withOpacity(0.8999999761581421),
            //                     shape: RoundedRectangleBorder(
            //                       borderRadius: BorderRadius.only(
            //                         topLeft: Radius.circular(30),
            //                         topRight: Radius.circular(30),
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //               Positioned(
            //                 left: 57,
            //                 top: 185,
            //                 child: Container(
            //                   width: 284,
            //                   height: 267.67,
            //                   child: Stack(
            //                     children: [
            //                       Positioned(
            //                         left: 0,
            //                         top: 0,
            //                         child: Container(
            //                           width: 284,
            //                           height: 267.67,
            //                           decoration: ShapeDecoration(
            //                             color: Color(0xFFD9D9D9),
            //                             shape: OvalBorder(),
            //                           ),
            //                         ),
            //                       ),

            //                       //Creme de Leite
            //                       Positioned(
            //                         left: -4,
            //                         top: -18,
            //                         child: Container(
            //                           width: 293,
            //                           height: 286,
            //                           decoration: BoxDecoration(
            //                             image: DecorationImage(
            //                               image: AssetImage(
            //                                   "assets/images/CremeDeLeite.png"),
            //                               fit: BoxFit.fill,
            //                             ),
            //                           ),
            //                         ),
            //                       ),
            //                     ],
            //                   ),
            //                 ),
            //               ),

            //               //Texto Risco de Conter lactose
            //               const Positioned(
            //                 left: 34,
            //                 top: 540,
            //                 child: SizedBox(
            //                   width: 339,
            //                   height: 60,
            //                   child: Text.rich(
            //                     TextSpan(
            //                       children: [
            //                         TextSpan(
            //                           text: 'Riscos de conter lactose: ',
            //                           style: TextStyle(
            //                             color: Color(0x991E1E1E),
            //                             fontSize: 20,
            //                             fontFamily: 'Roboto',
            //                             fontWeight: FontWeight.w900,
            //                           ),
            //                         ),
            //                         TextSpan(
            //                           text: 'inexistente',
            //                           style: TextStyle(
            //                             color: Color(0xFF27DF00),
            //                             fontSize: 20,
            //                             fontFamily: 'Roboto',
            //                             fontWeight: FontWeight.w900,
            //                           ),
            //                         ),
            //                       ],
            //                     ),
            //                     textAlign: TextAlign.center,
            //                   ),
            //                 ),
            //               ),

            //               // Buscar no mapa
            //               const Positioned(
            //                 left: 25,
            //                 top: 726,
            //                 child: SizedBox(
            //                   width: 339,
            //                   height: 56,
            //                   child: Text.rich(
            //                     TextSpan(
            //                       children: [
            //                         TextSpan(
            //                           text: 'Buscar no mapa: \n',
            //                           style: TextStyle(
            //                             color: Color(0x991E1E1E),
            //                             fontSize: 20,
            //                             fontFamily: 'Roboto',
            //                             fontWeight: FontWeight.w900,
            //                           ),
            //                         ),

            //                         // Link Para alimento diferente
            //                         TextSpan(
            //                           text: 'Creme de leite sem lactose',
            //                           style: TextStyle(
            //                             color: Color(0x99ED5500),
            //                             fontSize: 20,
            //                             fontFamily: 'Roboto',
            //                             fontWeight: FontWeight.w900,
            //                           ),
            //                         ),
            //                       ],
            //                     ),
            //                     textAlign: TextAlign.center,
            //                   ),
            //                 ),
            //               ),

            //               // barra de risco
            //               Positioned(
            //                 left: 41,
            //                 top: 442,
            //                 child: Container(
            //                   width: 311,
            //                   height: 284,
            //                   child: Stack(
            //                     children: [
            //                       Positioned(
            //                         left: 12,
            //                         top: 40.67,
            //                         child: Container(
            //                           width: 299,
            //                           height: 17.96,
            //                           decoration: ShapeDecoration(
            //                             gradient: const LinearGradient(
            //                               begin: Alignment(-1.00, -0.00),
            //                               end: Alignment(1, 0),
            //                               colors: [
            //                                 Color(0xFFDB1212),
            //                                 Color(0xFFF9FF00),
            //                                 Color(0xFF05FF00)
            //                               ],
            //                             ),
            //                             shape: RoundedRectangleBorder(
            //                               borderRadius:
            //                                   BorderRadius.circular(20),
            //                             ),
            //                           ),
            //                         ),
            //                       ),
            //                       Positioned(
            //                         left: 0,
            //                         top: 5,
            //                         child: Container(width: 30, height: 28.35),
            //                       ),
            //                       Positioned(
            //                         left: 10,
            //                         top: 169,
            //                         child: SizedBox(
            //                           width: 288,
            //                           height: 115,
            //                           child: Text(
            //                             'Mesmo não contendo lactose, os alérgicos a proteína do leite não podem ingeri-lo.',
            //                             textAlign: TextAlign.center,
            //                             style: TextStyle(
            //                               color: Color(0x991E1E1E),
            //                               fontSize: 18,
            //                               fontFamily: 'Roboto',
            //                               fontWeight: FontWeight.w400,
            //                             ),
            //                           ),
            //                         ),
            //                       ),
            //                       Positioned(
            //                         left: 0,
            //                         top: 0,
            //                         child: Container(
            //                           width: 35,
            //                           height: 35,
            //                           child: Stack(
            //                             children: [
            //                               Positioned(
            //                                 left: 0,
            //                                 top: 0,
            //                                 child: Container(
            //                                   width: 35,
            //                                   height: 35,
            //                                   decoration: ShapeDecoration(
            //                                     color: Color(0x00ED5500),
            //                                     shape: OvalBorder(
            //                                       side: BorderSide(
            //                                           width: 1,
            //                                           color: Color(0xFFED5500)),
            //                                     ),
            //                                   ),
            //                                 ),
            //                               ),
            //                               Positioned(
            //                                 left: 9.33,
            //                                 top: 10.50,
            //                                 child: Container(
            //                                   width: 5.83,
            //                                   height: 7,
            //                                   decoration: ShapeDecoration(
            //                                     color: Color(0xFFED5500),
            //                                     shape: OvalBorder(),
            //                                   ),
            //                                 ),
            //                               ),
            //                               Positioned(
            //                                 left: 19.83,
            //                                 top: 10.50,
            //                                 child: Container(
            //                                   width: 5.83,
            //                                   height: 7,
            //                                   decoration: ShapeDecoration(
            //                                     color: Color(0xFFED5500),
            //                                     shape: OvalBorder(),
            //                                   ),
            //                                 ),
            //                               ),
            //                             ],
            //                           ),
            //                         ),
            //                       ),
            //                     ],
            //                   ),
            //                 ),
            //               ),
            //               Positioned(
            //                 left: 281,
            //                 top: 185,
            //                 child: Container(
            //                   width: 60,
            //                   height: 60,
            //                   child: Stack(
            //                     children: [
            //                       Positioned(
            //                         left: 0,
            //                         top: 0,
            //                         child: Container(
            //                           width: 60,
            //                           height: 60,
            //                           decoration: ShapeDecoration(
            //                             color: Colors.white,
            //                             shape: OvalBorder(),
            //                             shadows: [
            //                               BoxShadow(
            //                                 color: Color(0x0C1E1E1E),
            //                                 blurRadius: 20,
            //                                 offset: Offset(0, 10),
            //                                 spreadRadius: 10,
            //                               )
            //                             ],
            //                           ),
            //                         ),
            //                       ),
            //                       Positioned(
            //                         left: 18,
            //                         top: 20,
            //                         child: Container(
            //                           width: 23.75,
            //                           height: 22.72,
            //                           child: Stack(children: []),
            //                         ),
            //                       ),
            //                     ],
            //                   ),
            //                 ),
            //               ),
            //               Positioned(
            //                 left: 288,
            //                 top: 259,
            //                 child: Container(
            //                   width: 46,
            //                   height: 46,
            //                   child: Stack(
            //                     children: [
            //                       Positioned(
            //                         left: 0,
            //                         top: 0,
            //                         child: Container(
            //                           width: 46,
            //                           height: 46,
            //                           decoration: ShapeDecoration(
            //                             color: Colors.white,
            //                             shape: OvalBorder(),
            //                             shadows: [
            //                               BoxShadow(
            //                                 color: Color(0x0C1E1E1E),
            //                                 blurRadius: 20,
            //                                 offset: Offset(0, 10),
            //                                 spreadRadius: 10,
            //                               )
            //                             ],
            //                           ),
            //                         ),
            //                       ),
            //                       Positioned(
            //                         left: 8.43,
            //                         top: 8.43,
            //                         child: Container(
            //                           width: 29.13,
            //                           height: 29.13,
            //                           decoration: ShapeDecoration(
            //                             shape: OvalBorder(
            //                               side: BorderSide(
            //                                   width: 0.50,
            //                                   color: Color(0xFFED5500)),
            //                             ),
            //                           ),
            //                         ),
            //                       ),
            //                       Positioned(
            //                         left: 19.93,
            //                         top: 9.97,
            //                         child: SizedBox(
            //                           width: 6.13,
            //                           height: 14.57,
            //                           child: Text(
            //                             '?',
            //                             textAlign: TextAlign.center,
            //                             style: TextStyle(
            //                               color: Color(0xFFED5500),
            //                               fontSize: 25,
            //                               fontFamily: 'Roboto',
            //                               fontWeight: FontWeight.w200,
            //                             ),
            //                           ),
            //                         ),
            //                       ),
            //                     ],
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //       Positioned(
            //         left: 22,
            //         top: 28,
            //         child: Container(
            //           width: 45,
            //           height: 42,
            //           clipBehavior: Clip.antiAlias,
            //           decoration: BoxDecoration(),
            //           child: Stack(children: []),
            //         ),
            //       ),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
