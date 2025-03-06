import 'dart:convert';
import 'dart:ui';

import 'package:advance_budget_request_system/views/projectEntry.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class ProjectInfo extends StatefulWidget {
  @override
  _ProjectInfoState createState() => _ProjectInfoState();
}

class _ProjectInfoState extends State<ProjectInfo> {
  String selectedRequester = '';
  String? selectedDate;
  DateTime? startDate;
  DateTime? endDate;

  dynamic hoverRow;
  String? selectedFilter;
  DateTimeRange? selectedDateRange;
  DateTimeRange? CustomDateRange;
  TextEditingController _searchController = TextEditingController();
  final numberFormat = NumberFormat("#,##0");

  String? sortColumn;
  bool sortAscending = true;
  List<Map<String, dynamic>> filterData = [];
  String searchQuery = '';

  final List<Map<String, dynamic>> chooseBudgetCodes = [];
  // String selectedBudgetCode = "";
  // List<String> selectedBudgetCodes = [];
  //Set<String> selectedBudgetCodes = {};

  List<String> selectedFilters = [];
  List<Map<String, dynamic>> projectData = [
    {
      'Date': '2025-02-01',
      'ProjectID': 'PRJ-2324-001',
      'Description': 'Final Project',
      'Total Budget Amount': '100,000 ',
      'Currency': 'MMK', // 'Approved Amount': '60,000 MMK',''
      'Department': 'IT',
      'Requestable': 'Yes',
      "BudgetDetails": [
       {'Budget Code': 'B001', 'Description': 'Marketing Campaign'},
    {'Budget Code': 'B002', 'Description': 'Short Trip'},
      ],
    },
    {
      'Date': '2025-02-01',
      'ProjectID': 'PRJ-2324-002',
      'Description': 'Final Project',
      'Total Budget Amount': '200,000 ',
      'Currency': 'MMK', // 'Approved Amount': '60,000 MMK',''
      'Department': 'IT',
      'Requestable': 'Yes',
      "BudgetDetails": [
        {'Budget Code': 'B004', 'Description': 'On Job Training'},
    {'Budget Code': 'B005', 'Description': 'Team Building'},

      ],
    },
    {
      'Date': '2025-02-01',
      'ProjectID': 'PRJ-2324-003',
      'Description': 'Final Project',
      'Total Budget Amount': '50000,000 ',
      'Currency': 'MMK', // 'Approved Amount': '60,000 MMK',''
      'Department': 'IT',
      'Requestable': 'Yes',
      "BudgetDetails": [
        {"Budget Code": "B2001", "Description": "IT Equipment"},
        {"Budget Code": "B21123", "Description": "Maintenance"},
      ],
    },
    {
      'Date': '2025-02-01',
      'ProjectID': 'PRJ-2324-004',
      'Description': 'Final Project',
      'Total Budget Amount': '10100,000 ',
      'Currency': 'MMK', // 'Approved Amount': '60,000 MMK',''
      'Department': 'IT',
      'Requestable': 'Yes',
      "BudgetDetails": [
        {"Budget Code": "B2001", "Description": "IT Equipment"},
        {"Budget Code": "B21123", "Description": "Maintenance"},
      ],
    },
    {
      'Date': '2025-02-01',
      'ProjectID': 'PRJ-2324-005',
      'Description': 'Final Project',
      'Total Budget Amount': '100,000 ',
      'Currency': 'USD', // 'Approved Amount': '60,000 MMK',''
      'Department': 'IT',
      'Requestable': 'Yes',
      "BudgetDetails": [
        {"Budget Code": "B2001", "Description": "IT Equipment"},
        {"Budget Code": "B21123", "Description": "Maintenance"},
      ],
    },
    {
      'Date': '2025-02-01',
      'ProjectID': 'PRJ-2324-006',
      'Description': 'Final Project',
      'Total Budget Amount': '100,000 ',
      'Currency': 'MMK',
      'Department': 'Admin', // 'Approved Amount': '60,000 MMK',''
      'Requestable': 'Yes',
      "BudgetDetails": [
        {"Budget Code": "B2001", "Description": "IT Equipment"},
        {"Budget Code": "B21123", "Description": "Maintenance"},
      ],
    },
    {
      'Date': '2025-02-01',
      'ProjectID': 'PRJ-2324-007',
      'Description': 'Final Project',
      'Total Budget Amount': '6600,000 ',
      'Currency': 'MMK', // 'Approved Amount': '60,000 MMK',''
      'Department': 'HR',
      'Requestable': 'Yes',
      "BudgetDetails": [
        {"Budget Code": "B2001", "Description": "IT Equipment"},
        {"Budget Code": "B21123", "Description": "Maintenance"},
      ],
    },
    {
      'Date': '2025-02-01',
      'ProjectID': 'PRJ-2324-008',
      'Description': 'Final Project',
      'Total Budget Amount': '100,000 ',
      'Currency': 'MMK', // 'Approved Amount': '60,000 MMK',''
      'Department': 'Marketing',
      'Requestable': 'Yes',
      "BudgetDetails": [
        {"Budget Code": "B2001", "Description": "IT Equipment"},
        {"Budget Code": "B21123", "Description": "Maintenance"},
      ],
    },
    {
      'Date': '2025-02-01',
      'ProjectID': 'PRJ-2324-009',
      'Description': 'Final Project',
      'Total Budget Amount': '100,000 ',
      'Currency': 'USD', // 'Approved Amount': '60,000 MMK',''
      'Department': 'Finance',
      'Requestable': 'Yes',
      "BudgetDetails": [
        {"Budget Code": "B2001", "Description": "IT Equipment"},
        {"Budget Code": "B21123", "Description": "Maintenance"},
      ],
    },
    {
      'Date': '2025-02-01',
      'ProjectID': 'PRJ-2324-010',
      'Description': 'Final Project',
      'Total Budget Amount': '100,000 ',
      'Currency': 'MMK', // 'Approved Amount': '60,000 MMK',''
      'Department': 'HR',
      'Requestable': 'Yes',
      "BudgetDetails": [
        {"Budget Code": "B2001", "Description": "IT Equipment"},
        {"Budget Code": "B21123", "Description": "Maintenance"},
      ],
    },
    {
      'Date': '2025-02-01',
      'ProjectID': 'PRJ-2324-011',
      'Description': 'Final Project',
      'Total Budget Amount': '1100,000 ',
      'Currency': 'MMK', // 'Approved Amount': '60,000 MMK',''
      'Department': 'IT',
      'Requestable': 'Yes',
      "BudgetDetails": [
        {"Budget Code": "B2001", "Description": "IT Equipment"},
        {"Budget Code": "B21123", "Description": "Maintenance"},
      ],
    },
    {
      'Date': '2025-02-01',
      'ProjectID': 'PRJ-2324-012',
      'Description': 'Final Project',
      'Total Budget Amount': '1000,000 ',
      'Currency': 'MMK', // 'Approved Amount': '60,000 MMK',''
      'Department': 'IT',
      'Requestable': 'No',
      "BudgetDetails": [
        {"Budget Code": "B2001", "Description": "IT Equipment"},
        {"Budget Code": "B21123", "Description": "Maintenance"},
      ],
    },
    {
      'Date': '2025-02-01',
      'ProjectID': 'PRJ-2324-013',
      'Description': 'Final Project',
      'Total Budget Amount': '500,000 ',
      'Currency': 'MMK', // 'Approved Amount': '60,000 MMK',''
      'Department': 'IT',
      'Requestable': 'No',
      "BudgetDetails": [
        {"Budget Code": "B2001", "Description": "IT Equipment"},
        {"Budget Code": "B21123", "Description": "Maintenance"},
      ],
    },
    {
      'Date': '2025-02-01',
      'ProjectID': 'PRJ-2324-014',
      'Description': 'Final Project',
      'Total Budget Amount': '100,000 ',
      'Currency': 'MMK', // 'Approved Amount': '60,000 MMK',''
      'Department': 'Admin',
      'Requestable': 'Yes',
      "BudgetDetails": [
        {"Budget Code": "B2001", "Description": "IT Equipment"},
        {"Budget Code": "B21123", "Description": "Maintenance"},
      ],
    },
    {
      'Date': '2025-02-01',
      'ProjectID': 'PRJ-2324-015',
      'Description': 'Final Project',
      'Total Budget Amount': '100,000 ',
      'Currency': 'MMK', // 'Approved Amount': '60,000 MMK',''
      'Department': 'IT',
      'Requestable': 'Yes',
      "BudgetDetails": [
        {"Budget Code": "B2001", "Description": "IT Equipment"},
        {"Budget Code": "B21123", "Description": "Maintenance"},
      ],
    },
    {
      'Date': '2025-02-01',
      'ProjectID': 'PRJ-2324-016',
      'Description': 'Final Project',
      'Total Budget Amount': '7000,000 ',
      'Currency': 'MMK', // 'Approved Amount': '60,000 MMK',''
      'Department': 'IT',
      'Requestable': 'Yes',
      "BudgetDetails": [
        {"Budget Code": "B2001", "Description": "IT Equipment"},
        {"Budget Code": "B21123", "Description": "Maintenance"},
      ],
    },
    {
      'Date': '2025-02-01',
      'ProjectID': 'PRJ-2324-017',
      'Description': 'Final Project',
      'Total Budget Amount': '1,000 ',
      'Currency': 'USD', // 'Approved Amount': '60,000 MMK',''
      'Department': 'IT',
      'Requestable': 'Yes',
      "BudgetDetails": [
        {"Budget Code": "B2001", "Description": "IT Equipment"},
        {"Budget Code": "B21123", "Description": "Maintenance"},
      ],
    },
    {
      'Date': '2025-02-01',
      'ProjectID': 'PRJ-2324-018',
      'Description': 'Final Project',
      'Total Budget Amount': '100,000 ',
      'Currency': 'MMK', // 'Approved Amount': '60,000 MMK',''
      'Department': 'IT',
      'Requestable': 'No',
      "BudgetDetails": [
        {"Budget Code": "B2001", "Description": "IT Equipment"},
        {"Budget Code": "B21123", "Description": "Maintenance"},
      ],
    },
    {
      'Date': '2025-02-01',
      'ProjectID': 'PRJ-2324-019',
      'Description': 'Final Project',
      'Total Budget Amount': '100,000 ',
      'Currency': 'MMK', // 'Approved Amount': '60,000 MMK',''
      'Department': 'IT',
      'Requestable': 'Yes',
      "BudgetDetails": [
        {"Budget Code": "B2001", "Description": "IT Equipment"},
        {"Budget Code": "B21123", "Description": "Maintenance"},
      ],
    },
    {
      'Date': '2025-02-01',
      'ProjectID': 'PRJ-2324-020',
      'Description': 'Final Project',
      'Total Budget Amount': '100,000 ',
      'Currency': 'MMK', // 'Approved Amount': '60,000 MMK',''
      'Department': 'IT',
      'Requestable': 'Yes',
      "BudgetDetails": [
        {"Budget Code": "B2001", "Description": "IT Equipment"},
        {"Budget Code": "B21123", "Description": "Maintenance"},
      ],
    },
    {
      'Date': '2025-02-01',
      'ProjectID': 'PRJ-2324-021',
      'Description': 'Final Project',
      'Total Budget Amount': '100,000 ',
      'Currency': 'MMK', // 'Approved Amount': '60,000 MMK',''
      'Department': 'IT',
      'Requestable': 'No',
      "BudgetDetails": [
        {"Budget Code": "B2001", "Description": "IT Equipment"},
        {"Budget Code": "B21123", "Description": "Maintenance"},
      ],
    },
    {
      'Date': '2025-02-01',
      'ProjectID': 'PRJ-2324-022',
      'Description': 'Final Project',
      'Total Budget Amount': '100,000 ',
      'Currency': 'MMK', // 'Approved Amount': '60,000 MMK',''
      'Department': 'IT',
      'Requestable': 'Yes',
      "BudgetDetails": [
        {"Budget Code": "B2001", "Description": "IT Equipment"},
        {"Budget Code": "B21123", "Description": "Maintenance"},
      ],
    },
  ];

