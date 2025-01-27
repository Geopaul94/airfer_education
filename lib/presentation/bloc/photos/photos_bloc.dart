import 'package:airfer_education/data/repository/photo_fetching.dart';
import 'package:airfer_education/presentation/bloc/photos/photos_event.dart';
import 'package:airfer_education/presentation/bloc/photos/photos_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


// class ImageBloc extends Bloc<ImageEvent, ImageState> {
//   final PexelsApiService pexelsApiService;
//   int page = 1;
//   bool isFetching = false;

//   ImageBloc(this.pexelsApiService) : super(ImageLoading()) {
//     on<LoadImages>((event, emit) async {
//       if (isFetching) return;
//       isFetching = true;

//       try {
//         final images = await pexelsApiService.fetchClothingModelImages(event.page);
//         if (images.isEmpty) {
       
//           emit(ImageLoaded(state is ImageLoaded ? (state as ImageLoaded).images : [], true));
//         } else {
          
//   // Swap the first two images in the updatedImages list
     

          

// emit(
//             ImageLoaded(
//               state is ImageLoaded ? (state as ImageLoaded).images + images : images,
//               false, 
//             ),
//           );
//           page++; 
//         }
//       } catch (error) {
//         emit(ImageError());
//       } finally {
//         isFetching = false;
//       }
//     });
//   }
// }



// reversing the images 

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  final PexelsApiService pexelsApiService;
  int page = 1;
  bool isFetching = false;

  ImageBloc(this.pexelsApiService) : super(ImageLoading()) {
    on<LoadImages>((event, emit) async {
      if (isFetching) return;
      isFetching = true;

      try {
        final images = await pexelsApiService.fetchClothingModelImages(event.page);
        if (images.isEmpty) {
//here I reversed the image

          emit(ImageLoaded(state is ImageLoaded ? (state as ImageLoaded).images.reversed.toList() : [], true));
        } else {
          final updatedImages = state is ImageLoaded ? (state as ImageLoaded).images + images : images;
        


 emit(
            ImageLoaded(
              updatedImages.reversed.toList(),
              false, 
            ),
          );
          page++; 
        }
      } catch (error) {
        emit(ImageError());
      } finally {
        isFetching = false;
      }
    });
  }
}



//swapping first two images 

// class ImageBloc extends Bloc<ImageEvent, ImageState> {
//   final PexelsApiService pexelsApiService;
//   int page = 1;
//   bool isFetching = false;

//   ImageBloc(this.pexelsApiService) : super(ImageLoading()) {
//     on<LoadImages>((event, emit) async {
//       if (isFetching) return;
//       isFetching = true;

//       try {
//         final images = await pexelsApiService.fetchClothingModelImages(event.page);
//         if (images.isEmpty) {
       
//           emit(ImageLoaded(state is ImageLoaded ? (state as ImageLoaded).images : [], true));
//         } else {
          
//   // Swap the first two images in the updatedImages list
     
//       final updatedImages = state is ImageLoaded ? (state as ImageLoaded).images + images : images;

//           if (updatedImages.length > 1) {
//             final temp = updatedImages[0];
//             updatedImages[0] = updatedImages[1];
//             updatedImages[1] = temp;
//           }
          

// emit(
//             ImageLoaded(
//               state is ImageLoaded ? (state as ImageLoaded).images + images : images,
//               false, 
//             ),
//           );
//           page++; 
//         }
//       } catch (error) {
//         emit(ImageError());
//       } finally {
//         isFetching = false;
//       }
//     });
//   }
// }
