import 'package:flutter/material.dart';
import '../widgets/riwayat_tab_view.dart';
import '../widgets/kabar_tab_view.dart';
import '../widgets/status_tab_view.dart';

class InboxScreen extends StatefulWidget {
  final VoidCallback? onBackToHome;
  final int initialTabIndex;

  const InboxScreen({
    super.key,
    this.onBackToHome,
    this.initialTabIndex = 0,
  });

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: widget.initialTabIndex,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F8FD),
      appBar: AppBar(
        backgroundColor: const Color(0xFF58329E),
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
          onPressed: () {
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            } else if (widget.onBackToHome != null) {
              widget.onBackToHome!();
            }
          },
        ),
        title: const Text(
          'Inbox',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Column(
        children: [
          // White TabBar Container
          Container(
            color: Colors.white,
            child: TabBar(
              controller: _tabController,
              indicatorColor: const Color(0xFF58329E),
              indicatorWeight: 3.0,
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: const Color(0xFF58329E),
              unselectedLabelColor: const Color(0xFF888496),
              labelStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
              unselectedLabelStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              tabs: const [
                Tab(text: 'Riwayat'),
                Tab(text: 'Kabar'),
                Tab(text: 'Status'),
              ],
            ),
          ),
          const Divider(
            height: 1,
            thickness: 1,
            color: Color(0xFFEBE6F3),
          ),

          // Tab views
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                RiwayatTabView(),
                KabarTabView(),
                StatusTabView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