  final List<Map<String, dynamic>> BudgetDetails = [
    {'Budget Code': 'B001', 'Description': 'Marketing Campaign'},
    {'Budget Code': 'B002', 'Description': 'Short Trip'},
    {'Budget Code': 'B003', 'Description': 'Foreign Trip'},
    {'Budget Code': 'B004', 'Description': 'On Job Training'},
    {'Budget Code': 'B005', 'Description': 'Team Building'},
    {'Budget Code': 'B006', 'Description': 'Software Purchase'},
    {'Budget Code': 'B007', 'Description': 'New Equipment'},
    {'Budget Code': 'B008', 'Description': 'Annual Conference'},
    {'Budget Code': 'B009', 'Description': 'Miscellaneous'},
  ];

  // ignore: unused_element
  void _addProject(List<Map<String, String>> newProject) {
    setState(() {
      projectData.addAll(newProject);
    });
  }

  // ignore: unused_element
  void _refreshData() {
    setState(() {
      _searchController.clear();
      selectedDateRange = null;
      selectedDate=null;
      startDate = null;
      endDate = null;
      filterData = projectData;
    });
  }
  void _sortDataColumn(String column) {
    setState(() {
      if (sortColumn == column) {
        sortAscending = !sortAscending;
      } else {
        sortColumn = column;
        sortAscending = true;
      }

      filterData.sort((a, b) {
        final aValue = a[column];
        final bValue = b[column];
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

  void _searchData(String query) {
    setState(() {
      List<Map<String, dynamic>> sourceData = projectData;
      filterData = sourceData.where((Map<String, dynamic> data) {
        final tripID = data['ProjectID'].toLowerCase();
        final description = data['Description'].toLowerCase();
        final totalAmt = data['Total Budget Amount'];
        final currency = data['Currency'].toLowerCase();
        final department = data['Department'].toLowerCase();
        final requestable = data['Requestable'].toLowerCase();
        final String searchLower = query.toLowerCase();

        return tripID.contains(searchLower) ||
            description.contains(searchLower) ||
            totalAmt.contains(searchLower) ||
            currency.contains(searchLower) ||
            department.contains(searchLower) ||
            requestable.contains(searchLower);
      }).toList();
    });
  }

  void _deleteConfirmation(int index) async {
    bool? confirm = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Delete Confirmation"),
            content: const Text("Are you sure to delete this Project Data?"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: const Text("Cancel")),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: const Text("Delete")),
            ],
          );
        });

    if (confirm != null && confirm) {
      setState(() {
        projectData.removeAt(index);
      });
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Project Data is deleted successfully")));
    }
  }

