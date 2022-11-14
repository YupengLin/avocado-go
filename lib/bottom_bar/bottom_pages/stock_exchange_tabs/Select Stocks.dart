import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:avocado_go/Custom_BlocObserver/Custtom_app_bar/Custtom_app_bar.dart';
import 'package:avocado_go/Custom_BlocObserver/notifire_clor.dart';
import 'package:avocado_go/bottom_bar/bottom_pages/stock_exchange_tabs/Buy%20Stock.dart';
import '../../../Custom_BlocObserver/custtom_slock_list/custtom_slock_list.dart';
import '../../../Custom_BlocObserver/custtom_textfild/consttom_textfild.dart';
import '../../../utils/medeiaqury/medeiaqury.dart';
import '../../../services/index.dart';
import '../model/nft.dart';

class SelectStocks extends StatefulWidget {
  const SelectStocks({Key? key}) : super(key: key);

  @override
  State<SelectStocks> createState() => _SelectStocksState();
}

class _SelectStocksState extends State<SelectStocks> {
  late ColorNotifier notifier;
  final Services _service = Services();
  List<NFT> _nfts = <NFT>[];

  @override
  void initState() {
    super.initState();
    fetch1monthTrend();
  }

  void fetch1monthTrend() async {
    var response = await _service.api.getTrending1Month();

    for (var nft in response) {
      this._nfts.add(NFT.fromJson(nft));
    }
    setState(() {});
  }

  List<Widget> getNftCard(height) {
    var items = <Widget>[];
    for (var nft in this._nfts) {
      items.add(
        GestureDetector(
          onTap: () {
            Get.to(const BuyStock());
          },
          child:
              custtom_button(nft.thumbnail, nft.name, "", "\$326,23", "2,87%"),
        ),
      );
      items.add(
        SizedBox(height: height / 30),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    List<Widget> nftCards = getNftCard(height);
    return Scaffold(
      backgroundColor: notifier.getwihitecolor,
      appBar: CustomAppBar(
          notifier.getwihitecolor, "NFT lists", notifier.getblck,
          height: height / 15),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: Column(
            children: [
              SizedBox(height: height / 15),
              Center(
                child: Customtextfild.textField(
                    "Search NFT collections..",
                    notifier.getbluecolor,
                    Icons.search_rounded,
                    notifier.getgrey,
                    notifier.getblck,
                    notifier.getblck,
                    notifier.getgrey),
              ),
              SizedBox(height: height / 30),
              ...nftCards,
            ],
          ),
        ),
      ),
    );
  }
}
