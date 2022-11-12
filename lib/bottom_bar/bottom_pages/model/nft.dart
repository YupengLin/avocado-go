import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:avocado_go/utils/logs.dart';

class NFT {
  String contract_address = "";
  String name = "";
  String thumbnail = "";
  NFT(this.contract_address, this.name, this.thumbnail);

  // final int salary;

  NFT.fromJson(Map<String, dynamic> parsedJson) {
    try {
      contract_address = parsedJson['contract_address'].toString();
      name = parsedJson['name'].toString();
      thumbnail = parsedJson['thumbnail'].toString();
    } catch (e, trace) {
      printLog(trace);
      printLog('🔴 Get product $name :${e.toString()}');
    }
  }
}

class NFTDataSource extends DataGridSource {
  NFTDataSource({required List<NFT> nft}) {
    dataGridRows = nft
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
              DataGridCell<String>(
                  columnName: 'contract address',
                  value: dataGridRow.contract_address),
              DataGridCell<String>(columnName: 'name', value: dataGridRow.name),
              DataGridCell<String>(
                  columnName: 'thumbnail', value: dataGridRow.thumbnail),
            ]))
        .toList();
  }

  List<DataGridRow> dataGridRows = [];

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
      return Container(
          alignment: dataGridCell.columnName == 'contract address'
              ? Alignment.centerRight
              : Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            dataGridCell.value.toString(),
            overflow: TextOverflow.ellipsis,
          ));
    }).toList());
  }

  void updateDataGridSource() {
    notifyListeners();
  }
}
