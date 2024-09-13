import 'package:flutter/material.dart';
import 'package:test111/core_widgets/textfields/search_field.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController controller =TextEditingController();
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed, // Allows more than 3 items
          currentIndex: 0,
          onTap: (i){
            if(i==4){
              Navigator.pushNamed(context, '/profile');
            }
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket),
              label: 'My order',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_sharp),
              label: 'Place an Ad',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'My Account',
            ),
          ],
          selectedItemColor: hexToColor('#2D2B75'), // Active item color
          unselectedItemColor: hexToColor('#2D2B75'), // Inactive item color
        ),

        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 14,),
              Container(
                  width:90,
                  height:38,child: Image.asset('assets/images/img1.jpeg')),
              Divider(color: Colors.black,),
              SizedBox(height: 14,),
              SizedBox(
                height: 30,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: ListView.separated(
                    separatorBuilder: (context,i){
                      return SizedBox(width: 10);
                    },
                    shrinkWrap: true,

                    scrollDirection: Axis.horizontal,

                    itemCount: 20,
                    itemBuilder: (context,i){
                      return Text('Manunath',style: TextStyle(
                        color: hexToColor('#202020'),
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                      ),);
                    },

                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Container(
                  height: 40,
                    child: SearchField(textEditingController:controller,label: 'Search',)),
              ),
              ListView.separated(
                separatorBuilder: (context,i){
                  return SizedBox(width: 10);
                },
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),


                itemCount: 2,
                itemBuilder: (context,i){
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       SizedBox(height: 13,),

                        Text('UAE pays tribute to life and legacy of Sheikh Khalifa',style: TextStyle(
                            color: hexToColor('#051F32'),
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),),
                        SizedBox(height: 5,),

                        Text('UAE remembers Sheikh Khalifa bin Zayed Al Nahyan on anniversary of his death',style: TextStyle(
                            color: hexToColor('#707070'),
                            fontSize: 12,
                            fontWeight: FontWeight.bold
                        ),),
                        SizedBox(height: 12,),
                        Container(
                          height: 235,
                          width: 395,
                          color:hexToColor('#DDDDDD') ,
                          child: Center(
                            child: Text('Sample Image',style: TextStyle(
                              color: hexToColor('#999999'),
                              fontSize: 26,
                              fontWeight: FontWeight.bold
                            ),),
                          ),
                        )
                      ],
                    ),
                  );
                },

              ),
              SizedBox(height: 10,),
              Container(
                color: hexToColor('#EDEBEB'),
                height: 220,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 15,),
                        Text('Book Service',style: TextStyle(
                          color: hexToColor('#2D2B75'),
                          fontSize: 16
                        ),),
                        SizedBox(height: 15,),
                        SizedBox(
                          height: 200,
                          child: ListView.separated(
                            separatorBuilder: (context,i){
                              return SizedBox(width: 10);
                            },
                            shrinkWrap: true,

                            scrollDirection: Axis.horizontal,

                            itemCount: 4,
                            itemBuilder: (context,i){
                              return Column(
                                children: [
                                  Container(
                                    height:97,
                                    width: 123,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10.0),
                                          topLeft: Radius.circular(10.0)),
                                      color: hexToColor('#DDDDDD'),
                                    ),
                                    child: Center(
                                      child: Text('Manunath',style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500
                                      ),),
                                    ),
                                  ),
                                  Container(
                                    height:50,
                                    width: 123,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(10.0),
                                          bottomLeft: Radius.circular(10.0)),
                                      color: Colors.white,
                                    ),


                                    child: Center(
                                      child: Text('Manunath',style: TextStyle(
                                          color: hexToColor('#020202'),
                                          fontSize: 12,
                                      ),),
                                    ),
                                  ),
                                ],
                              );
                            },

                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),



            ],
          ),
        ),
      ),
    );
  }
}
Color hexToColor(String hexString) {
  hexString = hexString.replaceAll("#", ""); // Remove the '#' if present
  return Color(int.parse("FF$hexString", radix: 16)); // Add FF for alpha, default fully opaque
}