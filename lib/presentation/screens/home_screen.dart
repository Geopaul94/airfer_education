import 'package:airfer_education/presentation/bloc/headline/headline_color_bloc.dart';
import 'package:airfer_education/presentation/bloc/headline/headline_color_state.dart';
import 'package:airfer_education/presentation/bloc/photos/photos_bloc.dart';
import 'package:airfer_education/presentation/bloc/photos/photos_event.dart';
import 'package:airfer_education/presentation/bloc/photos/photos_state.dart';
import 'package:airfer_education/presentation/screens/custom_text.dart';
import 'package:airfer_education/presentation/widgets/custom_headline.dart';
import 'package:airfer_education/presentation/widgets/custome_appbar.dart';
import 'package:airfer_education/presentation/widgets/custome_elevatedbutton.dart';
import 'package:airfer_education/utilities/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   late ScrollController _scrollController;

//   @override
//   void initState() {
//     super.initState();
//     _scrollController = ScrollController();
//     _scrollController.addListener(_onScroll);

//     // Trigger the initial load
//     BlocProvider.of<ImageBloc>(context).add(LoadImages(1));
//   }

//   void _onScroll() {
//     if (_scrollController.position.pixels ==
//             _scrollController.position.maxScrollExtent &&
//         !(BlocProvider.of<ImageBloc>(context).state as ImageLoaded)
//             .hasReachedMax) {
//       BlocProvider.of<ImageBloc>(context)
//           .add(LoadImages(BlocProvider.of<ImageBloc>(context).page));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => ContainerBloc(),
//       child: Scaffold(
//         backgroundColor: const Color.fromARGB(255, 0, 0, 0),
//         appBar: CustomAppBar(),
//         body: SafeArea(
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 BlocBuilder<ContainerBloc, ContainerState>(
//                   builder: (context, state) {
//                     return headlineRow();
//                   },
//                 ),
//                 h20,
//                 Container(
//                   width: double.infinity,
//                   decoration: const BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadiusDirectional.only(
//                       topEnd: Radius.circular(30),
//                       topStart: Radius.circular(30),
//                     ),
//                   ),
//                   child: Column(
//                     children: [
//                       h15,
//                       CustomText(
//                         text: 'All products',
//                         fontSize: 16.sp,
//                         fontWeight: FontWeight.w700,
//                       ),
//                       h15,
//                       BlocBuilder<ImageBloc, ImageState>(
//                         builder: (context, state) {
//                           if (state is ImageLoading && state is! ImageLoaded) {
//                             return Center(
//                                 child: CircularProgressIndicator(
//                               color: Colors.green,
//                             ));
//                           } else if (state is ImageLoaded) {
//                             return MasonryGridView.count(
//                               crossAxisCount: 2,
//                               mainAxisSpacing: 0,
//                               crossAxisSpacing: 0,
//                               itemCount: state.hasReachedMax
//                                   ? state.images.length
//                                   : state.images.length + 1,
//                               shrinkWrap: true,
//                               controller: _scrollController,
//                               itemBuilder: (context, index) {
//                                 if (index < state.images.length) {
//                                   final image = state.images[index];

//                                   return Container(
//                                     decoration: BoxDecoration(
//                                       borderRadius:
//                                           BorderRadius.all(Radius.circular(20)),
//                                       color: Colors.white,
//                                     ),
//                                     height: index % 2 == 0 ? 300 : 380,
//                                     child: Padding(
//                                       padding: const EdgeInsets.symmetric(
//                                           horizontal: 5.0),
//                                       child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Stack(
//                                             children: [
//                                               ClipRRect(
//                                                 borderRadius:
//                                                     BorderRadius.circular(20),
//                                                 child: Image.network(
//                                                   image.imageUrl,
//                                                   height: index % 2 == 0
//                                                       ? 230
//                                                       : 280,
//                                                   width: double.infinity,
//                                                   fit: BoxFit.fill,
//                                                 ),
//                                               ),
//                                               Positioned(
//                                                 top: 8,
//                                                 left: 8,
//                                                 child: customMaterialButton(
//                                                   ' \$50',
//                                                   color: Colors.grey,
//                                                   height: 35,
//                                                   width: 50,
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                           SizedBox(height: 10),
//                                           Row(
//                                             children: [
//                                               CustomText(
//                                                 text: 'ajfklja',
//                                                 color: const Color.fromARGB(
//                                                     182, 0, 0, 0),
//                                               ),
//                                               Spacer(),
//                                               Icon(Icons.more_horiz),
//                                             ],
//                                           ),
//                                           CustomText(
//                                             text: 'tshirt',
//                                             color: const Color.fromARGB(
//                                                 182, 0, 0, 0),
//                                             fontSize: 14.sp,
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   );
//                                 } else {
//                                   return Center(
//                                       child: CircularProgressIndicator(
//                                     color: Colors.yellow,
//                                   ));
//                                 }
//                               },
//                             );
//                           } else {
//                             return Center(child: Text('Failed to load images'));
//                           }
//                         },
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


















