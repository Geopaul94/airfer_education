import 'package:airfer_education/data/repository/photo_fetching.dart';
import 'package:airfer_education/presentation/bloc/photos/photos_event.dart';
import 'package:airfer_education/presentation/bloc/photos/photos_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


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
       
          emit(ImageLoaded(state is ImageLoaded ? (state as ImageLoaded).images : [], true));
        } else {
          emit(
            ImageLoaded(
              state is ImageLoaded ? (state as ImageLoaded).images + images : images,
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
