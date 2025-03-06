import 'package:advance_budget_request_system/views/api_service.dart';
import 'package:advance_budget_request_system/views/data.dart';
import 'package:advance_budget_request_system/views/requestEntry.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Advancerequest extends StatefulWidget {
  const Advancerequest({super.key});

  @override
  State<Advancerequest> createState() => _AdvancerequestState();
}

class _AdvancerequestState extends State<Advancerequest> {
  List<AdvanceRequest> advanceRequest = [];
  List<AdvanceRequest> filteredData = [];
  final TextEditingController _searchController = TextEditingController();

  String? selectedDate;
  DateTimeRange? CustomDateRange;
  DateTimeRange? selectedDateRange;
  DateTime? startDate;
  DateTime? endDate;

  String? sortColumn;
  bool sortAscending = true;

  @override
  void initState() {
    super.initState();
    // filteredData = List.from(advanceRequest);
    // filteredData= advanceRequest;
    _fetchRequest();
  }

  void _fetchRequest() async {
    try {
      List<AdvanceRequest> advanceRequests =
          await ApiService().fetchAdvanceRequestData();
      print('Fetched Data: $advanceRequests');
      setState(() {
        advanceRequest = advanceRequests;
        filteredData = List.from(advanceRequest);
      });
    } catch (e) {
      print('Fail to request: $e');
    }
  }

  //Date Filter Function
  // ignore: unused_element
  String _getDateFilterDisplayName(String value) {
    switch (value) {
      case 'today':
        return 'Today';
      case 'this_week':
        return 'This week';
      case 'this_month':
        return 'This month';
      case 'this_year':
        return 'This year';
      case 'custom_date':
        return 'Custom Date';

      default:
        return value;
    }
  }

  String _getThisWeekRange() {
    DateTime now = DateTime.now();
    DateTime startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    DateTime endOfWeek = startOfWeek.add(const Duration(days: 6));
    return '${DateFormat.yMd().format(startOfWeek)} - ${DateFormat.yMd().format(endOfWeek)}';
  }

  String _getThisMonthRange() {
    DateTime now = DateTime.now();
    DateTime startOfMonth = DateTime(now.year, now.month, 1);
    DateTime endOfMonth = DateTime(now.year, now.month + 1, 0);
    return '${DateFormat.yMd().format(startOfMonth)} - ${DateFormat.yMd().format(endOfMonth)}';
  }

  String _getThisYearRange() {
    DateTime now = DateTime.now();
    DateTime startOfYear = DateTime(now.year, 1, 1);
    DateTime endOfYear = DateTime(now.year, 12, 31);
    return '${DateFormat.yMd().format(startOfYear)} - ${DateFormat.yMd().format(endOfYear)}';
  }

  void _filterByCustomDate(DateTimeRange chooseDateRange) {
    _filterDataByDateRange(chooseDateRange);
  }

  void _filterDataByDateRange(DateTimeRange dateRange) {
    setState(() {
      filteredData = advanceRequest.where((data) {
        return data.date
                .isAfter(dateRange.start.subtract(const Duration(days: 1))) &&
            data.date.isBefore(dateRange.end.add(const Duration(days: 1)));
      }).toList();
    });
  }

  void _filterByPresetDate(String filterType) {
    DateTime now = DateTime.now();
    DateTimeRange? dateRange;

    switch (filterType) {
      case 'today':
        dateRange = DateTimeRange(start: now, end: now);
        break;
      case 'this_week':
        DateTime startOfWeek = now.subtract(Duration(days: now.weekday - 1));
        DateTime endOfWeek = startOfWeek.add(const Duration(days: 6));
        dateRange = DateTimeRange(start: startOfWeek, end: endOfWeek);
        break;
      case 'this_month':
        DateTime startOfMonth = DateTime(now.year, now.month, 1);
        DateTime endOfMonth = DateTime(now.year, now.month + 1, 0);
        dateRange = DateTimeRange(start: startOfMonth, end: endOfMonth);
        break;
      case 'this_year':
        DateTime startOfYear = DateTime(now.year, 1, 1);
        DateTime endOfYear = DateTime(now.year, 12, 31);
        dateRange = DateTimeRange(start: startOfYear, end: endOfYear);
        break;

      default:
        return;
    }
    // ignore: unnecessary_null_comparison
    if (dateRange != null) {
      setState(() {
        selectedDate = filterType;
      });
      _filterDataByDateRange(dateRange);
    }
  }

