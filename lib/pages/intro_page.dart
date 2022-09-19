import 'package:flutter/material.dart';
import 'package:my_real_project/pages/intro_provider.dart';
import 'package:provider/provider.dart';
import '../views/intro_view.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => IntroProvider(),
      builder: (context, child) {

        var introProvider = Provider.of<IntroProvider>(context, listen: false);
        introProvider.list.length = 4;

        return Scaffold(
          backgroundColor: const Color(0xffF8F8F8),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              TextButton(onPressed: (){},
                  child: const Text('Пропустить', style: TextStyle(fontSize: 18),)
              ),
              const SizedBox(width: 20,),
            ],
          ),
          body: Stack(
            alignment: Alignment.bottomLeft,
            children: [

              //#main
              PageView(
                controller: introProvider.pageController,
                onPageChanged: introProvider.onPageChanged,
                children: const [
                  IntroView(image:  "assets/images/image_one.png",
                           title:   "Приобретайте в рассрочку \nс ZPAY менее чем за 2 минуты",
                           content: "Покупайте сейчас и платите равными частями в срок до 6 месяцев! Пройдите быструю регистрацию, имея толькоПаспорт и платежную карту "
                  ),
                  IntroView(image:  "assets/images/image_two.png",
                      title:   "Откройте для себя множествопартнерских магазинов с товарами именно для вас",
                      content: "Находите магазины по категориям, локациям и вдохновляйтесь на новые покупки! "
                  ),
                  IntroView(image:  "assets/images/image_three.png",
                      title:   "Наслаждайтесь  вашей покупкой с приятными бонусами от ZPAY",
                      content: "Совершайте покупки у наших партнеров и с приятным кешбеком от ZPAY"
                  ),
                  IntroView(image:  "assets/images/image_four.png",
                      title:   "Просматривайте и управляйте своими покупками!",
                      content: "Просматривайте свои прошлые и текущие договора, и платежи. Управляйте своими данными в едином приложении"
                  ),
                ],

              ),

              //#animatedContainer
              Padding(
                padding: const EdgeInsets.only(bottom: 25, left: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                    introProvider.list.length, (index) {
                      return Consumer<IntroProvider>(builder: (context, provider, child) {
                        return introProvider.currentPage != 3 ? AnimatedContainer(
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          duration: const Duration(milliseconds: 200),
                          height: 7.5,
                          width: index == provider.currentPage ? 35 : 7.5,
                          decoration: BoxDecoration(
                            color: index == provider.currentPage ? Colors.indigo : Colors.grey,
                            borderRadius: BorderRadius.circular(3.75),
                          ),
                        ): const SizedBox.shrink();
                      });
                    },
                  ),
                ),
              ),

             //#button Пройти регистрацию
             Consumer<IntroProvider>(
               builder: (context, provider, child){
                 return  introProvider.currentPage == 3 ? Padding(
                   padding: const EdgeInsets.only(left: 35, right: 35, bottom: 20),
                   child: ElevatedButton(onPressed: (){},
                     style: ElevatedButton.styleFrom(
                       backgroundColor: Colors.indigo,
                       minimumSize: const Size(double.infinity, 50),
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(10)
                       )
                     ),
                     child: const Text("Пройти регистрацию", style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w400, ),),

                   ),
                 ):
                 const SizedBox.shrink();
               },
             )
            ],
          )
        );
      }
    );
  }
}
