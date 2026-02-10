import 'package:flutter/material.dart';

import 'components/admin_drawer.dart';
import 'components/stat_card.dart';

class AdminDashboardView extends StatelessWidget {
  const AdminDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Dashboard"),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.notifications_none))
        ],
      ),
      drawer: const AdminDrawer(), // ✅ منوی کناری اضافه شد
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome back, Erfan! 👋",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),

            // ✅ شبکه کارت‌های آمار
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: MediaQuery.of(context).size.width > 600 ? 4 : 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: const [
                AdminStatCard(
                    title: "Sales",
                    value: "\$12.5k",
                    icon: Icons.monetization_on,
                    color: Colors.green),
                AdminStatCard(
                    title: "Products",
                    value: "142",
                    icon: Icons.inventory_2,
                    color: Colors.blue),
                AdminStatCard(
                    title: "Orders",
                    value: "85",
                    icon: Icons.shopping_cart,
                    color: Colors.orange),
                AdminStatCard(
                    title: "Users",
                    value: "1.2k",
                    icon: Icons.people,
                    color: Colors.purple),
              ],
            ),

            const SizedBox(height: 32),
            const Text("Recent Activities",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),

            // یک لیست فرضی برای فعالیت‌های اخیر
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) => Card(
                child: ListTile(
                  leading: const CircleAvatar(child: Icon(Icons.person)),
                  title: Text("New order from User #$index"),
                  subtitle: const Text("2 minutes ago"),
                  trailing: const Icon(Icons.chevron_right),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
