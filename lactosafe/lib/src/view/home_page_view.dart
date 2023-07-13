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
      body: ListView(
        padding: const EdgeInsets.all(26.0),
        children: [
          //Procure Produtos
          const SizedBox(
            width: 264,
            child: Text(
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

          //Barra de Pesquisa
          SizedBox(
            width: 337,
            height: 56,
            child: Stack(
              children: [
                Positioned(
                    left: 0,
                    right: 0,
                    child: Container(
                      width: 337,
                      height: 56,
                      decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          color: const Color(0x66D9D9D9)),
                    )),
                Positioned(
                  left: 18,
                  top: 17,
                  child: SizedBox(
                    width: 25.32,
                    height: 22,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 22,
                            height: 22,
                            decoration: const ShapeDecoration(
                              shape: OvalBorder(
                                side: BorderSide(
                                    width: 1, color: Color(0xC11E1E1E)),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 19.47,
                          top: 17.51,
                          child: Transform(
                            transform: Matrix4.identity()
                              ..translate(0.0, 0.0)
                              ..rotateZ(0.63),
                            child: Container(
                              width: 7.24,
                              decoration: const ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 1,
                                    strokeAlign: BorderSide.strokeAlignCenter,
                                    color: Color(0xC11E1E1E),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Positioned(
                  left: 64,
                  top: 17,
                  child: SizedBox(
                    width: 180,
                    height: 18,
                    child: Text(
                      'Pesquisar',
                      style: TextStyle(
                        color: Color(0x991E1E1E),
                        fontSize: 18,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Historico de pesquisa
          const SizedBox(
            width: 212,
            height: 34,
            child: Text(
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
          // SizedBox(
          //   //height: 26,
          //   child: ListView(
          //     scrollDirection: Axis.horizontal,
          //     children: <Widget>[
          //       buildFilter('MUITO ALTO'),
          //       buildFilter('ALTO'),
          //       buildFilter('ALTO'),
          //       buildFilter('ALTO'),
          //       buildFilter('ALTO')
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }

  Widget buildFilter(String filterName) => SizedBox(
        width: 65,
        height: 26,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 65,
                height: 26,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 0,
              top: 0,
              child: SizedBox(
                width: 65,
                height: 26,
                child: Text(
                  'teste',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF1E1E1E),
                    fontSize: 10,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