  void _showCustomDateRangeDialog(BuildContext context) {
    DateTime initialStartDate = DateTime.now();
    DateTime initialEndDate = DateTime.now();

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Choose Custom Date"),
            content: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("Select Start Date: "),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        DateTime? chooseStartDate = await showDatePicker(
                            context: context,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(3000));

                        if (chooseStartDate != null) {
                          setState(() {
                            initialStartDate = chooseStartDate;
                          });
                        }
                      },
                      child: Text(DateFormat.yMd().format(initialStartDate))),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('Select End Date: '),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        DateTime? chooseEndDate = await showDatePicker(
                            context: context,
                            initialDate: initialEndDate,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(3000));

                        if (chooseEndDate != null) {
                          setState(() {
                            initialEndDate = chooseEndDate;
                          });
                        }
                      },
                      child: Text(DateFormat.yMd().format(initialEndDate)))
                ],
              );
            }),
            actions: [
              TextButton(
                  onPressed: () {
                    if (initialStartDate.isBefore(initialEndDate) ||
                        initialStartDate.isAtSameMomentAs(initialEndDate)) {
                      setState(() {
                        CustomDateRange = DateTimeRange(
                            start: initialStartDate, end: initialEndDate);
                        selectedDate = 'custom_date';
                      });
                      _filterByCustomDate(CustomDateRange!);
                      Navigator.of(context).pop();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Please choose available Dates.")));
                    }
                  },
                  child: const Text("Apply")),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel')),
            ],
          );
        });
  }

  //Search function
  void _searchData(String query) {
    setState(() {
      List<AdvanceRequest> sourceData = advanceRequest;
      filteredData = sourceData.where((data) {
        final requestNo = data.requestNo.toLowerCase();
        final requestCode = data.requestCode.toLowerCase();
        final requestType = data.requestType.toLowerCase();
        final currency = data.currency.toLowerCase();
        final requester = data.requester.toLowerCase();
        final status = data.status.toLowerCase();
        final String searchLower = query.toLowerCase();

        return requestNo.contains(searchLower) ||
            requestCode.contains(searchLower) ||
            requestType.contains(searchLower) ||
            currency.contains(searchLower) ||
            requester.contains(searchLower) ||
            status.contains(searchLower);
      }).toList();
    });
  }

  //Sorting
  // void _sortDataColumn(String column) {
  //   setState(() {
  //     if (sortColumn == column) {
  //       sortAscending = !sortAscending;
  //     } else {
  //       sortColumn = column;
  //       sortAscending = true;
  //     }

  //     filteredData.sort((a, b) {
  //       final aValue = a[column]?.toString();
  //       final bValue = b[column]?.toString();
  //       if (aValue == null || bValue == null) return 0;

  //       if (sortAscending) {
  //         return aValue.compareTo(bValue);
  //       } else {
  //         return bValue.compareTo(aValue);
  //       }
  //     });
  //   });
  // }
  void _sortDataColumn(String column) {
    setState(() {
      if (sortColumn == column) {
        sortAscending = !sortAscending;
      } else {
        sortColumn = column;
        sortAscending = true;
      }

      filteredData.sort((a, b) {
        dynamic aValue;
        dynamic bValue;

        switch (column) {
          case 'Date':
            aValue = a.date;
            bValue = b.date;
            break;
          case 'RequestNo':
            aValue = a.requestNo;
            bValue = b.requestNo;
            break;
          case 'RequestCode':
            aValue = a.requestCode;
            bValue = b.requestCode;
            break;
          case 'RequestType':
            aValue = a.requestType;
            bValue = b.requestType;
            break;
          case 'RequestAmount':
            aValue = a.requestAmount;
            bValue = b.requestAmount;
            break;
          case 'Currency':
            aValue = a.currency;
            bValue = b.currency;
            break;
          case 'Status':
            aValue = a.status;
            bValue = b.status;
            break;
          case 'Requester':
            aValue = a.requester;
            bValue = b.requester;
            break;
          default:
            return 0;
        }

        if (aValue == null || bValue == null) return 0;

        if (sortAscending) {
          return aValue.compareTo(bValue);
        } else {
          return bValue.compareTo(aValue);
        }
      });
    });
  }

  Widget _buildHeaderCell(String label, String column) {
    return InkWell(
      onTap: () {
        _sortDataColumn(column);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
            if (sortColumn == column)
              Icon(
                sortAscending ? Icons.arrow_upward : Icons.arrow_downward,
                size: 16,
              )
          ],
        ),
      ),
    );
  }

  //refresh Data
  void _refreshData() {
    setState(() {
      _searchController.clear();
      selectedDateRange = null;
      selectedDate = null;
      startDate = null;
      endDate = null;
      filteredData = List.from(advanceRequest);
      sortColumn = null;
      sortAscending = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text(
            "Advance Request Information",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Container(
                // width: MediaQuery.of(context).size.width * 0.2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: DropdownButton(
                      value: selectedDate,
                      hint: const Text('Filter by Date'),
                      items: [
                        DropdownMenuItem(
                            value: 'today',
                            child: Tooltip(
                              message: DateFormat.yMd().format(DateTime.now()),
                              child: const Text('Today'),
                            )),
                        DropdownMenuItem(
                            value: 'this_week',
                            child: Tooltip(
                              message: _getThisWeekRange(),
                              child: const Text('This Week'),
                            )),
                        DropdownMenuItem(
                            value: 'this_month',
                            child: Tooltip(
                              message: _getThisMonthRange(),
                              child: const Text('This Month'),
                            )),
                        DropdownMenuItem(
                            value: 'this_year',
                            child: Tooltip(
                              message: _getThisYearRange(),
                              child: const Text('This Year'),
                            )),
                        DropdownMenuItem(
                            value: 'custom_date',
                            child: Tooltip(
                              message: CustomDateRange != null
                                  ? '${DateFormat.yMd().format(CustomDateRange!.start)} - ${DateFormat.yMd().format(CustomDateRange!.end)}'
                                  : 'Choose a Custom Date Range',
                              child: const Text('Custom Date'),
                            )),
                      ],
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedDate = newValue;
                          if (newValue == 'custom_date') {
                            _showCustomDateRangeDialog(context);
                          } else if (newValue != null) {
                            _filterByPresetDate(newValue);
                          }
                        });
                      }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: 50,
                  child: TextField(
                    controller: _searchController,
                    onChanged: _searchData,
                    decoration: const InputDecoration(
                      labelText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  // width: MediaQuery.of(context).size.width*0.1,
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 150, 212, 234),
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AdvanceRequestEntry(
                                      onRequestAdded: (newRequest) async {
                                        try {
                                          await ApiService()
                                              .postAdvanceRequest(newRequest);
                                             // print("newRequest: $newRequest");
                                          _fetchRequest();
                                        } catch (e) {
                                          print("Failed to add request: $e");
                                        }
                                      },
                                    )));
                      },
                      icon: const Icon(Icons.add),
                      color: Colors.black,
                    ),
                    IconButton(
                      onPressed: () {
                        _refreshData();
                      },
                      icon: const Icon(Icons.refresh),
                      color: Colors.black,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.download),
                      color: Colors.black,
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(0),
            child: Container(
              child: Table(
                border: const TableBorder.symmetric(
                  inside: BorderSide(color: Colors.grey, width: 1),
                  outside: BorderSide(color: Colors.grey, width: 1),
                ),
                columnWidths: const {
                  0: FlexColumnWidth(0.6),
                  1: FlexColumnWidth(0.5),
                  2: FlexColumnWidth(0.5),
                  3: FlexColumnWidth(0.5),
                  4: FlexColumnWidth(0.6),
                  5: FlexColumnWidth(0.5),
                  6: FlexColumnWidth(0.5),
                  7: FlexColumnWidth(0.5),
                  8: FlexColumnWidth(0.3)
                },
                children: [
                  TableRow(
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 167, 230, 232)),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: _buildHeaderCell("Request Date", "Date"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: _buildHeaderCell("Request No", "RequestNo"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                              _buildHeaderCell("Request Code", "RequestCode"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                              _buildHeaderCell("Request Type", "RequestType"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: _buildHeaderCell(
                              "Request Amount", "RequestAmount"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: _buildHeaderCell("Currency", "Currency"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: _buildHeaderCell("Status", "Status"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: _buildHeaderCell("Requester", "Requester"),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Action",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ])
                ],
              ),
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              child: Table(
                border: const TableBorder.symmetric(
                  inside: BorderSide(color: Colors.grey, width: 1),
                  outside: BorderSide(color: Colors.black, width: 1),
                ),
                columnWidths: const {
                  0: FlexColumnWidth(0.6),
                  1: FlexColumnWidth(0.5),
                  2: FlexColumnWidth(0.5),
                  3: FlexColumnWidth(0.5),
                  4: FlexColumnWidth(0.6),
                  5: FlexColumnWidth(0.5),
                  6: FlexColumnWidth(0.5),
                  7: FlexColumnWidth(0.5),
                  8: FlexColumnWidth(0.3)
                },
                children: filteredData.map((row) {
                // filteredData.asMap().entries.map((entry) {
                  // int index = entry.key;
                  // var row = entry.value;
                  return TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(row.date.toString()),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(row.requestNo),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(row.requestCode),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(row.requestType),

                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(row.requestAmount.toString()),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(row.currency),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(row.status),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(row.requester),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.more_horiz_outlined,
                                color: Colors.black),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ]);
                }).toList(),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
