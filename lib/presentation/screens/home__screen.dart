import 'package:airfer_education/presentation/widgets/CustomBottomNav.dart';
import 'package:airfer_education/presentation/widgets/custom_image_container.dart';
import 'package:airfer_education/presentation/widgets/customealertbox.dart';
import 'package:airfer_education/presentation/widgets/headline_widget.dart';
import 'package:airfer_education/presentation/widgets/loading_animation_widgets.dart';
import 'package:airfer_education/presentation/widgets/shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:airfer_education/presentation/bloc/headline/headline_color_bloc.dart';
import 'package:airfer_education/presentation/bloc/headline/headline_color_state.dart';
import 'package:airfer_education/presentation/bloc/photos/photos_bloc.dart';
import 'package:airfer_education/presentation/bloc/photos/photos_event.dart';
import 'package:airfer_education/presentation/bloc/photos/photos_state.dart';
import 'package:airfer_education/presentation/screens/custom_text.dart';
import 'package:airfer_education/presentation/widgets/custome_appbar.dart';
import 'package:airfer_education/utilities/constants/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gallery_saver_plus/gallery_saver.dart';

import 'package:permission_handler/permission_handler.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _scrollController;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(onScroll);

    // Trigger the initial load
    BlocProvider.of<ImageBloc>(context).add(LoadImages(1));
  }

  @override
  void dispose() {
    _scrollController.removeListener(onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void onScroll() {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        !(BlocProvider.of<ImageBloc>(context).state as ImageLoaded)
            .hasReachedMax) {
      BlocProvider.of<ImageBloc>(context)
          .add(LoadImages(BlocProvider.of<ImageBloc>(context).page));
    }
  }

  void onSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ContainerBloc(),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        appBar: CustomAppBar(),
        body: Stack(
          children: [
            Positioned(
              top: 25.h,
              left: 0,
              right: 0,
              child: BlocBuilder<ContainerBloc, ContainerState>(
                builder: (context, state) {
                  return headlineRow();
                },
              ),
            ),
            allproductstext(),
            allProductsImage(),
            custombottomavigation()
          ],
        ),
      ),
    );
  }

  Positioned allproductstext() {
    return Positioned(
              top: 85.h,
              left: 0,
              right: 0,
              child: Container(
                  height: 55.h,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadiusDirectional.only(
                      topEnd: Radius.circular(40),
                      topStart: Radius.circular(40),
                    ),
                  ),
                  child: Center(
                    child: CustomText(
                      text: 'All products',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  )));
  }

  Positioned custombottomavigation() {
    return Positioned(
            bottom: 45.h,
            left: 40.w,
            right: 40.w,
            child: Container(
              height: 70.h,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(62, 158, 158, 158),
                  width: 1.0,
                ),
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(35)),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomBottomNav(
                      icon: Icons.home,
                      isSelected: selectedIndex == 0,
                      onTap: () => onSelected(0),
                    ),
                    CustomBottomNav(
                      icon: Icons.search,
                      isSelected: selectedIndex == 1,
                      onTap: () => onSelected(1),
                    ),
                    CustomBottomNav(
                      icon: Icons.favorite,
                      isSelected: selectedIndex == 2,
                      onTap: () => onSelected(2),
                    ),
                    CustomBottomNav(
                      icon: Icons.person,
                      isSelected: selectedIndex == 3,
                      onTap: () => onSelected(3),
                    ),
                  ],
                ),
              ),
            ),
          );
  }

  Positioned allProductsImage() {
    return Positioned(
            top: 140.h,
            left: 0,
            right: 0,
            bottom: 10,
            child: BlocBuilder<ImageBloc, ImageState>(
              builder: (context, state) {
                if (state is ImageLoading && state is! ImageLoaded) {
                  return Center(child: ShimmerLoading());
                } else if (state is ImageLoaded) {
                  return Container(
                    padding: EdgeInsets.all(8),
                    color: white,
                    child: MasonryGridView.count(
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

                          return GestureDetector(
                            onTap: () async {
                              bool download = await showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return customealertbox();
                                },
                              );

                              if (download == true) {
                              

                                downloadImageToGallery(image.imageUrl);
                              }
                            },
                            child: imageContainer(image: image),
                          );
                        } else {
                          return Container(
                              height: 300.h,
                              width: 180.w,
                              child: SpinningLine());
                        }
                      },
                    ),
                  );
                } else {
                  return Center(child: Text('Failed to load images'));
                }
              },
            ),
          );
  }

  // Request storage permission
  Future<void> downloadImageToGallery(String imageUrl) async {
    // Request storage permission
    if (await Permission.storage.request().isGranted) {
      try {
        // Save the image to the gallery
        bool? success = await GallerySaver.saveImage(imageUrl);
        if (success != null) {
          print('Image downloaded successfully');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Image downloaded successfully!'),
              backgroundColor: Colors.green,
            ),
          );
        } else {
          throw Exception('Failed to save image');
        }
      } catch (error) {
        print('Error downloading image: $error');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to download image. Please try again.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } else {
      // Permission not granted, show a message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'Storage permission denied. Please enable it to download images.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
