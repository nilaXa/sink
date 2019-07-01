import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:sink/common/calendar.dart';
import 'package:sink/models/category.dart';
import 'package:sink/models/entry.dart';
import 'package:sink/theme/palette.dart';

@immutable
class AppState {
  final List<Entry> removed;
  final Set<Category> categories;
  // TODO: must be at least one default category
  final bool areCategoriesLoading;
  final Set<Color> availableColors;
  final DateTime selectedMonth;
  final List<DateTime> viewableMonths;

  AppState({
    removed,
    categories,
    areCategoriesLoading,
    availableColors,
    selectedMonth,
    viewableMonths,
  })  : this.removed = removed ?? List(),
        this.categories = categories ?? Set(),
        this.areCategoriesLoading = areCategoriesLoading ?? true,
        this.availableColors = availableColors ?? Set.from(materialColors),
        this.selectedMonth = selectedMonth ?? firstDay(DateTime.now()),
        this.viewableMonths =
            viewableMonths ?? List.from([firstDay(DateTime.now())]);

  AppState copyWith({
    List<Entry> removed,
    Set<Category> categories,
    bool areCategoriesLoading,
    Set<Color> availableColors,
    DateTime selectedMonth,
    List<DateTime> viewableMonths,
  }) {
    return AppState(
      removed: removed ?? this.removed,
      categories: categories ?? this.categories,
      areCategoriesLoading: areCategoriesLoading ?? this.areCategoriesLoading,
      availableColors: availableColors ?? this.availableColors,
      selectedMonth: selectedMonth ?? this.selectedMonth,
      viewableMonths: viewableMonths ?? this.viewableMonths,
    );
  }
}
