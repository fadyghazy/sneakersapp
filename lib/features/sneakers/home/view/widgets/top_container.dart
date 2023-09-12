
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:sneakers_store/screens/search/presentation/views/search_view.dart';

class TopContainer extends StatefulWidget {
  final String title;
  final String searchBarTitle;
  const TopContainer({Key? key, required this.title, required this.searchBarTitle}) : super(key: key);

  @override
  State<TopContainer> createState() => _TopContainerState();
}

class _TopContainerState extends State<TopContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //title
        Row(
            children: [
              Text(widget.title,style:TextStyle(fontSize: 22,fontWeight: FontWeight.w500)),
              const Spacer(),

              Container(height: 40,width: 40,alignment: Alignment.center,decoration: BoxDecoration(
                shape: BoxShape.circle,color: Colors.grey.withOpacity(0.8),

              ),
                child: Stack(
                  children: [
                    const Icon(LineAwesomeIcons.bell,size:20 ),
                    Positioned(
                      right: 0,
                        child: Container(
                          height: 8,
                          width: 8,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,color: Colors.orange
                          ),

                        ),

                    )
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
                Container(height: 40,width: 40,alignment: Alignment.center,decoration: BoxDecoration(
    shape: BoxShape.circle,color: Colors.grey.withOpacity(0.8),

    ),
    child: Stack(
    children: [
     IconButton(iconSize: 20, onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchView()));
    }, icon:Icon(LineAwesomeIcons.search), ),
                  ]
    ),
                ),

              SizedBox(
                width: 10,
              ),

              ClipRRect(borderRadius: BorderRadius.circular(30.0),
              child: Image.asset("assets/images/user.jpg",height: 40,width: 40,fit: BoxFit.cover,),

              ),
            ]
        ),
        SizedBox(height: 10,)


        //search bar
     /*   Container(
          margin: const EdgeInsets.symmetric(vertical: 30),
          padding:  EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.8),
            borderRadius: BorderRadius.circular(30)
          ),
          child: Row(
            children: [
               Icon(
                LineAwesomeIcons.search,size: 20,
              ),
              SizedBox(
                width: 10,

              ),
              Text(widget.searchBarTitle,style: const TextStyle(color:Colors.black38,fontWeight: FontWeight.w400 ),
              ),

            ],
          ),
        )*/
      ],
    );
  }
}
