
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:sneakers_store/core/utils/asset.dart';
import 'package:sneakers_store/features/sneakers/home/data/model/brand_model.dart';
import 'package:sneakers_store/features/sneakers/home/data/model/sneaker_model.dart';
import 'package:sneakers_store/features/sneakers/home/data/model/sneakers.dart';
import 'package:sneakers_store/resources/resources.dart';
import 'package:sneakers_store/screens/search/presentation/views/search_view.dart';
import 'package:sneakers_store/screens/search/presentation/views/widgets/customtextformfield.dart';
import 'package:sneakers_store/translate.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({Key? key}) : super(key: key);

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  static  Sneakers mock_Sneakers =  Sneakers(
    brands: [
      Brand(
        id: 1,
        name: '${Translate.NikeBrand1}',
        featured: [
          Sneaker(
            id: 1,
            shortName: '${Translate.NikeShortName1}',
            name: '${Translate.NikeName1}',
            brandName: '${Translate.NikeBrand1}',
            price: 130,
            type: SneakerType.featured,
            color: Colors.purple,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.sneaker01,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.sneaker02,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.sneaker03,
              ),
              Asset(
                type: AssetType.video,
                path: Images.sneaker04,
              ),
            ],
            description:
            '${Translate.DescriptionNike1}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),
          Sneaker(
            id: 2,
            shortName: '${Translate.NikeShortName2}',
            name: '${Translate.NikeName2}',
            brandName: '${Translate.NikeBrand2}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.redAccent,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.sneaker02,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.sneaker01,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.sneaker03,
              ),
              Asset(
                type: AssetType.video,
                path: Images.sneaker04,
              ),
            ],
            description:
            '${Translate.DescriptionNike2}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),


          Sneaker(
            id: 3,
            shortName: '${Translate.NikeShortName3}',
            name: '${Translate.NikeName3}',
            brandName: '${Translate.NikeBrand3}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.redAccent,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.sneaker01,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.sneaker03,
              ),
              Asset(
                type: AssetType.video,
                path: Images.sneaker04,
              ),
            ],
            description:
            '${Translate.DescriptionNike3}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),
        ],
        upcoming: [
          Sneaker(
            id: 1,
            shortName: '${Translate.UpcomingNikeShortName1}',
            name: '${Translate.UpcomingNikeName1}',
            brandName: '${Translate.UpcomingNikeBrand1}',
            price: 130,
            type: SneakerType.featured,
            color: Colors.redAccent,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.upcomingsneaker01,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.upcomingsneaker02,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.upcomingsneaker03,
              ),
              Asset(
                type: AssetType.video,
                path: Images.upcomingsneaker03,
              ),
            ],
            description:
            '${Translate.UpcomingNikeDescription1}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),

          Sneaker(
            id: 2,
            shortName: '${Translate.UpcomingNikeShortName2}',
            name: '${Translate.UpcomingNikeName2}',
            brandName: '${Translate.UpcomingNikeBrand2}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.blueAccent,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.upcomingsneaker02,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.upcomingsneaker01,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.upcomingsneaker03,
              ),
            ],
            description:
            '${Translate.UpcomingNikeDescription2}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),

          Sneaker(
            id: 3,
            shortName: '${Translate.UpcomingNikeShortName3}',
            name: '${Translate.UpcomingNikeName3}',
            brandName: '${Translate.UpcomingNikeBrand3}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.yellow,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.upcomingsneaker03,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.upcomingsneaker02,
              ),
              Asset(
                type: AssetType.video,
                path: Images.upcomingsneaker01,
              ),
            ],
            description:
            '${Translate.UpcomingNikeDescription3}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),
        ],
        newModels: [
          Sneaker(
            id: 1,
            shortName: '${Translate.NewNikeShortName1}',
            name: '${Translate.NewNikeName1}',
            brandName: '${Translate.NewNikeBrand1}',
            price: 130,
            type: SneakerType.featured,
            color: Colors.redAccent,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.newsneaker01,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.newsneaker02,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.newsneaker03,
              ),
              Asset(
                type: AssetType.video,
                path: Images.newsneaker04,
              ),
            ],
            description:
            '${Translate.NewNikeDescription1}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),
          Sneaker(
            id: 2,
            shortName: '${Translate.NewNikeShortName2}',
            name: '${Translate.NewNikeName2}',
            brandName: '${Translate.NewNikeBrand2}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.blueAccent,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.newsneaker02,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.newsneaker01,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.newsneaker03,
              ),
            ],
            description:
            '${Translate.NewNikeDescription2}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),

          Sneaker(
            id: 3,
            shortName: '${Translate.NewNikeShortName3}',
            name: '${Translate.NewNikeName3}',
            brandName: '${Translate.NewNikeBrand3}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.yellow,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.newsneaker03,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.newsneaker02,
              ),
              Asset(
                type: AssetType.video,
                path: Images.newsneaker01,
              ),
            ],
            description:
            '${Translate.NewNikeDescription2}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),
        ],
      ),
      Brand(
        id: 2,
        name: '${Translate.AddidasBrand1}',
        featured: [
          Sneaker(
            id: 1,
            shortName: '${Translate.AddidasShortName1}',
            name: '${Translate.AddidasName1}',
            brandName: '${Translate.AddidasBrand1}',
            price: 130,
            type: SneakerType.featured,
            color: Colors.purple,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.addidassneaker01,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.addidassneaker04,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.addidassneaker03,
              ),
              Asset(
                type: AssetType.video,
                path: Images.addidassneaker04,
              ),
            ],
            description:
            '${Translate.DescriptionAddidas1}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),
          Sneaker(
            id: 2,
            shortName: '${Translate.AddidasShortName2}',
            name: '${Translate.AddidasName2}',
            brandName: '${Translate.AddidasBrand2}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.grey,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.addidassneaker02,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.addidassneaker01,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.addidassneaker03,
              ),
              Asset(
                type: AssetType.video,
                path: Images.addidassneaker04,
              ),

            ],
            description:
            '${Translate.DescriptionAddidas2}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),

          Sneaker(
            id: 3,
            shortName: '${Translate.AddidasShortName3}',
            name: '${Translate.AddidasName3}',
            brandName: '${Translate.AddidasBrand3}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.redAccent,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.addidassneaker03,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.addidassneaker04,
              ),
              Asset(
                type: AssetType.video,
                path: Images.addidassneaker04,
              ),
            ],
            description:
            '${Translate.DescriptionAddidas3}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),
          Sneaker(
            id: 4,
            shortName: '${Translate.AddidasShortName2}',
            name: '${Translate.AddidasName2}',
            brandName: '${Translate.AddidasBrand2}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.green,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.addidassneaker04,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.addidassneaker01,
              ),
              Asset(
                type: AssetType.video,
                path: Images.addidassneaker02,
              ),
            ],
            description:
            '${Translate.NewAddidasDescription3}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),
        ],

        upcoming: [
          Sneaker(
            id: 1,
            shortName: '${Translate.UpcomingAddidasShortName1}',
            name: '${Translate.UpcomingAddidasName1}',
            brandName: '${Translate.UpcomingAddidasBrand1}',
            price: 130,
            type: SneakerType.featured,
            color: Colors.purple,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.upcomingaddidassneaker01,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.upcomingaddidassneaker03,
              ),
              Asset(
                type: AssetType.video,
                path: Images.upcomingaddidassneaker02,
              ),
            ],
            description:
            '${Translate.UpcomingAddidasDescription1}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),
          Sneaker(
            id: 2,
            shortName: '${Translate.UpcomingAddidasShortName2}',
            name: '${Translate.UpcomingAddidasName2}',
            brandName: '${Translate.UpcomingAddidasBrand2}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.grey,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.upcomingaddidassneaker02,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.upcomingaddidassneaker01,
              ),
              Asset(
                type: AssetType.video,
                path: Images.upcomingaddidassneaker03,
              ),

            ],
            description:
            '${Translate.UpcomingAddidasDescription2}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),

          Sneaker(
            id: 3,
            shortName: '${Translate.UpcomingAddidasShortName3}',
            name: '${Translate.UpcomingAddidasName3}',
            brandName: '${Translate.UpcomingAddidasBrand3}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.redAccent,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.upcomingaddidassneaker03,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.upcomingaddidassneaker02,
              ),
              Asset(
                type: AssetType.video,
                path: Images.upcomingaddidassneaker01,
              ),
            ],
            description:
            '${Translate.UpcomingAddidasDescription3}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),
        ],
        newModels: [
          Sneaker(
            id: 1,
            shortName: '${Translate.NewAddidasShortName1}',
            name: '${Translate.NewAddidasName1}',
            brandName: '${Translate.NewAddidasBrand1}',
            price: 130,
            type: SneakerType.featured,
            color: Colors.purple,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.newaddidassneaker01,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.newaddidassneaker03,
              ),
              Asset(
                type: AssetType.video,
                path: Images.newaddidassneaker02,
              ),
            ],
            description:
            '${Translate.NewAddidasDescription1}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),
          Sneaker(
            id: 2,
            shortName: '${Translate.NewAddidasShortName2}',
            name: '${Translate.AddidasName2}',
            brandName: '${Translate.AddidasBrand2}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.grey,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.newaddidassneaker02,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.newaddidassneaker01,
              ),
              Asset(
                type: AssetType.video,
                path: Images.newaddidassneaker03,
              ),

            ],
            description:
            '${Translate.NewAddidasDescription2}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),

          Sneaker(
            id: 3,
            shortName: '${Translate.NewAddidasShortName3}',
            name: '${Translate.NewAddidasName3}',
            brandName: '${Translate.NewAddidasBrand3}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.redAccent,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.newaddidassneaker03,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.newaddidassneaker02,
              ),
              Asset(
                type: AssetType.video,
                path: Images.newaddidassneaker01,
              ),
            ],
            description:
            '${Translate.NewAddidasDescription3}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),
        ],

      ),
      Brand(
        id: 3,
        name: '${Translate.JordanBrand1}',

        featured: [
          Sneaker(
            id: 1,
            shortName: '${Translate.JordanShortName1}',
            name: '${Translate.JordanName1}',
            brandName: '${Translate.JordanBrand1}',
            price: 130,
            type: SneakerType.featured,
            color: Colors.purple,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.jordonsneaker01,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.jordonsneaker02,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.jordonsneaker03,
              ),
              Asset(
                type: AssetType.video,
                path: Images.jordonsneaker04,
              ),
            ],
            description:
            '${Translate.DescriptionJordan1}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),
          Sneaker(
            id: 2,
            shortName: '${Translate.JordanShortName2}',
            name: '${Translate.JordanName2}',
            brandName: '${Translate.JordanBrand2}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.grey,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.jordonsneaker02,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.jordonsneaker01,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.jordonsneaker03,
              ),
              Asset(
                type: AssetType.video,
                path: Images.jordonsneaker04,
              ),

            ],
            description:
            '${Translate.DescriptionJordan2}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),

          Sneaker(
            id: 3,
            shortName: '${Translate.JordanShortName3}',
            name: '${Translate.JordanName3}',
            brandName: '${Translate.JordanBrand3}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.redAccent,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.jordonsneaker03,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.jordonsneaker04,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.jordonsneaker02,
              ),
              Asset(
                type: AssetType.video,
                path: Images.jordonsneaker01,
              ),
            ],
            description:
            '${Translate.DescriptionJordan3}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),
          Sneaker(
            id: 4,
            shortName: '${Translate.JordanShortName3}',
            name: '${Translate.JordanName3}',
            brandName: '${Translate.JordanBrand3}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.green,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.jordonsneaker04,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.jordonsneaker03,
              ),
              Asset(
                type: AssetType.video,
                path: Images.jordonsneaker02,
              ),
              Asset(
                type: AssetType.video,
                path: Images.jordonsneaker01,
              ),
            ],
            description:
            '${Translate.DescriptionJordan3}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),

        ],

        upcoming: [
          Sneaker(
            id: 1,
            shortName: '${Translate.UpcomingJordanShortName1}',
            name: '${Translate.UpcomingJordanName1}',
            brandName: '${Translate.UpcomingJordanBrand1}',
            price: 130,
            type: SneakerType.featured,
            color: Colors.purple,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.upcomingjordonsneaker01,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.upcomingjordonsneaker02,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.upcomingjordonsneaker03,
              ),
            ],
            description:
            '${Translate.UpcomingJordanDescription1}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),
          Sneaker(
            id: 2,
            shortName: '${Translate.UpcomingJordanShortName2}',
            name: '${Translate.UpcomingJordanName2}',
            brandName: '${Translate.UpcomingJordanBrand2}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.grey,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.upcomingjordonsneaker02,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.upcomingjordonsneaker01,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.upcomingjordonsneaker03,
              ),

            ],
            description:
            '${Translate.UpcomingJordanDescription2}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),

          Sneaker(
            id: 3,
            shortName: '${Translate.UpcomingJordanShortName3}',
            name: '${Translate.UpcomingJordanName3}',
            brandName: '${Translate.UpcomingJordanBrand3}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.redAccent,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.upcomingjordonsneaker03,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.upcomingjordonsneaker02,
              ),
              Asset(
                type: AssetType.video,
                path: Images.upcomingjordonsneaker01,
              ),
            ],
            description:
            '${Translate.UpcomingJordanDescription3}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),
        ],
        newModels: [
          Sneaker(
            id: 1,
            shortName: '${Translate.NewJordanShortName1}',
            name: '${Translate.NewJordanName1}',
            brandName: '${Translate.NewJordanBrand1}',
            price: 130,
            type: SneakerType.featured,
            color: Colors.purple,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.newjordonsneaker01,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.newjordonsneaker02,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.newjordonsneaker03,
              ),
              Asset(
                type: AssetType.video,
                path: Images.newjordonsneaker04,
              ),
            ],
            description:
            '${Translate.NewJordanDescription1}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),
          Sneaker(
            id: 2,
            shortName: '${Translate.NewJordanShortName2}',
            name: '${Translate.NewJordanName2}',
            brandName: '${Translate.NewJordanBrand2}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.grey,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.newjordonsneaker02,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.newjordonsneaker01,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.newjordonsneaker03,
              ),
              Asset(
                type: AssetType.video,
                path: Images.newjordonsneaker04,
              ),

            ],
            description:
            '${Translate.NewJordanDescription1}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),

          Sneaker(
            id: 3,
            shortName: '${Translate.NewJordanShortName3}',
            name: '${Translate.NewJordanName3}',
            brandName: '${Translate.NewJordanBrand3}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.redAccent,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.newjordonsneaker03,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.newjordonsneaker04,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.newjordonsneaker02,
              ),
              Asset(
                type: AssetType.video,
                path: Images.newjordonsneaker01,
              ),
            ],
            description:
            '${Translate.NewJordanDescription3}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),
          Sneaker(
            id: 4,
            shortName: '${Translate.NewJordanShortName2}',
            name: '${Translate.NewJordanName2}',
            brandName: '${Translate.NewJordanBrand2}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.green,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.newjordonsneaker04,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.newjordonsneaker03,
              ),
              Asset(
                type: AssetType.video,
                path: Images.newjordonsneaker02,
              ),
              Asset(
                type: AssetType.video,
                path: Images.newjordonsneaker01,
              ),
            ],
            description:
            '${Translate.NewJordanDescription2}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),

        ],
      ),
      Brand(
        id: 4,
        name: '${Translate.PumaName1}',
        featured: [
          Sneaker(
            id: 1,
            shortName: '${Translate.PumaShortName1}',
            name: '${Translate.PumaName1}',
            brandName: '${Translate.PumaBrand1}',
            price: 130,
            type: SneakerType.featured,
            color: Colors.purple,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.pumasneaker01,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.pumasneaker02,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.pumasneaker03,
              ),
              Asset(
                type: AssetType.video,
                path: Images.pumasneaker04,
              ),
            ],
            description:
            '${Translate.DescriptionPuma1}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),
          Sneaker(
            id: 2,
            shortName: '${Translate.PumaShortName2}',
            name: '${Translate.PumaName2}',
            brandName: '${Translate.PumaBrand2}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.grey,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.pumasneaker02,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.pumasneaker01,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.pumasneaker03,
              ),
              Asset(
                type: AssetType.video,
                path: Images.pumasneaker04,
              ),

            ],
            description:
            '${Translate.DescriptionPuma2}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),

          Sneaker(
            id: 3,
            shortName: '${Translate.PumaShortName3}',
            name: '${Translate.PumaName3}',
            brandName: '${Translate.PumaBrand3}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.redAccent,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.pumasneaker03,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.pumasneaker04,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.pumasneaker02,
              ),
              Asset(
                type: AssetType.video,
                path: Images.pumasneaker01,
              ),
            ],
            description:
            '${Translate.DescriptionPuma3}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),
          Sneaker(
            id: 4,
            shortName: '${Translate.PumaShortName2}',
            name: '${Translate.PumaName2}',
            brandName: '${Translate.PumaBrand2}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.green,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.pumasneaker04,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.pumasneaker03,
              ),
              Asset(
                type: AssetType.video,
                path: Images.pumasneaker02,
              ),
              Asset(
                type: AssetType.video,
                path: Images.pumasneaker01,
              ),
            ],
            description:
            '${Translate.DescriptionPuma3}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),

        ],
        upcoming: [
          Sneaker(
            id: 1,
            shortName: '${Translate.UpcomingPumaShortName1}',
            name: '${Translate.UpcomingPumaName1}',
            brandName: '${Translate.UpcomingPumaBrand1}',
            price: 130,
            type: SneakerType.featured,
            color: Colors.purple,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.upcomingpumasneaker01,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.upcomingpumasneaker02,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.upcomingpumasneaker03,
              ),
            ],
            description:
            '${Translate.UpcomingPumaDescription1}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),
          Sneaker(
            id: 2,
            shortName: '${Translate.UpcomingPumaShortName2}',
            name: '${Translate.UpcomingPumaName2}',
            brandName: '${Translate.UpcomingPumaBrand2}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.grey,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.upcomingpumasneaker02,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.upcomingpumasneaker01,
              ),
              Asset(
                type: AssetType.video,
                path: Images.upcomingpumasneaker03,
              ),

            ],
            description:
            '${Translate.UpcomingPumaDescription2}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),

          Sneaker(
            id: 3,
            shortName: '${Translate.UpcomingPumaShortName3}',
            name: '${Translate.UpcomingPumaName3}',
            brandName: '${Translate.UpcomingPumaBrand3}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.redAccent,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.upcomingpumasneaker03,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.upcomingpumasneaker02,
              ),
              Asset(
                type: AssetType.video,
                path: Images.upcomingpumasneaker01,
              ),

            ],
            description:
            '${Translate.UpcomingPumaDescription3}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),
        ],
        newModels: [
          Sneaker(
            id: 1,
            shortName: '${Translate.NewPumaShortName1}',
            name: '${Translate.NewPumaName1}',
            brandName: '${Translate.NewPumaBrand1}',
            price: 130,
            type: SneakerType.featured,
            color: Colors.purple,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.newpumasneaker01,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.newpumasneaker02,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.pumasneaker03,
              ),
              Asset(
                type: AssetType.video,
                path: Images.pumasneaker04,
              ),
            ],
            description:
            '${Translate.NewPumaDescription1}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),
          Sneaker(
            id: 2,
            shortName: '${Translate.NewPumaShortName2}',
            name: '${Translate.NewPumaName2}',
            brandName: '${Translate.NewPumaBrand2}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.grey,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.newpumasneaker02,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.newpumasneaker01,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.pumasneaker03,
              ),
              Asset(
                type: AssetType.video,
                path: Images.pumasneaker04,
              ),

            ],
            description:
            '${Translate.NewPumaDescription2}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),

          Sneaker(
            id: 3,
            shortName: '${Translate.NewPumaShortName3}',
            name: '${Translate.NewPumaName3}',
            brandName: '${Translate.NewPumaBrand3}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.redAccent,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.pumasneaker03,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.pumasneaker04,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.newpumasneaker02,
              ),
              Asset(
                type: AssetType.video,
                path: Images.newpumasneaker01,
              ),
            ],
            description:
            '${Translate.NewPumaDescription3}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),
          Sneaker(
            id: 4,
            shortName: '${Translate.NewPumaShortName2}',
            name: '${Translate.NewPumaName2}',
            brandName: '${Translate.NewPumaBrand2}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.green,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.pumasneaker04,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.pumasneaker03,
              ),
              Asset(
                type: AssetType.video,
                path: Images.newpumasneaker02,
              ),
              Asset(
                type: AssetType.video,
                path: Images.newpumasneaker01,
              ),
            ],
            description:
            '${Translate.NewPumaDescription3}.',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),
        ],
      ),
      Brand(
        id: 5,
        name: '${Translate.ReebokBrand1}',
        featured: [
          Sneaker(
            id: 1,
            shortName: '${Translate.ReebokShortName1}',
            name: '${Translate.ReebokName1}',
            brandName: '${Translate.ReebokBrand1}',
            price: 130,
            type: SneakerType.featured,
            color: Colors.purple,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.reeboksneaker01,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.reeboksneaker02,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.reeboksneaker04,
              ),
              Asset(
                type: AssetType.video,
                path: Images.reeboksneaker05,
              ),
            ],
            description:
            '${Translate.NewReebokDescription1}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),
          Sneaker(
            id: 2,
            shortName: '${Translate.ReebokShortName2}',
            name: '${Translate.ReebokName2}',
            brandName: '${Translate.ReebokName2}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.grey,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.reeboksneaker02,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.reeboksneaker01,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.reeboksneaker04,
              ),
              Asset(
                type: AssetType.video,
                path: Images.reeboksneaker05,
              ),

            ],
            description:
            '${Translate.NewReebokDescription2}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),

          Sneaker(
            id: 3,
            shortName: '${Translate.ReebokShortName3}',
            name: '${Translate.ReebokName3}',
            brandName: '${Translate.ReebokBrand3}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.redAccent,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.reeboksneaker04,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.reeboksneaker05,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.reeboksneaker02,
              ),
              Asset(
                type: AssetType.video,
                path: Images.reeboksneaker01,
              ),
            ],
            description:
            '${Translate.NewReebokDescription3}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),
          Sneaker(
            id: 4,
            shortName: '${Translate.ReebokShortName3}',
            name: '${Translate.ReebokName3}',
            brandName: '${Translate.ReebokBrand3}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.green,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.reeboksneaker07,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.reeboksneaker04,
              ),
              Asset(
                type: AssetType.video,
                path: Images.reeboksneaker02,
              ),
              Asset(
                type: AssetType.video,
                path: Images.reeboksneaker01,
              ),
            ],
            description:
            '${Translate.NewReebokDescription3}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),

        ],
        upcoming: [
          Sneaker(
            id: 1,
            shortName: '${Translate.UpcomingReebokShortName1}',
            name: '${Translate.UpcomingReebokName1}',
            brandName: '${Translate.UpcomingReebokBrand1}',
            price: 130,
            type: SneakerType.featured,
            color: Colors.purple,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.upcomingreeboksneaker01,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.upcomingreeboksneaker02,
              ),

              Asset(
                type: AssetType.picture,
                path: Images.upcomingreeboksneaker03,
              ),
              Asset(
                type: AssetType.video,
                path: Images.upcomingreeboksneaker04,
              ),
            ],
            description:
            '${Translate.UpcomingReebokDescription1}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),
          Sneaker(
            id: 2,
            shortName: '${Translate.UpcomingReebokShortName2}',
            name: '${Translate.UpcomingReebokName2}',
            brandName: '${Translate.UpcomingReebokBrand2}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.grey,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.upcomingreeboksneaker02,
              ),

              Asset(
                type: AssetType.picture,
                path: Images.upcomingreeboksneaker03,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.upcomingreeboksneaker01,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.upcomingreeboksneaker04,
              ),

            ],
            description:
            '${Translate.UpcomingReebokDescription2}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),

          Sneaker(
            id: 3,
            shortName: 'Air-Max',
            name: 'Air-Max-200',
            brandName: 'Reebok',
            price: 170,
            type: SneakerType.featured,
            color: Colors.redAccent,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.upcomingreeboksneaker04,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.upcomingreeboksneaker03,
              ),
              Asset(
                type: AssetType.video,
                path: Images.upcomingreeboksneaker02,
              ),

              Asset(
                type: AssetType.video,
                path: Images.upcomingreeboksneaker01,
              ),
            ],
            description:
            '${Translate.UpcomingReebokDescription3}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),
        ],
        newModels: [
          Sneaker(
            id: 1,
            shortName: '${Translate.NewReebokShortName1}',
            name: '${Translate.NewReebokName1}',
            brandName: '${Translate.NewReebokBrand1}',
            price: 130,
            type: SneakerType.featured,
            color: Colors.purple,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.newreeboksneaker01,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.newreeboksneaker02,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.newreeboksneaker04,
              ),
              Asset(
                type: AssetType.video,
                path: Images.reeboksneaker05,
              ),
            ],
            description:
            '${Translate.NewReebokDescription1}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),
          Sneaker(
            id: 2,
            shortName: '${Translate.NewReebokShortName2}',
            name: '${Translate.NewReebokName2}',
            brandName: '${Translate.NewReebokBrand2}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.grey,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.newreeboksneaker02,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.newreeboksneaker01,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.newreeboksneaker04,
              ),
              Asset(
                type: AssetType.video,
                path: Images.reeboksneaker05,
              ),

            ],
            description:
            '${Translate.NewReebokDescription2}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),

          Sneaker(
            id: 3,
            shortName: '${Translate.NewReebokShortName3}',
            name: '${Translate.NewReebokName3}',
            brandName: '${Translate.NewReebokBrand3}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.redAccent,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.newreeboksneaker04,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.reeboksneaker05,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.newreeboksneaker02,
              ),
              Asset(
                type: AssetType.video,
                path: Images.newreeboksneaker01,
              ),
            ],
            description:
            '${Translate.NewReebokDescription3}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),
          Sneaker(
            id: 4,
            shortName: '${Translate.NewReebokShortName3}',
            name: '${Translate.NewReebokName3}',
            brandName: '${Translate.NewReebokBrand3}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.green,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.reeboksneaker07,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.reeboksneaker04,
              ),
              Asset(
                type: AssetType.video,
                path: Images.newreeboksneaker02,
              ),
              Asset(
                type: AssetType.video,
                path: Images.newreeboksneaker01,
              ),
            ],
            description:
            '${Translate.NewReebokDescription3}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),

        ],
      ),

    ], more: [],
  );
