import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

/// The CalendarVerticalView.
///
/// CalendarVerticalView let users select a date, or a range of dates.
/// A horizontal calendar is a display of the month.
/// Switching between months and years is carried out using
/// the left and right buttons.
/// You can also switch between months using picker view.
/// You can create CalendarVerticalView by specifying parameters:
/// DateTime? startDate - The start date of calendar.
/// DateTime? endDate - The end date of calendar.
/// DateTime? currentDate - The start date of calendar
/// String? locale - The day in the month which will be disaplyed.
/// ValueChanged<List<DateTime?>>?? onChangedRangeDates - The notification of
/// changing start and end date.
/// CalendarVerticalViewScheme? scheme - The visual scheme
/// of CalendarVerticalView.
///
class CalendarVerticalView extends StatefulWidget {
  const CalendarVerticalView({
    this.selectedStartDate,
    this.selectedEndDate,
    this.currentDate,
    this.notActiveAfterDate,
    this.locale,
    this.onChangedRangeDates,
    this.startDate,
    this.endDate,
    this.scheme,
  });

  final DateTime? selectedStartDate;
  final DateTime? selectedEndDate;
  final DateTime? currentDate;
  final DateTime? notActiveAfterDate;
  final String? locale;
  final ValueChanged<List<DateTime?>>? onChangedRangeDates;
  final DateTime? startDate;
  final DateTime? endDate;
  final CalendarVerticalViewScheme? scheme;

  @override
  State<StatefulWidget> createState() => _CalendarVerticalViewState();
}

class _CalendarVerticalViewState extends State<CalendarVerticalView> {
  late CalendarDatesDataSource dataSource;
  late CalendarVerticalViewScheme scheme;
  late String locale;

  final ScrollController _scrollController = ScrollController();
  final Key _centerKey = const ValueKey<String>('center-list-key');

  final ValueNotifier<List<DateTime?>> _datesRangeNotifier =
      ValueNotifier<List<DateTime?>>(
    <DateTime?>[],
  );

  @override
  void initState() {
    super.initState();
    locale = widget.locale ?? 'ru';
    initializeDateFormatting(locale);
    dataSource = CalendarDatesDataSource(
      widget.startDate,
      widget.endDate,
      widget.currentDate,
      widget.notActiveAfterDate,
      _datesRangeNotifier,
      widget.selectedStartDate,
      widget.selectedEndDate,
    );

    _datesRangeNotifier.addListener(
      () {
        widget.onChangedRangeDates?.call(_datesRangeNotifier.value);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? CalendarVerticalViewScheme(theme: theme);

    switch (dataSource.scrollState) {
      case CalendarScrollState.fixed:
        return Expanded(
          child: CustomScrollView(
            controller: _scrollController,
            center: _centerKey,
            slivers: <Widget>[
              if (widget.startDate != null && widget.endDate != null)
                buildStartToCurrentDateList(),
              buildCurrenDatetList(),
              buildCurrentToEndList(),
            ],
          ),
        );
      case CalendarScrollState.inifinity:
        return Expanded(
          child: CustomScrollView(
            controller: _scrollController,
            center: _centerKey,
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return CalendarVerticalPageView(
                      dataSource.getMonth(index == 0 ? -1 : -(index + 1)),
                      locale,
                      onTap: (DateTime? date) => setState(
                        () {
                          dataSource.didTapAtDate(date);
                        },
                      ),
                      scheme: scheme.pageViewScheme,
                    );
                  },
                ),
              ),
              SliverList(
                key: _centerKey,
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return CalendarVerticalPageView(
                      dataSource.getMonth(index),
                      locale,
                      onTap: (DateTime? date) => setState(
                        () {
                          dataSource.didTapAtDate(date);
                        },
                      ),
                      scheme: scheme.pageViewScheme,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      case CalendarScrollState.fixedStart:
        return Expanded(
          child: CustomScrollView(
            controller: _scrollController,
            center: _centerKey,
            slivers: <Widget>[
              if (widget.startDate != null) buildStartToCurrentDateList(),
              buildCurrenDatetList(),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return CalendarVerticalPageView(
                      dataSource.getMonth(index + 1),
                      locale,
                      onTap: (DateTime? date) => setState(
                        () {
                          dataSource.didTapAtDate(date);
                        },
                      ),
                      scheme: scheme.pageViewScheme,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      case CalendarScrollState.fixedEnd:
        return Expanded(
          child: CustomScrollView(
            controller: _scrollController,
            center: _centerKey,
            slivers: <Widget>[
              if (widget.endDate != null)
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return CalendarVerticalPageView(
                        dataSource.getMonth(index == 0 ? -1 : -(index + 1)),
                        locale,
                        onTap: (DateTime? date) => setState(
                          () {
                            dataSource.didTapAtDate(date);
                          },
                        ),
                        scheme: scheme.pageViewScheme,
                      );
                    },
                  ),
                ),
              buildCurrenDatetList(),
              buildCurrentToEndList(),
            ],
          ),
        );
    }
  }

  Widget buildCurrenDatetList() {
    return SliverList(
      key: _centerKey,
      delegate: SliverChildBuilderDelegate(
        childCount: 1,
        (BuildContext context, int index) {
          return CalendarVerticalPageView(
            dataSource.getMonth(index),
            locale,
            onTap: (DateTime? date) => setState(
              () {
                dataSource.didTapAtDate(date);
              },
            ),
            scheme: scheme.pageViewScheme,
          );
        },
      ),
    );
  }

  Widget buildStartToCurrentDateList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: dataSource.getDayMonthDifferenceCount(
          widget.startDate!,
          widget.currentDate ?? DateTime.now(),
        ),
        (BuildContext context, int index) {
          return CalendarVerticalPageView(
            dataSource.getMonth(index == 0 ? -1 : -(index + 1)),
            locale,
            onTap: (DateTime? date) => setState(
              () {
                dataSource.didTapAtDate(date);
              },
            ),
            scheme: scheme.pageViewScheme,
          );
        },
      ),
    );
  }

  Widget buildCurrentToEndList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: dataSource.getDayMonthDifferenceCount(
          widget.currentDate ?? DateTime.now(),
          widget.endDate,
        ),
        (BuildContext context, int index) {
          return CalendarVerticalPageView(
            dataSource.getMonth(index + 1),
            locale,
            onTap: (DateTime? date) => setState(
              () {
                dataSource.didTapAtDate(date);
              },
            ),
            scheme: scheme.pageViewScheme,
          );
        },
      ),
    );
  }
}