class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _scrollController;
  int page = 1;  // Initialize the page variable

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);

    // Trigger the initial load

    BlocProvider.of<ImageBloc>(context).add(LoadImages(page));
  }

  // void _onScroll() {
  //   if (_scrollController.position.pixels ==
  //       _scrollController.position.maxScrollExtent &&
  //       !(BlocProvider.of<ImageBloc>(context).state as ImageLoaded).hasReachedMax) {
  //     // Increment page and fetch next page
  //     page++;
  //     BlocProvider.of<ImageBloc>(context).add(LoadImages(page));
  //   }
  // }

  void _onScroll() {
  if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
    final state = BlocProvider.of<ImageBloc>(context).state;

    if (state is ImageLoaded && !state.hasReachedMax) {
      // If max not reached, load the next page
      BlocProvider.of<ImageBloc>(context).add(LoadImages(BlocProvider.of<ImageBloc>(context).page));
    }
  }
}@override
void dispose() {
  _scrollController.dispose();
  super.dispose();
}


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ContainerBloc(),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        appBar: CustomAppBar(),
        body: SafeArea(
          child: ListView(
            children: [
              BlocBuilder<ContainerBloc, ContainerState>(
                builder: (context, state) {
                  return headlineRow();
                },
              ),
              h20,
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusDirectional.only(
                    topEnd: Radius.circular(30),
                    topStart: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    h15,
                    CustomText(
                      text: 'All products',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                    h15,
                    BlocBuilder<ImageBloc, ImageState>(
                      builder: (context, state) {
                        if (state is ImageLoading && state is! ImageLoaded) {
                          return Center(
                              child: CircularProgressIndicator(
                            color: Colors.green,
                          ));
                        } else if (state is ImageLoaded) {
                          return MasonryGridView.count(
                            crossAxisCount: 2,
                            mainAxisSpacing: 0,
                            crossAxisSpacing: 0,
                            itemCount: state.hasReachedMax
                                ? state.images.length
                                : state.images.length + 1,
                            shrinkWrap: true,
                            controller: _scrollController,
                            itemBuilder: (context, index) {
                              if (index < state.images.length) {
                                final image = state.images[index];
          
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20)),
                                    color: Colors.white,
                                  ),
                                  height: index % 2 == 0 ? 300 : 380,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Stack(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              child: Image.network(
                                                image.imageUrl,
                                                height: index % 2 == 0
                                                    ? 230
                                                    : 280,
                                                width: double.infinity,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            Positioned(
                                              top: 8,
                                              left: 8,
                                              child: customMaterialButton(
                                                ' \$50',
                                                color: Colors.grey,
                                                height: 35,
                                                width: 50,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                        Row(
                                          children: [
                                            CustomText(
                                              text: 'ajfklja',
                                              color: const Color.fromARGB(
                                                  182, 0, 0, 0),
                                            ),
                                            Spacer(),
                                            Icon(Icons.more_horiz),
                                          ],
                                        ),
                                        CustomText(
                                          text: 'tshirt',
                                          color: const Color.fromARGB(
                                              182, 0, 0, 0),
                                          fontSize: 14.sp,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              } else {
                                return Center(
                                    child: CircularProgressIndicator(
                                  color: Colors.yellow,
                                ));
                              }
                            },
                          );
                        } else {
                          return Center(child: Text('Failed to load images'));
                        }
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


class headlineRow extends StatelessWidget {
  const headlineRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        customHeadlineContainer('Activity', 0, context),
        customHeadlineContainer('Community', 1, context),
        customHeadlineContainer('Shop', 2, context),
      ],
    );
  }
}
