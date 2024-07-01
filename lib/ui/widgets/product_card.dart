import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba_veflat/main/domain/entities/character.dart';
import 'package:prueba_veflat/main/presentation/getx/main_controller.dart';
import 'package:prueba_veflat/ui/theme.dart';
import 'package:shimmer/shimmer.dart';

class ProductCard extends StatelessWidget {
  final Character character;
  final bool? favorite;
  final bool? loading;
  final Function() onTap;
  
  ProductCard(
    {super.key,  
    required this.onTap, 
    required this.character, 
    this.loading,
    this.favorite
    }
  );

  MainController mainController = Get.find();

  //const MyButton({Key? key, required this.label, required this.onTap}):super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child:Container(
        width: 190,
        child: loading!=true?Column(
          children: [
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: grey,
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.network(
                        height: 250,
                        width: 190,
                        character.image!,
                        fit: BoxFit.fill,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: SizedBox(
                              width: 190.0,
                              height: 250,
                              child: Shimmer.fromColors(
                                baseColor: Color.fromARGB(255, 206, 206, 206),
                                highlightColor: Color.fromARGB(255, 152, 152, 152),
                                child:  Container(
                                  decoration: BoxDecoration(
                                  color: white,
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                )
                                
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Positioned(
                      top:15,
                      right: 15,
                      child: GestureDetector(
                        child: (favorite??false)?Icon(FluentIcons.heart_28_filled, size: 30,):Icon(FluentIcons.heart_28_regular, size: 30,),
                        onTap: () {
                          mainController.addRemoveFromFavorites(character.id);
                          mainController.refreshProducts();
                        },
                      )
                    ),
                  ],
                ),
            ),
            Column(
            children: [
              Container(
                height: 55,
                padding: const EdgeInsets.symmetric(vertical: 11.0),
                child: Center(
                  child: Text(character.name!,
                  textAlign: TextAlign.center,
                  style: productCardNameTextStyle,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  ),
                ),
              ),
              Text("€"+(character.name!.length*10).toString(),
              textAlign: TextAlign.center,
              style: productCardPriceTextStyle,
              ),
            ],
          )
          ],
        ):Column(
          children: [
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: grey,
                ),
                child: SizedBox(
                  width: 190.0,
                  height: 250,
                  child: Shimmer.fromColors(
                    baseColor: Color.fromARGB(255, 206, 206, 206),
                    highlightColor: Color.fromARGB(255, 152, 152, 152),
                    child:  Container(
                      decoration: BoxDecoration(
                      color: white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                    )
                    
                  ),
                ),
            ),
            Column(
            children: [
              Container(
                height: 35,
                width: 160,
                padding: const EdgeInsets.symmetric(vertical: 11.0),
                margin: const EdgeInsets.only(bottom: 5.0, top: 11),
                child: SizedBox(
                  height: 20,
                  child: Shimmer.fromColors(
                    baseColor: Color.fromARGB(255, 206, 206, 206),
                    highlightColor: Color.fromARGB(255, 152, 152, 152),
                    child:  Container(
                      decoration: BoxDecoration(
                      color: white,
                      ),
                    )
                    
                  ),
                ),
              ),
              SizedBox(
                  height: 13,
                  width: 50,
                  child: Shimmer.fromColors(
                    baseColor: Color.fromARGB(255, 206, 206, 206),
                    highlightColor: Color.fromARGB(255, 152, 152, 152),
                    child:  Container(
                      decoration: BoxDecoration(
                      color: white,
                      ),
                    )
                    
                  ),
                ),
            ],
          )
          ],
        ),
      ),
    );
  }
}