// creating the list that we are going to display and filter
  static  Sneakers display_mock_Sneakers = Sneakers(
    brands: [
      Brand(
        id: 1,
        name: '${Translate.NikeBrand1}',
        featured: [
          Sneaker(
            id: 1,
            shortName: '${Translate.NikeShortName1}',
            name: '${Translate.NikeName1}',
            brandName: '${Translate.NikeBrand1}',
            price: 130,
            type: SneakerType.featured,
            color: Colors.purple,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.sneaker01,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.sneaker02,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.sneaker03,
              ),
              Asset(
                type: AssetType.video,
                path: Images.sneaker04,
              ),
            ],
            description:
            '${Translate.DescriptionNike1}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),
          Sneaker(
            id: 2,
            shortName: '${Translate.NikeShortName2}',
            name: '${Translate.NikeName2}',
            brandName: '${Translate.NikeBrand2}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.redAccent,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.sneaker02,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.sneaker01,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.sneaker03,
              ),
              Asset(
                type: AssetType.video,
                path: Images.sneaker04,
              ),
            ],
            description:
            '${Translate.DescriptionNike2}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),


          Sneaker(
            id: 3,
            shortName: '${Translate.NikeShortName3}',
            name: '${Translate.NikeName3}',
            brandName: '${Translate.NikeBrand3}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.redAccent,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.sneaker01,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.sneaker03,
              ),
              Asset(
                type: AssetType.video,
                path: Images.sneaker04,
              ),
            ],
            description:
            '${Translate.DescriptionNike3}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),
        ],
        upcoming: [
          Sneaker(
            id: 1,
            shortName: '${Translate.UpcomingNikeShortName1}',
            name: '${Translate.UpcomingNikeName1}',
            brandName: '${Translate.UpcomingNikeBrand1}',
            price: 130,
            type: SneakerType.featured,
            color: Colors.redAccent,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.upcomingsneaker01,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.upcomingsneaker02,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.upcomingsneaker03,
              ),
              Asset(
                type: AssetType.video,
                path: Images.upcomingsneaker03,
              ),
            ],
            description:
            '${Translate.UpcomingNikeDescription1}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),

          Sneaker(
            id: 2,
            shortName: '${Translate.UpcomingNikeShortName2}',
            name: '${Translate.UpcomingNikeName2}',
            brandName: '${Translate.UpcomingNikeBrand2}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.blueAccent,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.upcomingsneaker02,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.upcomingsneaker01,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.upcomingsneaker03,
              ),
            ],
            description:
            '${Translate.UpcomingNikeDescription2}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),

          Sneaker(
            id: 3,
            shortName: '${Translate.UpcomingNikeShortName3}',
            name: '${Translate.UpcomingNikeName3}',
            brandName: '${Translate.UpcomingNikeBrand3}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.yellow,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.upcomingsneaker03,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.upcomingsneaker02,
              ),
              Asset(
                type: AssetType.video,
                path: Images.upcomingsneaker01,
              ),
            ],
            description:
            '${Translate.UpcomingNikeDescription3}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),
        ],
        newModels: [
          Sneaker(
            id: 1,
            shortName: '${Translate.NewNikeShortName1}',
            name: '${Translate.NewNikeName1}',
            brandName: '${Translate.NewNikeBrand1}',
            price: 130,
            type: SneakerType.featured,
            color: Colors.redAccent,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.newsneaker01,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.newsneaker02,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.newsneaker03,
              ),
              Asset(
                type: AssetType.video,
                path: Images.newsneaker04,
              ),
            ],
            description:
            '${Translate.NewNikeDescription1}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),
          Sneaker(
            id: 2,
            shortName: '${Translate.NewNikeShortName2}',
            name: '${Translate.NewNikeName2}',
            brandName: '${Translate.NewNikeBrand2}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.blueAccent,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.newsneaker02,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.newsneaker01,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.newsneaker03,
              ),
            ],
            description:
            '${Translate.NewNikeDescription2}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),

          Sneaker(
            id: 3,
            shortName: '${Translate.NewNikeShortName3}',
            name: '${Translate.NewNikeName3}',
            brandName: '${Translate.NewNikeBrand3}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.yellow,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.newsneaker03,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.newsneaker02,
              ),
              Asset(
                type: AssetType.video,
                path: Images.newsneaker01,
              ),
            ],
            description:
            '${Translate.NewNikeDescription2}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),
        ],
      ),
      Brand(
        id: 2,
        name: '${Translate.AddidasBrand1}',
        featured: [
          Sneaker(
            id: 1,
            shortName: '${Translate.AddidasShortName1}',
            name: '${Translate.AddidasName1}',
            brandName: '${Translate.AddidasBrand1}',
            price: 130,
            type: SneakerType.featured,
            color: Colors.purple,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.addidassneaker01,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.addidassneaker04,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.addidassneaker03,
              ),
              Asset(
                type: AssetType.video,
                path: Images.addidassneaker04,
              ),
            ],
            description:
            '${Translate.DescriptionAddidas1}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),
          Sneaker(
            id: 2,
            shortName: '${Translate.AddidasShortName2}',
            name: '${Translate.AddidasName2}',
            brandName: '${Translate.AddidasBrand2}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.grey,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.addidassneaker02,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.addidassneaker01,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.addidassneaker03,
              ),
              Asset(
                type: AssetType.video,
                path: Images.addidassneaker04,
              ),

            ],
            description:
            '${Translate.DescriptionAddidas2}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),

          Sneaker(
            id: 3,
            shortName: '${Translate.AddidasShortName3}',
            name: '${Translate.AddidasName3}',
            brandName: '${Translate.AddidasBrand3}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.redAccent,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.addidassneaker03,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.addidassneaker04,
              ),
              Asset(
                type: AssetType.video,
                path: Images.addidassneaker04,
              ),
            ],
            description:
            '${Translate.DescriptionAddidas3}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),
          Sneaker(
            id: 4,
            shortName: '${Translate.AddidasShortName2}',
            name: '${Translate.AddidasName2}',
            brandName: '${Translate.AddidasBrand2}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.green,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.addidassneaker04,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.addidassneaker01,
              ),
              Asset(
                type: AssetType.video,
                path: Images.addidassneaker02,
              ),
            ],
            description:
            '${Translate.NewAddidasDescription3}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),
        ],

        upcoming: [
          Sneaker(
            id: 1,
            shortName: '${Translate.UpcomingAddidasShortName1}',
            name: '${Translate.UpcomingAddidasName1}',
            brandName: '${Translate.UpcomingAddidasBrand1}',
            price: 130,
            type: SneakerType.featured,
            color: Colors.purple,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.upcomingaddidassneaker01,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.upcomingaddidassneaker03,
              ),
              Asset(
                type: AssetType.video,
                path: Images.upcomingaddidassneaker02,
              ),
            ],
            description:
            '${Translate.UpcomingAddidasDescription1}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),
          Sneaker(
            id: 2,
            shortName: '${Translate.UpcomingAddidasShortName2}',
            name: '${Translate.UpcomingAddidasName2}',
            brandName: '${Translate.UpcomingAddidasBrand2}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.grey,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.upcomingaddidassneaker02,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.upcomingaddidassneaker01,
              ),
              Asset(
                type: AssetType.video,
                path: Images.upcomingaddidassneaker03,
              ),

            ],
            description:
            '${Translate.UpcomingAddidasDescription2}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),

          Sneaker(
            id: 3,
            shortName: '${Translate.UpcomingAddidasShortName3}',
            name: '${Translate.UpcomingAddidasName3}',
            brandName: '${Translate.UpcomingAddidasBrand3}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.redAccent,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.upcomingaddidassneaker03,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.upcomingaddidassneaker02,
              ),
              Asset(
                type: AssetType.video,
                path: Images.upcomingaddidassneaker01,
              ),
            ],
            description:
            '${Translate.UpcomingAddidasDescription3}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),
        ],
        newModels: [
          Sneaker(
            id: 1,
            shortName: '${Translate.NewAddidasShortName1}',
            name: '${Translate.NewAddidasName1}',
            brandName: '${Translate.NewAddidasBrand1}',
            price: 130,
            type: SneakerType.featured,
            color: Colors.purple,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.newaddidassneaker01,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.newaddidassneaker03,
              ),
              Asset(
                type: AssetType.video,
                path: Images.newaddidassneaker02,
              ),
            ],
            description:
            '${Translate.NewAddidasDescription1}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),
          Sneaker(
            id: 2,
            shortName: '${Translate.NewAddidasShortName2}',
            name: '${Translate.AddidasName2}',
            brandName: '${Translate.AddidasBrand2}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.grey,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.newaddidassneaker02,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.newaddidassneaker01,
              ),
              Asset(
                type: AssetType.video,
                path: Images.newaddidassneaker03,
              ),

            ],
            description:
            '${Translate.NewAddidasDescription2}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),

          Sneaker(
            id: 3,
            shortName: '${Translate.NewAddidasShortName3}',
            name: '${Translate.NewAddidasName3}',
            brandName: '${Translate.NewAddidasBrand3}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.redAccent,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.newaddidassneaker03,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.newaddidassneaker02,
              ),
              Asset(
                type: AssetType.video,
                path: Images.newaddidassneaker01,
              ),
            ],
            description:
            '${Translate.NewAddidasDescription3}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),
        ],

      ),
      Brand(
        id: 3,
        name: '${Translate.JordanBrand1}',

        featured: [
          Sneaker(
            id: 1,
            shortName: '${Translate.JordanShortName1}',
            name: '${Translate.JordanName1}',
            brandName: '${Translate.JordanBrand1}',
            price: 130,
            type: SneakerType.featured,
            color: Colors.purple,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.jordonsneaker01,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.jordonsneaker02,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.jordonsneaker03,
              ),
              Asset(
                type: AssetType.video,
                path: Images.jordonsneaker04,
              ),
            ],
            description:
            '${Translate.DescriptionJordan1}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),
          Sneaker(
            id: 2,
            shortName: '${Translate.JordanShortName2}',
            name: '${Translate.JordanName2}',
            brandName: '${Translate.JordanBrand2}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.grey,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.jordonsneaker02,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.jordonsneaker01,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.jordonsneaker03,
              ),
              Asset(
                type: AssetType.video,
                path: Images.jordonsneaker04,
              ),

            ],
            description:
            '${Translate.DescriptionJordan2}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),

          Sneaker(
            id: 3,
            shortName: '${Translate.JordanShortName3}',
            name: '${Translate.JordanName3}',
            brandName: '${Translate.JordanBrand3}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.redAccent,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.jordonsneaker03,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.jordonsneaker04,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.jordonsneaker02,
              ),
              Asset(
                type: AssetType.video,
                path: Images.jordonsneaker01,
              ),
            ],
            description:
            '${Translate.DescriptionJordan3}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),
          Sneaker(
            id: 4,
            shortName: '${Translate.JordanShortName3}',
            name: '${Translate.JordanName3}',
            brandName: '${Translate.JordanBrand3}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.green,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.jordonsneaker04,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.jordonsneaker03,
              ),
              Asset(
                type: AssetType.video,
                path: Images.jordonsneaker02,
              ),
              Asset(
                type: AssetType.video,
                path: Images.jordonsneaker01,
              ),
            ],
            description:
            '${Translate.DescriptionJordan3}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),

        ],

        upcoming: [
          Sneaker(
            id: 1,
            shortName: '${Translate.UpcomingJordanShortName1}',
            name: '${Translate.UpcomingJordanName1}',
            brandName: '${Translate.UpcomingJordanBrand1}',
            price: 130,
            type: SneakerType.featured,
            color: Colors.purple,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.upcomingjordonsneaker01,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.upcomingjordonsneaker02,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.upcomingjordonsneaker03,
              ),
            ],
            description:
            '${Translate.UpcomingJordanDescription1}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),
          Sneaker(
            id: 2,
            shortName: '${Translate.UpcomingJordanShortName2}',
            name: '${Translate.UpcomingJordanName2}',
            brandName: '${Translate.UpcomingJordanBrand2}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.grey,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.upcomingjordonsneaker02,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.upcomingjordonsneaker01,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.upcomingjordonsneaker03,
              ),

            ],
            description:
            '${Translate.UpcomingJordanDescription2}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),

          Sneaker(
            id: 3,
            shortName: '${Translate.UpcomingJordanShortName3}',
            name: '${Translate.UpcomingJordanName3}',
            brandName: '${Translate.UpcomingJordanBrand3}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.redAccent,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.upcomingjordonsneaker03,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.upcomingjordonsneaker02,
              ),
              Asset(
                type: AssetType.video,
                path: Images.upcomingjordonsneaker01,
              ),
            ],
            description:
            '${Translate.UpcomingJordanDescription3}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),
        ],
        newModels: [
          Sneaker(
            id: 1,
            shortName: '${Translate.NewJordanShortName1}',
            name: '${Translate.NewJordanName1}',
            brandName: '${Translate.NewJordanBrand1}',
            price: 130,
            type: SneakerType.featured,
            color: Colors.purple,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.newjordonsneaker01,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.newjordonsneaker02,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.newjordonsneaker03,
              ),
              Asset(
                type: AssetType.video,
                path: Images.newjordonsneaker04,
              ),
            ],
            description:
            '${Translate.NewJordanDescription1}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),
          Sneaker(
            id: 2,
            shortName: '${Translate.NewJordanShortName2}',
            name: '${Translate.NewJordanName2}',
            brandName: '${Translate.NewJordanBrand2}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.grey,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.newjordonsneaker02,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.newjordonsneaker01,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.newjordonsneaker03,
              ),
              Asset(
                type: AssetType.video,
                path: Images.newjordonsneaker04,
              ),

            ],
            description:
            '${Translate.NewJordanDescription1}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),

          Sneaker(
            id: 3,
            shortName: '${Translate.NewJordanShortName3}',
            name: '${Translate.NewJordanName3}',
            brandName: '${Translate.NewJordanBrand3}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.redAccent,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.newjordonsneaker03,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.newjordonsneaker04,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.newjordonsneaker02,
              ),
              Asset(
                type: AssetType.video,
                path: Images.newjordonsneaker01,
              ),
            ],
            description:
            '${Translate.NewJordanDescription3}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),
          Sneaker(
            id: 4,
            shortName: '${Translate.NewJordanShortName2}',
            name: '${Translate.NewJordanName2}',
            brandName: '${Translate.NewJordanBrand2}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.green,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.newjordonsneaker04,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.newjordonsneaker03,
              ),
              Asset(
                type: AssetType.video,
                path: Images.newjordonsneaker02,
              ),
              Asset(
                type: AssetType.video,
                path: Images.newjordonsneaker01,
              ),
            ],
            description:
            '${Translate.NewJordanDescription2}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),

        ],
      ),
      Brand(
        id: 4,
        name: '${Translate.PumaName1}',
        featured: [
          Sneaker(
            id: 1,
            shortName: '${Translate.PumaShortName1}',
            name: '${Translate.PumaName1}',
            brandName: '${Translate.PumaBrand1}',
            price: 130,
            type: SneakerType.featured,
            color: Colors.purple,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.pumasneaker01,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.pumasneaker02,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.pumasneaker03,
              ),
              Asset(
                type: AssetType.video,
                path: Images.pumasneaker04,
              ),
            ],
            description:
            '${Translate.DescriptionPuma1}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),
          Sneaker(
            id: 2,
            shortName: '${Translate.PumaShortName2}',
            name: '${Translate.PumaName2}',
            brandName: '${Translate.PumaBrand2}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.grey,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.pumasneaker02,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.pumasneaker01,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.pumasneaker03,
              ),
              Asset(
                type: AssetType.video,
                path: Images.pumasneaker04,
              ),

            ],
            description:
            '${Translate.DescriptionPuma2}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),

          Sneaker(
            id: 3,
            shortName: '${Translate.PumaShortName3}',
            name: '${Translate.PumaName3}',
            brandName: '${Translate.PumaBrand3}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.redAccent,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.pumasneaker03,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.pumasneaker04,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.pumasneaker02,
              ),
              Asset(
                type: AssetType.video,
                path: Images.pumasneaker01,
              ),
            ],
            description:
            '${Translate.DescriptionPuma3}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),
          Sneaker(
            id: 4,
            shortName: '${Translate.PumaShortName2}',
            name: '${Translate.PumaName2}',
            brandName: '${Translate.PumaBrand2}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.green,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.pumasneaker04,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.pumasneaker03,
              ),
              Asset(
                type: AssetType.video,
                path: Images.pumasneaker02,
              ),
              Asset(
                type: AssetType.video,
                path: Images.pumasneaker01,
              ),
            ],
            description:
            '${Translate.DescriptionPuma3}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),

        ],
        upcoming: [
          Sneaker(
            id: 1,
            shortName: '${Translate.UpcomingPumaShortName1}',
            name: '${Translate.UpcomingPumaName1}',
            brandName: '${Translate.UpcomingPumaBrand1}',
            price: 130,
            type: SneakerType.featured,
            color: Colors.purple,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.upcomingpumasneaker01,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.upcomingpumasneaker02,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.upcomingpumasneaker03,
              ),
            ],
            description:
            '${Translate.UpcomingPumaDescription1}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),
          Sneaker(
            id: 2,
            shortName: '${Translate.UpcomingPumaShortName2}',
            name: '${Translate.UpcomingPumaName2}',
            brandName: '${Translate.UpcomingPumaBrand2}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.grey,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.upcomingpumasneaker02,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.upcomingpumasneaker01,
              ),
              Asset(
                type: AssetType.video,
                path: Images.upcomingpumasneaker03,
              ),

            ],
            description:
            '${Translate.UpcomingPumaDescription2}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),

          Sneaker(
            id: 3,
            shortName: '${Translate.UpcomingPumaShortName3}',
            name: '${Translate.UpcomingPumaName3}',
            brandName: '${Translate.UpcomingPumaBrand3}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.redAccent,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.upcomingpumasneaker03,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.upcomingpumasneaker02,
              ),
              Asset(
                type: AssetType.video,
                path: Images.upcomingpumasneaker01,
              ),

            ],
            description:
            '${Translate.UpcomingPumaDescription3}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),
        ],
        newModels: [
          Sneaker(
            id: 1,
            shortName: '${Translate.NewPumaShortName1}',
            name: '${Translate.NewPumaName1}',
            brandName: '${Translate.NewPumaBrand1}',
            price: 130,
            type: SneakerType.featured,
            color: Colors.purple,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.newpumasneaker01,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.newpumasneaker02,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.pumasneaker03,
              ),
              Asset(
                type: AssetType.video,
                path: Images.pumasneaker04,
              ),
            ],
            description:
            '${Translate.NewPumaDescription1}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),
          Sneaker(
            id: 2,
            shortName: '${Translate.NewPumaShortName2}',
            name: '${Translate.NewPumaName2}',
            brandName: '${Translate.NewPumaBrand2}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.grey,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.newpumasneaker02,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.newpumasneaker01,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.pumasneaker03,
              ),
              Asset(
                type: AssetType.video,
                path: Images.pumasneaker04,
              ),

            ],
            description:
            '${Translate.NewPumaDescription2}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),

          Sneaker(
            id: 3,
            shortName: '${Translate.NewPumaShortName3}',
            name: '${Translate.NewPumaName3}',
            brandName: '${Translate.NewPumaBrand3}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.redAccent,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.pumasneaker03,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.pumasneaker04,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.newpumasneaker02,
              ),
              Asset(
                type: AssetType.video,
                path: Images.newpumasneaker01,
              ),
            ],
            description:
            '${Translate.NewPumaDescription3}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),
          Sneaker(
            id: 4,
            shortName: '${Translate.NewPumaShortName2}',
            name: '${Translate.NewPumaName2}',
            brandName: '${Translate.NewPumaBrand2}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.green,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.pumasneaker04,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.pumasneaker03,
              ),
              Asset(
                type: AssetType.video,
                path: Images.newpumasneaker02,
              ),
              Asset(
                type: AssetType.video,
                path: Images.newpumasneaker01,
              ),
            ],
            description:
            '${Translate.NewPumaDescription3}.',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),
        ],
      ),
      Brand(
        id: 5,
        name: '${Translate.ReebokBrand1}',
        featured: [
          Sneaker(
            id: 1,
            shortName: '${Translate.ReebokShortName1}',
            name: '${Translate.ReebokName1}',
            brandName: '${Translate.ReebokBrand1}',
            price: 130,
            type: SneakerType.featured,
            color: Colors.purple,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.reeboksneaker01,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.reeboksneaker02,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.reeboksneaker04,
              ),
              Asset(
                type: AssetType.video,
                path: Images.reeboksneaker05,
              ),
            ],
            description:
            '${Translate.NewReebokDescription1}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),
          Sneaker(
            id: 2,
            shortName: '${Translate.ReebokShortName2}',
            name: '${Translate.ReebokName2}',
            brandName: '${Translate.ReebokName2}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.grey,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.reeboksneaker02,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.reeboksneaker01,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.reeboksneaker04,
              ),
              Asset(
                type: AssetType.video,
                path: Images.reeboksneaker05,
              ),

            ],
            description:
            '${Translate.NewReebokDescription2}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),

          Sneaker(
            id: 3,
            shortName: '${Translate.ReebokShortName3}',
            name: '${Translate.ReebokName3}',
            brandName: '${Translate.ReebokBrand3}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.redAccent,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.reeboksneaker04,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.reeboksneaker05,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.reeboksneaker02,
              ),
              Asset(
                type: AssetType.video,
                path: Images.reeboksneaker01,
              ),
            ],
            description:
            '${Translate.NewReebokDescription3}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),
          Sneaker(
            id: 4,
            shortName: '${Translate.ReebokShortName3}',
            name: '${Translate.ReebokName3}',
            brandName: '${Translate.ReebokBrand3}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.green,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.reeboksneaker07,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.reeboksneaker04,
              ),
              Asset(
                type: AssetType.video,
                path: Images.reeboksneaker02,
              ),
              Asset(
                type: AssetType.video,
                path: Images.reeboksneaker01,
              ),
            ],
            description:
            '${Translate.NewReebokDescription3}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),

        ],
        upcoming: [
          Sneaker(
            id: 1,
            shortName: '${Translate.UpcomingReebokShortName1}',
            name: '${Translate.UpcomingReebokName1}',
            brandName: '${Translate.UpcomingReebokBrand1}',
            price: 130,
            type: SneakerType.featured,
            color: Colors.purple,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.upcomingreeboksneaker01,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.upcomingreeboksneaker02,
              ),

              Asset(
                type: AssetType.picture,
                path: Images.upcomingreeboksneaker03,
              ),
              Asset(
                type: AssetType.video,
                path: Images.upcomingreeboksneaker04,
              ),
            ],
            description:
            '${Translate.UpcomingReebokDescription1}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),
          Sneaker(
            id: 2,
            shortName: '${Translate.UpcomingReebokShortName2}',
            name: '${Translate.UpcomingReebokName2}',
            brandName: '${Translate.UpcomingReebokBrand2}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.grey,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.upcomingreeboksneaker02,
              ),

              Asset(
                type: AssetType.picture,
                path: Images.upcomingreeboksneaker03,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.upcomingreeboksneaker01,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.upcomingreeboksneaker04,
              ),

            ],
            description:
            '${Translate.UpcomingReebokDescription2}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),

          Sneaker(
            id: 3,
            shortName: 'Air-Max',
            name: 'Air-Max-200',
            brandName: 'Reebok',
            price: 170,
            type: SneakerType.featured,
            color: Colors.redAccent,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.upcomingreeboksneaker04,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.upcomingreeboksneaker03,
              ),
              Asset(
                type: AssetType.video,
                path: Images.upcomingreeboksneaker02,
              ),

              Asset(
                type: AssetType.video,
                path: Images.upcomingreeboksneaker01,
              ),
            ],
            description:
            '${Translate.UpcomingReebokDescription3}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),
        ],
        newModels: [
          Sneaker(
            id: 1,
            shortName: '${Translate.NewReebokShortName1}',
            name: '${Translate.NewReebokName1}',
            brandName: '${Translate.NewReebokBrand1}',
            price: 130,
            type: SneakerType.featured,
            color: Colors.purple,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.newreeboksneaker01,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.newreeboksneaker02,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.newreeboksneaker04,
              ),
              Asset(
                type: AssetType.video,
                path: Images.reeboksneaker05,
              ),
            ],
            description:
            '${Translate.NewReebokDescription1}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),
          Sneaker(
            id: 2,
            shortName: '${Translate.NewReebokShortName2}',
            name: '${Translate.NewReebokName2}',
            brandName: '${Translate.NewReebokBrand2}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.grey,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.newreeboksneaker02,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.newreeboksneaker01,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.newreeboksneaker04,
              ),
              Asset(
                type: AssetType.video,
                path: Images.reeboksneaker05,
              ),

            ],
            description:
            '${Translate.NewReebokDescription2}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),

          Sneaker(
            id: 3,
            shortName: '${Translate.NewReebokShortName3}',
            name: '${Translate.NewReebokName3}',
            brandName: '${Translate.NewReebokBrand3}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.redAccent,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.newreeboksneaker04,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.reeboksneaker05,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.newreeboksneaker02,
              ),
              Asset(
                type: AssetType.video,
                path: Images.newreeboksneaker01,
              ),
            ],
            description:
            '${Translate.NewReebokDescription3}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),
          Sneaker(
            id: 4,
            shortName: '${Translate.NewReebokShortName3}',
            name: '${Translate.NewReebokName3}',
            brandName: '${Translate.NewReebokBrand3}',
            price: 170,
            type: SneakerType.featured,
            color: Colors.green,
            assets: [
              Asset(
                type: AssetType.picture,
                path: Images.reeboksneaker07,
              ),
              Asset(
                type: AssetType.picture,
                path: Images.reeboksneaker04,
              ),
              Asset(
                type: AssetType.video,
                path: Images.newreeboksneaker02,
              ),
              Asset(
                type: AssetType.video,
                path: Images.newreeboksneaker01,
              ),
            ],
            description:
            '${Translate.NewReebokDescription3}',
            sizes: [7.5, 8, 9.5, 10, 12],
          ),

        ],
      ),

    ], more: [],
  );
  void updateList(String value){
    //this is the function that will filter our list
    // Now let,s write our  search function
    setState(() {
      List<Brand>display_sneakers=mock_Sneakers.brands.where((element) =>element.featured.where((element) => element.name.contains(value.toLowerCase())).toList().contains(value.toLowerCase())).toList();
    });

  }
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children:  [
          CustomSearchTextField(

          ),
          SizedBox(
            height: 16,
          ),
          Text("Search Result"),
          SizedBox(
            height: 16,
          ),
          Expanded(
            // Now let,s create a function to display a text in case we don,t get result
            child:display_mock_Sneakers.brands.length==0?Center(
                child: Text("No Result Found",style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.bold),)): ListView.builder(
              itemCount: 12,
              itemBuilder: (context, index){
                return ListTile(
                  contentPadding: EdgeInsets.all(8.0),
                  title:Text(display_mock_Sneakers.brands[index].featured[index].name,style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),),
                  leading: Image.asset(display_mock_Sneakers.brands[index].featured[index].assets[index].path,width: 40,height: 20,),
                  subtitle: Text(display_mock_Sneakers.brands[index].featured[index].name,),

                );
              },
            ),

          )


        ],
      ),
    );
  }
}