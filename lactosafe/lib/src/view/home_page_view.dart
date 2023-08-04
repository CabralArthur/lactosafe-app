import 'package:LactoSafe/src/components/custom_text_field.dart';
import 'package:LactoSafe/src/components/photo_widget.dart';
import 'package:LactoSafe/src/shared/app_colors.dart';
import 'package:LactoSafe/src/shared/app_images.dart';
import 'package:LactoSafe/src/shared/app_settings.dart';
import 'package:flutter/material.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  @override
  Widget build(BuildContext Context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(26.0),
        child: Column(
          children: [
            //Procure Produtos
            SizedBox(
              width: AppSettings.screenWidth,
              child: const Text(
                'Procure produtos ',
                style: TextStyle(
                  color: Color(0xC11E1E1E),
                  fontSize: 24,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2.40,
                ),
              ),
            ),
      
            SizedBox(height: AppSettings.screenHeight/30,),
      
            //Barra de Pesquisa
      
            const CustomTextField(icon: Icons.search_rounded, label: "Pesquisar", iconSize: 28.0,),
      
            SizedBox(height: AppSettings.screenHeight/20,),
      
            // Historico de pesquisa
           SizedBox(
              width: AppSettings.screenWidth,
              height: AppSettings.screenHeight/22,
              child: const Text(
                'Histórico de pesquisa',
                style: TextStyle(
                  color: Color(0xC11E1E1E),
                  fontSize: 21,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
      
            // filtro de pesquisa
      
            SizedBox(
              height: AppSettings.screenHeight/12,
                child:
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row (children: <Widget>[ 
                            buildFilter('MUITO ALTO'),
                      buildFilter('ALTO'),
                      buildFilter('MÉDIO'),
                      buildFilter('BAIXO'),
                      buildFilter('INEXISTENTE'),
                      ],
            
                    )),  
              
              ),
            Expanded(child: ListView(scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      buildFoodCard()

                    ],),)
          ],
        ),
      ),
    );
  }

  Widget buildFilter(String filterName) => Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(12),
        width: AppSettings.screenWidth/4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), 
          color: Colors.white,
          boxShadow: [BoxShadow(color: AppColors.shadow, blurRadius: 10, offset: Offset.fromDirection(-2, -5), spreadRadius: 0.1, blurStyle: BlurStyle.normal )]
          ),
        child: Center(child: Text(filterName)),);
}

Widget buildFoodCard() => Stack(
  alignment: Alignment.center,

  children: [
        Container(
      alignment: Alignment.topCenter,
    
            margin: const EdgeInsets.all(12),
    
            width: AppSettings.screenWidth/2+40,
    
            decoration: BoxDecoration(
    
              borderRadius: BorderRadius.circular(30), 
    
              color: Colors.white,
    
              boxShadow: [BoxShadow(color: AppColors.shadow, blurRadius: 10, offset: Offset.fromDirection(-2, -5), spreadRadius: 0.1, blurStyle: BlurStyle.normal )]
    
              ), child: Stack(
    
                alignment: Alignment.topCenter, 
    
                children: [Container(
    
                  height: AppSettings.screenHeight/4,
    
                  width: AppSettings.screenWidth/2,
    
                  decoration: BoxDecoration(
    
              borderRadius: BorderRadius.circular(30), 
    
              color: AppColors.grey,
    
              boxShadow: [BoxShadow(color: AppColors.shadow, blurRadius: 10, offset: Offset.fromDirection(-2, -5), spreadRadius: 0.1, blurStyle: BlurStyle.normal )]
    
              )
    
                  ), 
    
                  PhotoWidget(picture: AppImages.cremeDeLeite, height: AppSettings.screenHeight/6,),
    
                  Container(
    
                  height: AppSettings.screenHeight/6,
    
                  decoration: BoxDecoration(
    
                    color: Colors.white, 
    
                    shape: BoxShape.circle,
    
                    image: DecorationImage(image: AssetImage(AppImages.cremeDeLeite,), fit: BoxFit.contain)),
    
                  
    
                  )
    
                  
    
                  ]),
    
    ),
  ],
);
