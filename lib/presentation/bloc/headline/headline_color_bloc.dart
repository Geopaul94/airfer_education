
import 'package:airfer_education/presentation/bloc/headline/headline_color_event.dart';
import 'package:airfer_education/presentation/bloc/headline/headline_color_state.dart';

import 'package:airfer_education/utilities/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContainerBloc extends Bloc<ContainerEvent, ContainerState> {
  ContainerBloc() : super(ContainerState(2)) {
    on<SelectContainerEvent>((event, emit) {
      emit(ContainerState(event.index));
    });
  }

  Color getBackgroundColor(int index) {
    return state.selectedIndex == index ?white : black;
  }

  Color getTextColor(int index) {
    return state.selectedIndex == index ? black : grey;
  }
}