  TextEditingController searchController = TextEditingController();
  // Stores selected values

  final Map<String, List<String>> dropdownOptions = {
    "Currency": ["MMK", "USD"],
    "Department": [
      'HR',
      'IT',
      'Finance',
      'Admin',
      'Production',
      'Engineering',
      'Marketing',
      'Sales'
    ],
    "Status": ["Active", "Inactive"],
  };

  void initState() {
    super.initState();
    filterData = List.from(projectData);
  }

  void _filterTable(String query) {
    setState(() {
      if (query.isEmpty) {
        filterData = List.from(projectData); // Reset when search is empty
      } else {
        filterData = projectData.where((row) {
          return row.values.any(
              (value) => value.toLowerCase().contains(query.toLowerCase()));
        }).toList();
      }
    });
  }

// ignore: unused_element
  void _removeFilters(String filter) {
    setState(() {
      selectedFilters.remove(filter);
      _filterTable(_searchController.text);
    });
  }

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
      filterData = projectData.where((data) {
        final dateString = data['Date'];
        if (dateString == null) return false;
        final DateTime? dataDate =
            dateString is DateTime ? dateString : DateTime.tryParse(dateString);
        if (dataDate == null) return false;
        return dataDate
                .isAfter(dateRange.start.subtract(const Duration(days: 1))) &&
            dataDate.isBefore(dateRange.end.add(const Duration(days: 1)));
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
                  child: const Text('Cancel'))
            ],
          );
        });
  }

  // ignore: unused_element
  void _openAdvancedSearchDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AdvancedSearchDialog(
          dropdownOptions: dropdownOptions,
          onFilterSelected: (selectedValue) {
            setState(() {
              if (!selectedFilters.contains(selectedValue)) {
                selectedFilters.add(selectedValue);
              }
              _updateSearchField(); // Add selected value to the list
            });
          },
        );
      },
    );
  }

  void _updateSearchField() {
    searchController.text = selectedFilters.join(", ");
  }

  // ignore: unused_element
  void _clearSearch() {
    setState(() {
      selectedFilters.clear();
      searchController.clear();
    });
  }

  void _removeFilter(String value) {
    setState(() {
      selectedFilters.remove(value); // Remove the selected value
    });
  }

  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Project Information"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
             // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
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
                
                const SizedBox(width: 30),
                Container(
                  width: MediaQuery.of(context).size.width *0.4, 
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.search, color: Colors.black),
                        onPressed: () {
                          _filterTable(_searchController.text);
                        },
                      ),
                      Expanded(
                  
                        child: TextField(
                          
                          controller: _searchController,
                          onChanged: _searchData,
                         
                          textAlign: TextAlign.start,
                          decoration: const InputDecoration(
                            hintText: "Search",
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(8.0),
                            isCollapsed: true,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        alignment: WrapAlignment.start,
                        spacing: 8.0,
                        runSpacing: 4.0,
                        children: selectedFilters.map((filter) {
                          return Chip(
                            label: Text(filter),
                            backgroundColor: Colors.blue.shade100,
                            deleteIcon: const Icon(Icons.close,
                                size: 18, color: Colors.red),
                            onDeleted: () => _removeFilter(filter),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),

                // 🏷️ Wrap for Filters

                const SizedBox(
                    width: 10), // Space between search bar and filters button
                     // Space between search bar and filters button

                // IconButton(
                // IconButton(
                //   icon: const Icon(Icons.more_vert),
                //   // label: const Text("Filters"),
                //   // label: const Text("Filters"),
                //   onPressed: _openAdvancedSearchDialog,
                // ),

                // SizedBox(width: MediaQuery.of(context).size.width / 3.3),
                SizedBox(width: 10),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 150, 212, 234),
                    borderRadius: BorderRadius.circular(10),
                   // border: Border.all(color: Colors.greenAccent),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.add, color: Colors.black),
                        onPressed: () async {
                          // ignore: unused_local_variable
                          final List<Map<String, dynamic>>? newProject =
                              await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  EntryForm(onProjectAdded: (newProject) {
                                setState(() {
                                  _refreshData();
                                  projectData.addAll(newProject);
                                });
                              }),
                            ),
                          );
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.refresh, color: Colors.black),
                        onPressed: () {
                          _refreshData();
                          setState(() {});
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.download, color: Colors.black),
                        onPressed: () {
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ), 
              ],
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                const SizedBox(height: 10),
                Container(
                  width: screenWidth,
                  child: Table(
                    border: const TableBorder.symmetric(
                      inside: BorderSide(color: Colors.grey, width: 1),
                      outside: BorderSide(color: Colors.grey, width: 1),
                    ),
                    columnWidths: const {
                      0: FlexColumnWidth(0.6),
                      1: FlexColumnWidth(0.7),
                      2: FlexColumnWidth(2.5),
                      3: FlexColumnWidth(1.0),
                      4: FlexColumnWidth(0.5),
                      5: FlexColumnWidth(0.7),
                      6: FlexColumnWidth(0.7),
                      7: FlexColumnWidth(0.8),
                     // 8: FlexColumnWidth(0.8),
                    },
                    children:  [
                      TableRow(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 167, 230, 232)),
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child:  _buildHeaderCell("Date","Date",),
                             
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                               child:  _buildHeaderCell("ProjectID","ProjectID",),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                               child:  _buildHeaderCell("Description","Description",),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                                child:  _buildHeaderCell("Total Budget Amount","Total Budget Amount",),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                           child:  _buildHeaderCell("Currency","Currency",),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child:  _buildHeaderCell("Department","Department",),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child:  _buildHeaderCell("Requestable","Requestable",),
                          ),
                         
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Action",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Table(
                  border: const TableBorder.symmetric(
                    inside: BorderSide(color: Colors.grey, width: 1),
                    outside: BorderSide(color: Colors.black, width: 1),
                  ),
                  columnWidths: const {
                   
                    0: FlexColumnWidth(0.6),
                    1: FlexColumnWidth(0.7),
                    2: FlexColumnWidth(2.5),
                    3: FlexColumnWidth(1.0),
                    4: FlexColumnWidth(0.5),
                    5: FlexColumnWidth(0.7),
                    6: FlexColumnWidth(0.7),
                    7: FlexColumnWidth(0.8),
                   // 8: FlexColumnWidth(0.8),
                  },
                  children: filterData.asMap().entries.map(
                    (entry) {
                      int index = entry.key;
                      var row = entry.value;

                      return TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(row['Date'] ?? '2025-2-7'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(row['ProjectID'] ?? ''),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(row['Description'] ?? 'fd'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(row['Total Budget Amount'] ?? '0'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(row['Currency'] ?? 'USD'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(row['Department'] ?? ''),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(row['Requestable'] ?? 'Pending'),
                          ),
                         
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => EditProject(
                                            projectData: projectData[index],
                                            onProjectUpdated: (updatedProject) {
                                              setState(() {
                                                _ProjectDetailState();
                                                _refreshData();
                                                projectData[index] =
                                                    updatedProject;
                                              });
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                    icon: const Icon(Icons.edit),
                                    color: Colors.black),
                                IconButton(
                                    onPressed: () {
                                      _deleteConfirmation(
                                          projectData.indexOf(row));
                                    },
                                    icon: const Icon(Icons.delete),
                                    color: Colors.black),
                               
                                IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ProjectDetailPage(projectData: projectData[index],
                                         selectedBudgetCodes: [],
                                          selectedBudgetCode: '', 
                                          budgetDetails: [], 
                                        ),
                                  ),
                                );
                              },
                              icon: const Icon(Icons.more_horiz_outlined),
                              color: Colors.black),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EditProject extends StatefulWidget {
  final Map<String, dynamic> projectData;
  final Function(Map<String, dynamic>) onProjectUpdated;
  const EditProject(
      {Key? key, required this.projectData, required this.onProjectUpdated})
      : super(key: key);

  @override
  State<EditProject> createState() => _EditProjectState();
}

class _EditProjectState extends State<EditProject> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _projectController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
 List<Map<String, dynamic>> chooseBudgetCodes = [];
  final List<Map<String, dynamic>> BudgetDetails = [
    {'Budget Code': 'B001', 'Description': 'Marketing Campaign'},
    {'Budget Code': 'B002', 'Description': 'Short Trip'},
    {'Budget Code': 'B003', 'Description': 'Foreign Trip'},
    {'Budget Code': 'B004', 'Description': 'On Job Training'},
    {'Budget Code': 'B005', 'Description': 'Team Building'},
    {'Budget Code': 'B006', 'Description': 'Software Purchase'},
    {'Budget Code': 'B007', 'Description': 'New Equipment'},
    {'Budget Code': 'B008', 'Description': 'Annual Conference'},
    {'Budget Code': 'B009', 'Description': 'Miscellaneous'},
  ];

  String _selectedCurrency = 'MMK';
  final List<String> departments = [
    'HR',
    'IT',
    'Finance',
    'Admin',
    'Production',
    'Engineering',
    'Marketing',
    'Sales'
  ];
  String? _selectedDepartment;

  @override
  void initState() {
    super.initState();
    _projectController.text = widget.projectData['ProjectID'];
    _descriptionController.text = widget.projectData['Description'];
    _amountController.text = widget.projectData['Total Budget Amount'];
    _selectedCurrency = widget.projectData['Currency'];
    _selectedDepartment = widget.projectData['Department'];
    dateController.text = widget.projectData['Date'];
    if (widget.projectData['BudgetDetails'] is String) {
      chooseBudgetCodes = List<Map<String, dynamic>>.from(
          jsonDecode(widget.projectData['BudgetDetails']));
    } else {
      chooseBudgetCodes =
          List<Map<String, dynamic>>.from(widget.projectData['BudgetDetails']);
    }

  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      Map<String, dynamic> updatedProject = {
        'Date': dateController.text,
        'ProjectID': _projectController.text,
        'Description': _descriptionController.text,
        'Total Budget Amount': _amountController.text,
        'Currency': _selectedCurrency,
        'Department': _selectedDepartment ?? '',
        'Requestable':
            widget.projectData['Requestable'],
            'BudgetDetails': jsonEncode(chooseBudgetCodes), // Keep the existing status
      };

      widget.onProjectUpdated(updatedProject);
      Navigator.pop(context);
    }
  }

  void _clearText() {
    setState(() {
      _projectController.clear();
      _descriptionController.clear();
      _amountController.clear();
      _selectedDepartment = null;
      _selectedCurrency = 'MMK';
    });
  }

void _showBudgetCodeDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 20.0, left: 16.0, right: 16.0, bottom: 16.0),
                child: Column(
                  children: [
                    const Text(
                      "Select Budget Code",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.35,
                        height: MediaQuery.of(context).size.height * 0.7,
                        child: SingleChildScrollView(
                          child: DataTable(
                            showCheckboxColumn: false,
                            columns: const [
                              DataColumn(label: Text("")),
                              DataColumn(label: Text("Budget Code")),
                              DataColumn(label: Text("Description")),
                            ],
                            rows: BudgetDetails.map((budgetCode) {
                              bool isSelected = chooseBudgetCodes.any((code) =>
                                  code['Budget Code'] ==
                                  budgetCode['Budget Code']);

                              return DataRow(
                                cells: [
                                  DataCell(
                                    isSelected
                                        ? IconButton(
                                            icon: const Icon(Icons.check_circle,
                                                color: Colors.green),
                                            onPressed: () {
                                              setState(() {
                                                chooseBudgetCodes.removeWhere(
                                                    (code) =>
                                                        code['Budget Code'] ==
                                                        budgetCode[
                                                            'Budget Code']);
                                              });
                                              Navigator.pop(context);
                                              _showBudgetCodeDialog();
                                            },
                                          )
                                        : const SizedBox.shrink(),
                                  ),
                                  DataCell(Text(budgetCode['Budget Code'])),
                                  DataCell(Text(budgetCode['Description'])),
                                ],
                                onSelectChanged: (selected) {
                                  if (selected != null && selected) {
                                    if (isSelected) {
                                      // Show error message if the budget code is already selected
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                              "This budget code is already selected."),
                                          duration: Duration(seconds: 2),
                                        ),
                                      );
                                    } else {
                                      setState(() {
                                        chooseBudgetCodes.add(budgetCode);
                                      });
                                      Navigator.pop(context);
                                    }
                                  }
                                },
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: IconButton(
                  icon: const Icon(Icons.cancel_outlined, color: Colors.black),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _deleteBudgetCode(int index) {
   
    if (index >= 0 && index < chooseBudgetCodes.length) {
    setState(() {
      chooseBudgetCodes.removeAt(index);
    });
  }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Project Request"),
      ),
      body:Center(
        child: Container(
          color: const Color.fromARGB(255, 103, 207, 177),
          width: MediaQuery.of(context).size.width * 0.5,
          child: Padding(
            padding: const EdgeInsets.all(7.0),
            child: SingleChildScrollView(
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              'Edit Project Request',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  ListTile(
                                    title: TextFormField(
                                      readOnly: true,
                                      controller: _projectController,
                                      decoration: const InputDecoration(
                                          labelText: "Enter Project Code"),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Enter Project Code";
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  ListTile(
                                    title: TextFormField(
                                      controller: _descriptionController,
                                      decoration: const InputDecoration(
                                          labelText: "Enter Project Description"),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Enter Project Description";
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  ListTile(
                                    title: TextFormField(
                                      controller: _amountController,
                                      decoration: const InputDecoration(
                                        labelText: "Enter Total Amount",
                                      ),
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r'^\d*\.?\d*')),
                                      ],
                                      validator: (value) {
                                          if (value == null || value.isEmpty) {
                                          return "Enter Total Amount";
                                        }
                                        final amount = double.tryParse(value);
                                        if (amount == null) {
                                          return "Enter a valid amount";
                                        }
                                        if (amount <= 0) {
                                          return "Your Request Amount must be greater than 0";
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                                child: Column(
                              children: [
                                ListTile(
                                  title: TextFormField(
                                    controller: dateController,
                                    decoration: const InputDecoration(
                                        labelText: "Request Date"),
                                    readOnly: true,
                                  ),
                                ),
                                ListTile(
                                  title: DropdownButtonFormField(
                                    decoration: const InputDecoration(),
                                    value: _selectedCurrency,
                                    items: ['MMK', 'USD'].map((currency) {
                                      return DropdownMenuItem(
                                          value: currency,
                                          child: Text(currency));
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedCurrency = value!;
                                      });
                                    },
                                  ),
                                ),
                                ListTile(
                                  title: DropdownButtonFormField(
                                    decoration: const InputDecoration(
                                      labelText: "Choose your Department",
                                    ),
                                    value: _selectedDepartment,
                                    items: departments.map((department) {
                                      return DropdownMenuItem(
                                          value: department,
                                          child: Text(department));
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedDepartment = value!;
                                      });
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Choose your Department";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            )),
                          ],
                        ),
                       
                         Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              ElevatedButton(
                                  onPressed: _showBudgetCodeDialog,
                                  style: ElevatedButton.styleFrom(
                                    textStyle: const TextStyle(fontSize: 15),
                                    backgroundColor: Colors.green,
                                    foregroundColor: Colors.black,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 12),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: const Text("Add Budget Code")),
                              const SizedBox(height: 10),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: DataTable(
                                    border: TableBorder.all(),
                                    showCheckboxColumn: false,
                                    columns: const [
                                      DataColumn(label: Text("Budget Code")),
                                      DataColumn(label: Text("Description")),
                                      DataColumn(label: Text("Action")),
                                    ],
                                    rows: chooseBudgetCodes.map((budgetCode) {
                                      final index =
                                          chooseBudgetCodes.indexOf(budgetCode);
                                      return DataRow(cells: [
                                        DataCell(
                                            Text(budgetCode['Budget Code'])),
                                        DataCell(
                                            Text(budgetCode['Description'])),
                                        DataCell(IconButton(
                                            onPressed: () {
                                              _deleteBudgetCode(index);
                                            },
                                            icon: const Icon(Icons.delete)))
                                      ]);
                                    }).toList(),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: _submitForm,
                              style: ElevatedButton.styleFrom(
                                textStyle: const TextStyle(
                                  fontSize: 15,
                                ),
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text("Update"),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            ElevatedButton(
                              onPressed: _clearText,
                              style: ElevatedButton.styleFrom(
                                textStyle: const TextStyle(
                                  fontSize: 15,
                                ),
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text("Clear"),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AdvancedSearchDialog extends StatefulWidget {
  final Map<String, List<String>> dropdownOptions;
  final Function(String) onFilterSelected;

  AdvancedSearchDialog({
    required this.dropdownOptions,
    required this.onFilterSelected,
  });

  @override
  _AdvancedSearchDialogState createState() => _AdvancedSearchDialogState();
}

class _AdvancedSearchDialogState extends State<AdvancedSearchDialog> {
  Map<String, String?> selectedValues = {};
  TextEditingController searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Advanced Search"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: searchTextController,
            decoration: const InputDecoration(
              labelText: "Enter search text",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          ...widget.dropdownOptions.keys.map((category) {
            return _buildDropdown(
              title: category,
              options: widget.dropdownOptions[category]!,
              selectedValue: selectedValues[category],
              onChanged: (newValue) {
                setState(() {
                  selectedValues[category] = newValue;
                });
              },
            );
          }).toList(),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Close"),
        ),
        ElevatedButton(
          onPressed: () {
            if (searchTextController.text.isNotEmpty) {
              widget.onFilterSelected(searchTextController.text);
            }

            selectedValues.forEach((key, query) {
              if (query != null) {
                widget.onFilterSelected(query);
              }
            });
            Navigator.pop(context);
          },
          child: const Text("Search"),
        ),
      ],
    );
  }

  Widget _buildDropdown({
    required String title,
    required List<String> options,
    required String? selectedValue,
    required Function(String?) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          DropdownButton<String>(
            isExpanded: true,
            value: selectedValue,
            hint: Text("Select $title"),
            items: options.map((String option) {
              return DropdownMenuItem<String>(
                value: option,
                child: Text(option),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}






class ProjectDetailPage extends StatefulWidget {
  final Map<String, dynamic> projectData;
  final List<Map<String, dynamic>> selectedBudgetCodes;
  final String selectedBudgetCode;
  final List<Map<String, dynamic>> budgetDetails;

  const ProjectDetailPage(
      {super.key,
      required this.projectData,
      required this.selectedBudgetCodes,
      required this.selectedBudgetCode,
      required this.budgetDetails});

  @override
  State<ProjectDetailPage> createState() => _ProjectDetailState();
}

class _ProjectDetailState extends State<ProjectDetailPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    List<Map<String, String>> budgetDetails = [];
    if (widget.projectData["BudgetDetails"] != null) {
      if (widget.projectData["BudgetDetails"] is String) {
        budgetDetails = _parseBudgetDetails(widget.projectData["BudgetDetails"]);
      } else if (widget.projectData["BudgetDetails"] is List) {
        budgetDetails =
            List<Map<String, String>>.from(widget.projectData["BudgetDetails"]);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Project Details"),
        backgroundColor: const Color.fromRGBO(100, 207, 198, 0.855),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRow("Project Code", widget.projectData["ProjectID"], "Amount",
                widget.projectData["Total Budget Amount"]),
            const SizedBox(height: 10),
            _buildRow("Description", widget.projectData["Description"], "Currency",
                widget.projectData["Currency"]),
            const SizedBox(height: 10),
            _buildRow("Date", widget.projectData["Date"], "Name",
                widget.projectData["Name"] ?? 'May'),
            const SizedBox(height: 10),
            _buildRow("Department", widget.projectData["Department"], "Requestable",
                widget.projectData["Requestable"]),
            const SizedBox(height: 10),
            const SizedBox(height: 20),
            const Text("Budget Details",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 40,
            ),
            _buildBudgetTable(),
            const SizedBox(height: 40),
            Center(
                child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Back"),
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(
                  fontSize: 15,
                ),
                backgroundColor: Colors.green,
                foregroundColor: Colors.black,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(
      String label1, String value1, String label2, String? value2) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildInlineText(label1, value1),
          if (label2.isNotEmpty) _buildInlineText(label2, value2 ?? ""),
        ],
      ),
    );
  }

  Widget _buildInlineText(String label, String value) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: RichText(
          text: TextSpan(
            style: const TextStyle(fontSize: 16, color: Colors.black),
            children: [
              TextSpan(
                  text: "$label: ",
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: value),
            ],
          ),
        ),
      ),
    );
  }

Widget _buildBudgetTable() {
    return Table(
      border: TableBorder.all(),
      children: [
        const TableRow(
          decoration: BoxDecoration(color: Colors.lightBlueAccent),
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Budget Code",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Description",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        ),
        ...widget.budgetDetails.map((budget) => TableRow(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(budget["Budget Code"]),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(budget["Description"]),
                ),
              ],
            )),
      ],
    );
  }
}

// ignore: unused_element
Widget _buildTableCell(String text, {bool isHeader = false}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      text,
      style: TextStyle(
        fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
        fontSize: 16,
      ),
    ),
  );
}

List<Map<String, String>> _parseBudgetDetails(String budgetDetails) {
  try {
    // Replace single quotes with double quotes for JSON parsing
    String formattedString = budgetDetails.replaceAll("'", '"');
    // Parse the JSON string into a List of Maps
    List<dynamic> parsedList = jsonDecode(formattedString);
    // Convert to List<Map<String, String>>
    return parsedList.map((item) => Map<String, String>.from(item)).toList();
  } catch (e) {
    print("Error parsing BudgetDetails: $e");
    return [];
  }
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    // appBar: AppBar(
    //   title: const Text("Project Infomation"),
    // ),
  );
}

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: const Text("Project Infomation"),
//     ),
//   );
// }
